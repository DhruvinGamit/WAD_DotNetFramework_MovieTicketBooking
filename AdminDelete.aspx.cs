// AdminInside.aspx.cs

using System;
using System.Data.SqlClient;

namespace Movie_Ticket_Booking
{
    public partial class AdminDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic, if any
        }

        protected void btnDeleteMovie_Click(object sender, EventArgs e)
        {
            // Retrieve movie name to delete
            string movieToDelete = txtDeleteMovie.Text;

            // Replace the connection string with your actual database connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\WAD_DotNetFramework_MovieTicketBooking_CE039_CE053\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

            // Replace the SQL query with your actual delete query
            string query = "DELETE FROM Movies WHERE MovieID = @MovieID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@MovieID", movieToDelete);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Movie Deletion successfully!');");
                  
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "script", "alert('Movie Deletion failed!');");
                       
                    }
                }
            }
        }
    }
}
