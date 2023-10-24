using System;
using System.Data.SqlClient;
using System.Text;

namespace Movie_Ticket_Booking
{
    public partial class ShowTimes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the movie name from the query string
                string movieName = Request.QueryString["movieName"];
                if (!string.IsNullOrEmpty(movieName))
                {
                    lblMovieName.Text = movieName;
                }
                else
                {
                    // Redirect to another page or handle the case where the movie name is not provided
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }

        protected string GetShowTimes()
        {
            string movieName = lblMovieName.Text;
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\dhruv\\Desktop\\DotNetFrameworkProj\\DotNetFrameworkProject\\Movie Ticket Booking\\Data\\Movie.mdf\";Integrated Security=True;Connect Timeout=30";

            StringBuilder result = new StringBuilder();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Use a parameterized query to prevent SQL injection
                    string query = "SELECT showTime FROM Movies WHERE MovieName = @MovieName";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@MovieName", movieName);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Check for DBNull before attempting the cast
                                if (reader["showTime"] != DBNull.Value)
                                {
                                    TimeSpan showTime = (TimeSpan)reader["showTime"];
                                    string formattedShowTime = showTime.ToString("hh\\:mm");

                                    // Apply additional styles and HTML structure
                                    result.AppendFormat(
                                        "<li class='show-time-item'><span class='show-time'>{0}</span><a href='seatBook.aspx?movieName={1}&showTime={2}' class='booking-button'>Book Now</a></li>",
                                        formattedShowTime,
                                        movieName,
                                        formattedShowTime
                                    );
                                }
                                else
                                {
                                    result.AppendFormat("<li>No show time available</li>");
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                // Display a generic error message to the user
                result.AppendFormat("<li>Error retrieving show times. Please try again later.</li>");
            }

            return result.ToString();
        }
    }
}
