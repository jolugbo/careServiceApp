using System;
using System.IO;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using careServiceApp.class_holders;
using System.Data.Entity;
using System.Data.Objects.SqlClient;

namespace careServiceApp
{
    /// <summary>
    /// Summary description for careService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CareService1 : System.Web.Services.WebService
    {

        private readonly CareDBEntities1 _context = new CareDBEntities1();

        [WebMethod]
        public RegDetails Register(string careCenterLoginName, string careCenterPassword, string careCenterEmail)
        {
            var regDetails = new RegDetails();
            var careCenterId = Guid.NewGuid();
            try
            {
                var uniqueNameCheck = (from center in _context.care_center_setup_tab
                                       where center.care_center_login_name == careCenterLoginName
                                       select center.care_center_login_name
                                         ).ToList();
                if (uniqueNameCheck.Count > 0)
                {
                    regDetails.RegStatus = false;
                    regDetails.RegMessage = "username already exist kindly select a new name";
                    return regDetails;
                }
                var newCareCenter = new care_center_setup_tab()
                {
                    care_center_id = careCenterId,
                    care_center_login_name = careCenterLoginName,
                    care_center_subscription_status = true,
                    care_center_password = AuthUtil.EncryptString(careCenterPassword),
                    care_center_date_registered = DateTime.Now,
                    care_center_activate_deactivate = true,
                    care_center_email = careCenterEmail,
                    care_center_folder_id = careCenterId,
                };
                _context.care_center_setup_tab.Add(newCareCenter);
                _context.SaveChanges();
                CreateUserFolder(careCenterId,careCenterId,"center");
                regDetails.RegStatus = true;
                regDetails.RegMessage = "Account created successfully kindly login with your details";
                return regDetails;
            }
            catch (Exception ex)
            {

                regDetails.RegStatus = false;
                regDetails.RegMessage = "Something went wrong while creating account kindly try again later";
                return regDetails;
            }

        }

        [WebMethod]
        public RegDetails RegisterStaff(Staffs newStaff, Guid careCenterId)
        {
            var regDetails = new RegDetails();
            var staffId = Guid.NewGuid();
            try
            {
                var uniqueNameCheck = (from staff in _context.care_center_staffs
                                       where staff.care_staff_login_name == newStaff.CareStaffLoginName
                                       select staff.care_staff_login_name
                                         ).ToList();
                if (uniqueNameCheck.Count > 0)
                {
                    regDetails.RegStatus = false;
                    regDetails.RegMessage = "username already exist kindly supply a new name";
                    return regDetails;
                }
                var newSaffReg = new care_center_staffs()
                {
                     care_staff_id = staffId,
                     care_staff_login_name = newStaff.CareStaffLoginName,
                     care_staff_password = AuthUtil.EncryptString(newStaff.CareStaffPassword),
                     care_staff_gender = newStaff.Gender,
                     care_center_id= careCenterId,
                     care_staff_name = newStaff.CareStaffName,
                     care_staff_contact_number = newStaff.CareStaffContactNumber,
                     care_staff_email = newStaff.CareStaffEmail,
                     care_staff_date_registered = DateTime.Now,
                     care_staff_employment_status = true,
                };
                _context.care_center_staffs.Add(newSaffReg);
                _context.SaveChanges();
                CreateUserFolder(careCenterId, staffId, "staff");
                regDetails.RegStatus = true;
                regDetails.RegMessage = "Account created successfully";
                return regDetails;
            }
            catch (Exception ex)
            {

                regDetails.RegStatus = false;
                regDetails.RegMessage = "Something went wrong while creating account kindly try again later";
                return regDetails;
            }

        }

        [WebMethod]
        public LoginDetails AuthenticateUserWeb(string name, string password)
        {
            var details = new LoginDetails();
            var pass = AuthUtil.EncryptString(password);
            var validClient = (from center in _context.care_center_setup_tab
                where center.care_center_login_name == name
                      && center.care_center_password == pass
                select new
                {
                    center_id = center.care_center_id,
                    center_name = center.care_center_name,
                    center_location = center.care_center_location,
                    subscription_status = center.care_center_subscription_status,
                    activate_deactivate = center.care_center_activate_deactivate,
                    staff_strength = center.care_center_staff_strength,
                    folder_id = center.care_center_folder_id,
                    center_email = center.care_center_email,
                    contact_number = center.care_center_contact_number,
                    userName = center.care_center_login_name,
                    webSite = center.care_center_website,
                    imgPath = center.care_center_image_path,
                }
            ).FirstOrDefault();



            if (validClient != null)
            {
                details.Name = validClient.userName;
                details.CareCenterId = validClient.center_id;
                details.Valid = true;
                details.CenterName = validClient.center_name;
                details.CenterLocation = validClient.center_location;
                details.SubscriptionStatus = validClient.subscription_status;
                details.ActivateDeactivate = validClient.activate_deactivate;
                details.StaffStrength = validClient.staff_strength;
                details.FolderId = validClient.folder_id.ToString();
                details.CenterEmail = validClient.center_email;
                details.ContactNumber = validClient.contact_number;
                details.Website = validClient.webSite;
                details.ImgPath = validClient.imgPath;
                details.LoginMessage = validClient.userName + " login successfull";
                var careCenterLog = (from logs in _context.care_center_log
                    where logs.care_center_id == validClient.center_id
                    orderby logs.care_center_last_login_date descending
                    select new
                    {
                        last_login_date = logs.care_center_last_login_date
                    }).FirstOrDefault();
                details.LastLoginDate = careCenterLog != null ? careCenterLog.last_login_date : DateTime.Now;


                var paymentHistory = (from paymentDetails in _context.care_center_invoice
                    select new
                    {
                        PaymentInvoiced = paymentDetails.care_center_bookeeping_details.payment_amount,
                        paymentMade = paymentDetails.payment_made,
                        paymentMode = paymentDetails.payment_type,
                        paymentDesc = paymentDetails.care_center_bookeeping_details.payment_description,
                        kidName = paymentDetails.care_center_kiddies.care_kiddie_firstname + " " + paymentDetails.care_center_kiddies.care_kiddie_lastname + " " + paymentDetails.care_center_kiddies.care_kiddie_lastname,
                        receiptNo = paymentDetails.receipt_no,
                    }).ToList();

                var paymentHistoryDetails = new Payment[paymentHistory.Count];
                var x = 0;
                if (paymentHistory.Count > 0)
                {
                    while (x < paymentHistory.Count)
                    {

                        paymentHistoryDetails[x] =
                            new Payment
                            {
                                PaymentDescription = paymentHistory[x].paymentDesc,
                                PaymentInvoiced = paymentHistory[x].PaymentInvoiced,
                                ReceiptNo = paymentHistory[x].receiptNo,
                                PaymentMade = paymentHistory[x].paymentMade,
                                PaymenType = paymentHistory[x].paymentMode,
                            };
                        x++;
                    }
                }
                details.TransDetails = paymentHistoryDetails;
                var auditLog = new care_center_log()
                {
                    care_center_log_details = Guid.NewGuid(),
                    care_center_id = validClient.center_id,
                    care_center_last_login_date = DateTime.Now,
                };

                _context.care_center_log.Add(auditLog);
                _context.SaveChanges();
            }
            else
            {
                details.Valid = false;
                details.LoginMessage = "login failed for user " + name;
            }
            return details;
        }

        [WebMethod]
        public UpdateDetails UpdateProfile(LoginDetails profileChangesDetails)
        {
            var responsedetails = new UpdateDetails();
            try
            {

           
            var careCenter = _context.care_center_setup_tab.Find(profileChangesDetails.CareCenterId);
                var imagePathHolder = "";
            if (careCenter != null)
            {
                if (profileChangesDetails.Logo != null)
                {
                    imagePathHolder =  UploadImage(careCenter.care_center_id.ToString(), profileChangesDetails.Logo);
                }
                careCenter.care_center_name = profileChangesDetails.CenterName;
                careCenter.care_center_staff_strength = profileChangesDetails.StaffStrength;
                careCenter.care_center_contact_number = profileChangesDetails.ContactNumber;
                careCenter.care_center_location = profileChangesDetails.CenterLocation;
                careCenter.care_center_website = profileChangesDetails.Website;
                careCenter.care_center_email = profileChangesDetails.CenterEmail;
                careCenter.care_center_image_path = imagePathHolder;
                }
                _context.SaveChanges();
                responsedetails.UpdateStatus = true;
                responsedetails.UpdateMessage = "Your profile has been successfully updated";
            }
            catch (Exception e)
            {

                responsedetails.UpdateStatus = false;
                responsedetails.UpdateMessage = "Please try to update later";
                Console.WriteLine(e);
                return responsedetails;
            }
            return responsedetails;
        }

        [WebMethod]
        public CareKiddieDetails[] GetCareCenterKiddiesDetails(Guid centerId)
        {
            var parent = new Parent();
            CareKiddieDetails[] details = null;
           var kiddiesDetails = (from detail in _context.care_center_kiddies
                where detail.care_center_id == centerId
                select new
                {
                    kiddieId = detail.care_kiddie_id,
                    lastName = detail.care_kiddie_lastname,
                    firstName = detail.care_kiddie_firstname,
                    otherName = detail.care_kiddie_othername,
                    kiddieDob = detail.care_kiddie_DOB,
                    bloodGroup = detail.care_kiddie_blood_group,
                    genoType = detail.care_kiddie_genotype,
                    photoPath = detail.care_kiddie_profile_photo_path,
                    kidGender = detail.care_kiddie_gender,
                    parentId = detail.care_parent_id,
                    //PaymentDetails
                    //Parents
                    //Activities
                    //Pictures
                }
            ).ToList();
            var x = 0;
            if (kiddiesDetails.Count > 0)
            {
                 details = new CareKiddieDetails[kiddiesDetails.Count];
                while (x < kiddiesDetails.Count)
                {
                    var kidid = kiddiesDetails[x].kiddieId;
                    //get list of payment details partaining to current kid
                    var paymentDetails = (from payment in _context.care_center_invoice
                        where payment.care_kiddie_id == kidid
                          select new
                        {
                            paymentMade = payment.payment_made,
                            paymentInvoiced = payment.care_center_bookeeping_details.payment_amount,
                            paymentMode = payment.payment_type,
                            paymentDesc = payment.care_center_bookeeping_details.payment_description,
                            paymentType = payment.payment_type,
                            receiptNo = payment.receipt_no,
                            paymentDate = payment.payment_date,
                        }).ToList();
                    //create an array of payment to bind with payment details and hold details coming from DB
                    var paymentHistoryDetails = new Payment[paymentDetails.Count];
                    var y = 0;
                    // check if any payment has been performed on the kid , if yes populate into the array of payment created earlier
                    if (paymentDetails.Count > 0)
                    {
                        while (y < paymentDetails.Count)
                        {
                            paymentHistoryDetails[y] = 
                                new Payment
                                {
                                    PaymentDescription = paymentDetails[y].paymentDesc,
                                    PaymentInvoiced = paymentDetails[y].paymentInvoiced,
                                    ReceiptNo = paymentDetails[y].receiptNo,
                                    PaymentMade = paymentDetails[y].paymentMade,
                                    PaymenType = paymentDetails[y].paymentMode,
                                    PaymentDate = paymentDetails[y].paymentDate,
                                };

                            y++;
                        }
                    }
                    //get parent details partaining to current kid
                    var parentId = kiddiesDetails[x].parentId;
                    var parentHolder = (from guardian in _context.care_center_parents
                        where guardian.care_parent_id == parentId
                        select new
                        {
                            parentId = guardian.care_parent_id,
                            parentLoginId = guardian.care_parent_login_id,
                            parentFullName = guardian.care_parent_full_name,
                            parentPhoneNumber = guardian.care_parent_contact_phone,
                            parentEmail = guardian.care_parent_contact_email,
                            occupation = guardian.care_parent_occupation,
                        }).FirstOrDefault();
                    //if the kid has a parent(single) add the bind the return value to a parent class
                    if (parentHolder != null)
                    {
                         parent = new Parent()
                        {
                            ParentId = parentHolder.parentId,
                            ParentLoginId = parentHolder.parentLoginId,
                            ParentFullName = parentHolder.parentFullName,
                            ParentContactNo = parentHolder.parentPhoneNumber,
                            ParentEmail = parentHolder.parentEmail,
                            Occupation = parentHolder.occupation,
                        };
                    }
                    //get list of activities details partaining to current kid
                    var activitList = (from activities in _context.care_center_kiddies_activity
                        where activities.care_kiddie_id == kidid
                                       select new
                        {
                            activityId = activities.care_center_activity_id,
                            kiddiesActivityId = activities.care_center_kiddies_activity_id,
                            kiddiesActivityNotes = activities.care_center_kiddies_activity_notes,
                            kiddiesActivityImagePath = activities.care_center_kiddies_activity_image_path,
                            kiddiesActivityDateUpdated = activities.care_center_kiddies_activity_date_updated,
                            activityTitle = activities.care_center_activity_setup.care_center_activity_title,
                            activityIconPath = activities.care_center_activity_setup.care_center_activity_icon_path,
                        }).ToList();
                    //create an array of Activities to bind with activities details and hold details coming from DB

                    var ActivitiesDetails = new Activities[activitList.Count];
                    var z = 0;
                    // check if any activity has been performed on the kid , if yes populate into the array of Activities created earlier
                    if (activitList.Count > 0)
                    {
                        while (z < paymentDetails.Count)
                        {
                            ActivitiesDetails[z] =
                                new Activities
                                {
                                    ActivityId = activitList[z].activityId,
                                    KiddiesActivityId = activitList[z].kiddiesActivityId,
                                    KiddiesActivityNotes = activitList[z].kiddiesActivityNotes,
                                    KiddiesActivityImagePath = activitList[z].kiddiesActivityImagePath,
                                    KiddiesActivityDateUpdated = activitList[z].kiddiesActivityDateUpdated,
                                    ActivityTitle = activitList[z].activityTitle,
                                    ActivityIconPath = activitList[z].activityIconPath,
                                };
                            z++;
                        }
                    }

                    //get list of picture details partaining to current kid
                    var pictureList = (from pictures in _context.care_photo_details
                        where pictures.care_kiddie_id == kidid
                                       select new
                        {
                            photoId = pictures.care_center_photo_id,
                            photoPath = pictures.care_center_photo_path,
                            photoDescription = pictures.care_photo_description,
                            DateCaptured = pictures.care_photo_date_captured,
                        }).ToList();
                    //create an array of Activities to bind with activities details and hold details coming from DB

                    var picturesDetails = new Pictures[pictureList.Count];
                    var w = 0;
                    // check if any activity has been performed on the kid , if yes populate into the array of Activities created earlier
                    if (pictureList.Count > 0)
                    {
                        while (w < paymentDetails.Count)
                        {
                            picturesDetails[w] = new Pictures()
                                {
                                    PhotoId = pictureList[w].photoId,
                                    PhotoPath = pictureList[w].photoPath,
                                    PhotoDescription = pictureList[w].photoDescription,
                                    DateCaptured = pictureList[w].DateCaptured,
                                };
                            w++;
                        }
                    }
                    var detail =
                        new CareKiddieDetails()
                        {
                            CarekiddieId = kiddiesDetails[x].kiddieId,
                            CarekiddieLastName = kiddiesDetails[x].lastName,
                            CarekiddieFirstName = kiddiesDetails[x].firstName,
                            CarekiddieOtherName = kiddiesDetails[x].otherName,
                            CarekiddieDob = kiddiesDetails[x].kiddieDob,
                            CarekiddieBloodGroup = kiddiesDetails[x].bloodGroup,
                            CarekiddieGenotype = kiddiesDetails[x].genoType,
                            CarekiddiePhotoPath = kiddiesDetails[x].photoPath,
                            CarekiddieGender = kiddiesDetails[x].kidGender,
                            PaymentDetails = paymentHistoryDetails,
                            Parents = parent,
                            Activities = ActivitiesDetails,
                            Pictures = picturesDetails,
                        };
                    details[x] = detail;
                    x++;
                }
            }
            return details;
        }

        [WebMethod]
        public Staffs[] GetCareCenterStaffsDetails(Guid centerId)
        {
            Staffs[] details = null;
            var staffsDetails = (from detail in _context.care_center_staffs
                                  where detail.care_center_id == centerId
                                  select new
                                  {
                                      staffId = detail.care_staff_id,
                                      loginName = detail.care_staff_login_name,
                                      gender = detail.care_staff_gender,
                                      staffName = detail.care_staff_name,
                                      contactNumber = detail.care_staff_contact_number,
                                      staffRatings = detail.care_staff_ratings,
                                      dateRegistered = detail.care_staff_date_registered,
                                      staffEmploymentStatus = detail.care_staff_employment_status,
                                      staffEmail = detail.care_staff_email,
                                  }
             ).ToList();
            var x = 0;
            if (staffsDetails.Count > 0)
            {
                details = new Staffs[staffsDetails.Count];
                while (x < staffsDetails.Count)
                {
                    var detail =
                        new Staffs()
                        {
                            CareStaffId = staffsDetails[x].staffId,
                            CareStaffLoginName = staffsDetails[x].loginName,
                            Gender = staffsDetails[x].gender,
                            CareStaffName = staffsDetails[x].staffName,
                            CareStaffContactNumber = staffsDetails[x].contactNumber,
                            CareStaffRatings = staffsDetails[x].staffRatings,
                            DateRegistered = staffsDetails[x].dateRegistered,
                            CareStaffEmploymentStatus = staffsDetails[x].staffEmploymentStatus,
                            CareStaffEmail = staffsDetails[x].staffEmail
                        };
                    details[x] = detail;
                    x++;
                }
            }
            return details;
        }

        [WebMethod]
       // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AuthenticateUserApp(string name, string password, string type)
        {
            //this.Context.Response.ContentType = "application/json; charset=utf-8";
            string pass = AuthUtil.EncryptString(password);
            bool isValidClient = false;
            if (type == "staff")
            {
                isValidClient = _context.care_center_staffs.Any(
                       x => x.care_staff_login_name == name.Trim() && x.care_staff_password == pass);
            }
            else if (type == "parent")
            {

            }
            else
            {
                isValidClient = _context.care_center_setup_tab.Any(
                       x => x.care_center_login_name == name.Trim() && x.care_center_password == pass);
            }
            //var pass2 = (from center in context.care_center_setup_tab
            //             where center.care_center_login_name == name
            //             select center.care_center_password
            //                           ).FirstOrDefault();
            //var pass3 = authUtil.DecryptString(pass2);
            this.Context.Response.Write(new JavaScriptSerializer().Serialize(isValidClient));
            //return new JavaScriptSerializer().Serialize(result);
            ///return "[['Result','" + false + "']]";
        }

        #region utilities

        private string UploadImage(string fileName, byte[] byteArray)
        {
            var file = System.IO.File.Create(Server.MapPath("~/client_folder/" + fileName + "/" + fileName+".jpg"));
            file.Write(byteArray, 0, byteArray.Length);
            var filePath = "http://localhost:55176/client_folder/" + fileName + "/" + fileName + ".jpg";
            file.Close();
            return filePath;
        }
       
        private void CreateUserFolder(Guid centerFolderId, Guid FolderId, string type)
        {
            if (type == "center")
            {
                var folder = Server.MapPath("~/centerFolders/" + centerFolderId);
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
            else if (type == "staff")
            {
                var folder = Server.MapPath("~/centerFolders/" + centerFolderId + "/staffFolders/" + FolderId);
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
            else if(type == "parent")
            {
                var folder = Server.MapPath("~/centerFolders/" + centerFolderId + "/parentFolders/" + FolderId);
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
            else if (type == "kiddie")
            {
                var folder = Server.MapPath("~/centerFolders/" + centerFolderId + "/kiddieFolders/" + FolderId);
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
        }


        #endregion
        
    }


}
