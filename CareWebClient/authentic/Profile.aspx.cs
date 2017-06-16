using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CareWebClient.careService;

namespace CareWebClient.authentic
{
    public partial class Profile : System.Web.UI.Page
    {
        protected LoginDetails SessionDetails;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["login_session"] == null)
                {
                    Response.Redirect("~/login.aspx");
                }
                SessionDetails = (LoginDetails)Session["login_session"];
                if (SessionDetails != null) {
                userImg.Src = SessionDetails.ImgPath;
                 if (SessionDetails.ImgPath != null)
                        currentImg.Src = SessionDetails.ImgPath;
                txtBusinessName.Text = SessionDetails.CenterName;
                txtStaffStrength.Text = SessionDetails.StaffStrength;
                txtPhoneNo.Text = SessionDetails.ContactNumber;
                txtEmailAddress.Text = SessionDetails.CenterEmail;
                txtWebsite.Text = SessionDetails.Website;
                txtAddress.Text = SessionDetails.CenterLocation;
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
            else
            {
                // code when post back 
                SessionDetails = (LoginDetails)Session["login_session"];
            }
           
        }

        protected void UpdateProfile(object sender, EventArgs e)
        {
            // gets all required variables from form fields
            var client = new careService.CareService1SoapClient();
            var businessName =  txtBusinessName.Text;
            var staffStrength = txtStaffStrength.Text;
            var phoneNo =       txtPhoneNo.Text;
            var email =         txtEmailAddress.Text;
            var website =       txtWebsite.Text;
            var address =       txtAddress.Text.Replace("\n", "\r\n"); ;
            var filePath =   FileUpload1.PostedFile.InputStream;
            var uploadedImg = ConvertStreamToByte(filePath);
          

            //wrap all fields in the model class
            var profileUpdates = new LoginDetails()
            {
                CareCenterId = SessionDetails.CareCenterId,
                Valid = SessionDetails.Valid,
                CenterName = businessName,
                CenterLocation = address,
                StaffStrength = staffStrength,
                CenterEmail = email,
                Website   = website,
                ContactNumber = phoneNo,
                Logo = uploadedImg,
            };

            //send it over to service to take care of it and return the result
            var passKey = (string)Session["pass_code"];
            var returnVal = client.UpdateProfile(profileUpdates);

            //obtain the new profile from the server
            var refereshVal = client.AuthenticateUserWeb(SessionDetails.Name, passKey);

            Session["login_session"] = refereshVal;

            Response.Write("<script>alert('" + returnVal.UpdateMessage + "');</script>");

            // var userId = txtUserName.Text;
            // var pass = txtPassword.Text;
            //var returnVal = client.AuthenticateUserWeb(userId, pass);
            //if (returnVal.Valid == true)
            //{
            //    //Console.WriteLine(returnVal);
            //    Session["login_session"] = returnVal;
            //    Response.Redirect("authentic/index.aspx");
            //}
            //else
            //{
            //    lblErrorMsg.Text = returnVal.LoginMessage;
            //}
        }

        protected byte[] ConvertStreamToByte(Stream input)
        {
                using (var ms = new MemoryStream())
                {
                    input.CopyTo(ms);
                    return ms.ToArray();
                }
        }
    }
}