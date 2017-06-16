using CareWebClient.careService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CareWebClient.authentic
{
    public partial class activities : System.Web.UI.Page
    {
        protected static CareKiddieDetails[] WardDetails;
        protected static CareKiddieDetails KiddieDetails;
        protected LoginDetails SessionDetails;
        protected static int WardActivitiesCount;
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
            KiddieDetails = WardDetails[Value];
            WardActivitiesCount = KiddieDetails.Activities.Length;
            //WardDetailsCount = WardDetails.Length;
        }
    }
}