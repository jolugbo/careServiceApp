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
    public partial class wards : System.Web.UI.Page
    {
        protected LoginDetails SessionDetails;
        protected static CareKiddieDetails[] WardDetails;
        protected static CareKiddieDetails WardDetail;
        protected int WardDetailsCount;
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
                client.Endpoint.Binding.SendTimeout = new TimeSpan(0,4, 30);
                WardDetails = client.GetCareCenterKiddiesDetails(SessionDetails.CareCenterId);
                Session["WardDetails_session"] = WardDetails;
                WardDetailsCount = WardDetails.Length;
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

        
        [WebMethod]
        public static CareKiddieDetails GetKidRecord(int current)
        {
            WardDetail = WardDetails[current];
            return WardDetail;
        }
    }
}