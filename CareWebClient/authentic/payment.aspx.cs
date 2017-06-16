using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CareWebClient.careService;

namespace CareWebClient.authentic
{
    public partial class payment : System.Web.UI.Page
    {
        protected static CareKiddieDetails[] WardDetails;
        protected static Payment[] KiddiePayDetails;
        protected  LoginDetails SessionDetails;
        protected static  int WardDetailsCount;
        protected static int Value;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login_session"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            SessionDetails = (LoginDetails)Session["login_session"];
            Value = Convert.ToInt32(Request.QueryString["key"]);
            if (SessionDetails == null) return;
            userImg.Src = SessionDetails.ImgPath;
            WardDetails = (CareKiddieDetails[])Session["WardDetails_session"];
            KiddiePayDetails = WardDetails[Value].PaymentDetails;
            WardDetailsCount = KiddiePayDetails.Length;
            //WardDetailsCount = WardDetails.Length;
        }
        [WebMethod]
        public static Payment[] GetKidPayRecord(int current)
        {
            KiddiePayDetails = WardDetails[current].PaymentDetails;
            WardDetailsCount = KiddiePayDetails.Length;
            return KiddiePayDetails;
        }
    }
}