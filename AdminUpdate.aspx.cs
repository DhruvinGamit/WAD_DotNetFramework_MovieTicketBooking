using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Movie_Ticket_Booking
{
    public partial class AdminUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization logic here
        }

        protected void btnUpdateMovie_Click(object sender, EventArgs e)
        {
            // Retrieve values from textboxes
            string movieName = txtUpdateMovieName.Text;
            string newReleaseDate = txtNewReleaseDate.Text;
            decimal newPrice = Convert.ToDecimal(txtNewPrice.Text);
            TimeSpan newShowTime = TimeSpan.Parse(txtNewShowTime.Text);

            // Replace the connection string with your actual database connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\WAD_DotNetFramework_MovieTicketBooking_CE039_CE053\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

            // Replace the SQL query with your actual update query
            string query = "UPDATE Movies SET ReleaseDate = @NewReleaseDate, Price = @NewPrice, showTime = @NewShowTime WHERE MovieName = @MovieName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@MovieName", movieName);
                    command.Parameters.AddWithValue("@NewReleaseDate", newReleaseDate);
                    command.Parameters.AddWithValue("@NewPrice", newPrice);
                    command.Parameters.AddWithValue("@NewShowTime", newShowTime);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Movie Updated successfully!');");
                        ClearControls();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Movie not found or update failed.');");
                    }
                }
            }
        }

        void ClearControls()
        {
            txtUpdateMovieName.Text = txtNewReleaseDate.Text = txtNewPrice.Text = txtNewShowTime.Text = "";
        }
    }
}
