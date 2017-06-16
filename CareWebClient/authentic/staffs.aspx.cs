using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CareWebClient.careService;

namespace CareWebClient.authentic
{
    public partial class staffs : System.Web.UI.Page
    {
        protected static LoginDetails SessionDetails;
        protected static Staffs[] StaffsDetails;
        protected static Staffs StaffDetail;
        protected int StaffsCount;
        protected decimal? CurrentBallance = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["login_session"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            SessionDetails = (LoginDetails)Session["login_session"];
            if (SessionDetails != null)
            {
                userImg.Src = SessionDetails.ImgPath;
                var client = new CareService1SoapClient();
                client.Endpoint.Binding.SendTimeout = new TimeSpan(0, 4, 30);
                StaffsDetails = client.GetCareCenterStaffsDetails(SessionDetails.CareCenterId);
                Session["StaffDetails_session"] = StaffsDetails;
                StaffsCount = StaffsDetails.Length;
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }


        [WebMethod] // "{loginName:" + loginName + ",staffEmail:" +staffEmail+",staffPassword:"+staffPassword+"}",/*, string staffEmail, string staffPassword*/
        public static RegDetails RegisterStaff(string loginName,string staffEmail,string staffPassword, string gender)
        {
            var newStaff = new Staffs() {
                CareStaffId = Guid.NewGuid(),
                CareStaffLoginName = loginName,
                Gender = gender,
                DateRegistered = DateTime.Now,
                CareStaffEmploymentStatus = true,
                CareStaffPassword = staffPassword,
                CareStaffEmail = staffEmail
            };

            var client = new CareService1SoapClient();
            var response = client.RegisterStaff(newStaff, SessionDetails.CareCenterId);
            StaffsDetails = client.GetCareCenterStaffsDetails(SessionDetails.CareCenterId);
            return response;
        }
    }
}