using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Movie_Ticket_Booking
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\DotNetFrameworkProj\\DotNetFrameworkProject\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into users values(@username,@password,@email)";
            SqlCommand cmd =new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", UserNameTextBox.Text);
            cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);
            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            con.Open();
            int a=cmd.ExecuteNonQuery();
            if(a>0)
            {
                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Signup Successfull. Username is :" + UserNameTextBox.Text + " and Password is: " + PasswordTextBox.Text+"');",true);
                ClearControls();
            }
            else
            {
                ClearControls();
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Signup Failed! ");
            }
            con.Close();
        }
        void ClearControls()
        {
            UserNameTextBox.Text = PasswordTextBox.Text = EmailTextBox.Text = ConfirmPasswordTextBox.Text = "";

        }
    }
}