using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Ticket_Booking
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLoginBtn_Click(object sender, EventArgs e)
        {
            if (UserNameBox.Text == "Admin" && PasswordBox.Text == "Admin")
            {
                Session["user"] = UserNameBox.Text;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Successful')</script>");
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed! Bad Credentials!')</script>");

            }
        }
    }
}