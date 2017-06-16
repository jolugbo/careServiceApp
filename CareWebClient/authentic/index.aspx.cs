using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CareWebClient.careService;

namespace CareWebClient.authentic
{
    public partial class Index : System.Web.UI.Page
    {
        protected LoginDetails SessionDetails;
        protected decimal? CurrentBallance = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["login_session"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
             SessionDetails = (LoginDetails)Session["login_session"];
            if (SessionDetails?.TransDetails == null) return;
            var x = 0;
            while (x < SessionDetails.TransDetails.Length)
            {
                CurrentBallance = CurrentBallance + SessionDetails.TransDetails[x].PaymentMade;
                x++;
            }
            userImg.Src = SessionDetails.ImgPath;
        }
    }
}