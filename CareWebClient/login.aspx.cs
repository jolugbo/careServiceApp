using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CareWebClient.class_holders;

namespace CareWebClient
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["login_session"] = null;
            }
            else
            {
                if (Session["login_session"] != null)
                {
                    Response.Redirect("default.aspx");
                }
            }
        }
        protected void Authenticate(object sender, EventArgs e) {

            Session["login_session"] = null;
            var client = new careService.CareService1SoapClient();
            var userId = txtUserName.Text;
            var pass = txtPassword.Text;
            var returnVal = client.AuthenticateUserWeb(userId, pass);
            if (returnVal.Valid == true)
            {
                //Console.WriteLine(returnVal);
                Session["pass_code"] = pass;
                Session["login_session"] = returnVal;
                Response.Redirect("authentic/index.aspx");
            }
            else
            {
                lblErrorMsg.Text = returnVal.LoginMessage;
            }
        }
    }
}