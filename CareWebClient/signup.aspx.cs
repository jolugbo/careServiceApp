using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CareWebClient
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signup_user(object sender, EventArgs e) {
            var client = new careService.CareService1SoapClient();

            var userId = txtUserName.Text.Trim();
            var pass1 = txtPassword1.Text.Trim();
            var pass2 = txtPassword1.Text.Trim();
            var email = txtEmail.Text.Trim();
            if (userId == "" || pass1 == ""|| email == "" || pass2 =="")
            {
                lblErrorMsg.Text = "All form fields must be filled";
                return;
            }
            if (pass1 != pass2 )
            {
                lblErrorMsg.Text = "Password must be a match";
                return;
            }
            var returnVal = client.Register(userId, pass1, email);
            if (returnVal.RegStatus == true)
            {
                SendMail(email);
                Response.Write("<script>alert('"+ returnVal.RegMessage+ "');</script>");
                Response.Redirect("authentic/index.aspx");
            }
            else
            {
                Response.Write("<script>alert('" + returnVal.RegMessage + "');</script>");
            }
            }
        protected void SendMail(string mailto) {

            //string testmail = "ojolugbo@avante-cs.com";
            var mail = new MailMessage();
            var smtpServer = new SmtpClient("smtp.gmail.com", 587);
            mail.From = new MailAddress("jolugbofemi@gmail.com", "Jolugbo.Olufemi");
            mail.To.Add(mailto);
            mail.Subject = "this is a test email";
            mail.Body = "this is my test email body";
            smtpServer.Credentials = new NetworkCredential("jolugbofemi@gmail.com", "");
            smtpServer.EnableSsl = true;
            smtpServer.Send(mail);
            

        }
    }
}
