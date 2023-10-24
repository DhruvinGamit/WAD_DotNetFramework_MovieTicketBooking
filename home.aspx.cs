// AdminPage.aspx.cs

using System;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace Movie_Ticket_Booking
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LogoutClick_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Session["user"] = null;
                Response.Redirect("Login.aspx");
            }

        }

        
        protected string GetMoviesWithBookButton()
        {
            
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\DotNetFrameworkProj\\DotNetFrameworkProject\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

            string query = "SELECT DISTINCT MovieName, ReleaseDate, Price FROM Movies";

            StringBuilder result = new StringBuilder();

            if (Session["user"] != null)
            {
                string user = Session["user"].ToString();
                Label1.Text = "Welcome " + user + "!";

                using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        
                        string movieName = reader["MovieName"].ToString();
                        string releaseDate = reader["ReleaseDate"].ToString();
                        string price = reader["Price"].ToString();

                        result.AppendFormat("<li>{0} - Release Date: {1}, Price: {2:C} <a href='ShowTimes.aspx?movieName={3}&Price={2:C}' class='booking-button'>Book Movie</a></li>", movieName, releaseDate, Convert.ToDecimal(price), movieName);
                        
                    }
                }
            }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            return result.ToString();
        }
    }
}
