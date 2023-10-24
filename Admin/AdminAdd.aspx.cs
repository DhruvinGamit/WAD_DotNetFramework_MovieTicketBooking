using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Movie_Ticket_Booking
{
    public partial class AdminAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization logic here
        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            // Retrieve values from textboxes
            string movieName = txtMovieName.Text;
            string releaseDate = txtReleaseDate.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text); // Assuming the price is a decimal, adjust as needed
            TimeSpan showTime = TimeSpan.Parse(txtShowTime.Text); // Assuming the time is entered as a string, adjust as needed

            // Replace the connection string with your actual database connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\DotNetFrameworkProj\\DotNetFrameworkProject\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

            // Replace the SQL query with your actual insert query
            string query = "INSERT INTO Movies (MovieName, ReleaseDate, Price, showTime) VALUES (@MovieName, @ReleaseDate, @Price, @ShowTime)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@MovieName", movieName);
                    command.Parameters.AddWithValue("@ReleaseDate", releaseDate);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@ShowTime", showTime);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Movie Added successfully!');");
            ClearControls();
        }

        void ClearControls()
        {
            txtMovieName.Text = txtReleaseDate.Text = txtPrice.Text = txtShowTime.Text = "";
        }
    }
}
