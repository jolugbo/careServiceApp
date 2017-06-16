using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace careServiceApp
{
    public static class AuthUtil
    {
        //public static string Sha512Salt = "543A1076-DC88-4A04-9C2E-07645DD443FC";
        public static string Sha512Salt = "543A1076-DC88-4A04-9C2E-07645DD443FC";
        /// <summary>
        /// Encrypts the given <see cref="string"/> with SHA1.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        public static string EncryptSha1(this string value)
        {
            return Encrypt(value, string.Empty, SHA1.Create());
        }

        /// <summary>
        /// Encrypts the given <see cref="string"/> with SHA1.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <param name="salt">The salt.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        public static string EncryptSha1(this string value, string salt)
        {
            return Encrypt(value, salt, SHA1.Create());
        }

        /// <summary>
        /// Encrypts the given <see cref="string"/> with SHA512.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        public static string EncryptSha512(this string value)
        {
            return Encrypt(value, string.Empty, SHA512.Create());
        }

        /// <summary>
        /// Encrypts the given <see cref="string"/> with SHA512.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <param name="salt">The salt.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        public static string EncryptSha512(this string value, string salt)
        {
            return Encrypt(value, salt, SHA512.Create());
        }

        /// <summary>
        /// Encrypts the given <see cref="string"/> with MD5.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        public static string EncryptMd5(this string value)
        {
            return Encrypt(value, string.Empty, MD5.Create());
        }

        /// <summary>
        /// Encrypts the given <see cref="string"/> with the given <see cref="HashAlgorithm"/>.
        /// </summary>
        /// <param name="value">The <see cref="string"/>.</param>
        /// <param name="salt">The salt.</param>
        /// <param name="hashAlgorithm">The hash algorithm.</param>
        /// <returns>The encrypted <see cref="string"/>.</returns>
        private static string Encrypt(string value, string salt, HashAlgorithm hashAlgorithm)
        {
            var valueBytes = Encoding.UTF8.GetBytes(value);
            var saltBytes = Encoding.UTF8.GetBytes(salt);

            var toHash = new byte[valueBytes.Length + saltBytes.Length];
            Array.Copy(valueBytes, 0, toHash, 0, valueBytes.Length);
            Array.Copy(saltBytes, 0, toHash, valueBytes.Length, saltBytes.Length);

            var hash = hashAlgorithm.ComputeHash(toHash);
            return BitConverter.ToString(hash).Replace("-", string.Empty);
        }




        public static String EncryptString(String inputtext)
        {


            if (inputtext == "")
                return inputtext;

            //We are now going to create an instance of theRihndael class. 
            RijndaelManaged rijndaelcipher = new RijndaelManaged();
            //First we need to turn the input strings into a byte array.
            Byte[] plaintext = System.Text.Encoding.Unicode.GetBytes(inputtext);
            //We are using salt to make it harder to guess our key using a dictionary attack.
            Byte[] salt = Encoding.ASCII.GetBytes(Sha512Salt);
            //The (Secret Key) will be generated from the specified password and salt.
            Rfc2898DeriveBytes secretkey = new Rfc2898DeriveBytes(Sha512Salt, salt);
            //Create a encryptor from the existing SecretKey bytes.
            //We use 32 bytes for the secret key.The default Rijndael key length is 256 bit = 32 bytes)
            //then 16 bytes for the IV (initialization vector).The default Rijndael IV length is 128 bit = 16 bytes)
            ICryptoTransform encryptor = rijndaelcipher.CreateEncryptor(secretkey.GetBytes(32), secretkey.GetBytes(16));
            //Create a MemoryStream that is going to hold the encrypted bytes
            MemoryStream memstream = new MemoryStream();
            //Create a CryptoStream through which we are going to be processing our data.
            //CryptoStreamMode.Write means that we are going to be writing data
            //to the stream and the output will be written in the MemoryStream
            //we have provided. (always use write mode for encryption)
            CryptoStream mycryptostream = new CryptoStream(memstream, encryptor, CryptoStreamMode.Write);
            //Start the encryption process.
            mycryptostream.Write(plaintext, 0, plaintext.Length);
            //Finish encrypting.
            mycryptostream.FlushFinalBlock();
            //Convert our encrypted data from a memoryStream into a byte array.
            Byte[] cipherbytes = memstream.ToArray();
            //Close both streams.
            memstream.Close();
            mycryptostream.Close();
            //Convert encrypted data into a base64-encoded string.
            //A common mistake would be to use an Encoding class for that.
            //It does not work, because not all byte values can be
            //represented by characters. We are going to be using Base64 encoding
            //That is designed exactly for what we are trying to do.
            String encrypteddata = Convert.ToBase64String(cipherbytes);
            //Return encrypted string.
            return encrypteddata;
        }

        public static String DecryptString(String inputtext)
        {



            if (inputtext == "")
                return inputtext;

            RijndaelManaged rijndaelcipher = new RijndaelManaged();
            Byte[] encrypteddata = Convert.FromBase64String(inputtext);
            Byte[] salt = Encoding.ASCII.GetBytes(Sha512Salt);
            Rfc2898DeriveBytes secretkey = new Rfc2898DeriveBytes(Sha512Salt, salt);
            // Create a decryptor from the existing SecretKey bytes.
            ICryptoTransform decryptor = rijndaelcipher.CreateDecryptor(secretkey.GetBytes(32), secretkey.GetBytes(16));
            MemoryStream memStream = new MemoryStream(encrypteddata);
            // Create a CryptoStream. (always use Read mode for decryption).
            CryptoStream mycryptoStream = new CryptoStream(memStream, decryptor, CryptoStreamMode.Read);
            // Since at this point we don't know what the size of decrypted data
            // will be, allocate the buffer long enough to hold EncryptedData;
            // DecryptedData is never longer than EncryptedData.
            Byte[] plaintext = new Byte[encrypteddata.Length];
            // Start decrypting.
            int decryptedcount = mycryptoStream.Read(plaintext, 0, plaintext.Length);
            memStream.Close();
            mycryptoStream.Close();
            // Convert decrypted data into a string.
            String decryptedData = Encoding.Unicode.GetString(plaintext, 0, decryptedcount);
            // Return decrypted string.  
            return decryptedData;
        }


      
    }
}