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
    public partial class Login : System.Web.UI.Page
    {
        string con = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\DotNetFrameworkProj\\DotNetFrameworkProject\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(con);
            string query = "Select * from users where Username = @username and Password = @password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", UserNameBox.Text);
            cmd.Parameters.AddWithValue("@password", PasswordBox.Text);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["user"] = UserNameBox.Text;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Successful')</script>");
                Response.Redirect("home.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed! Bad Credentials!')</script>");

            }
            conn.Close();

        }

    }
}