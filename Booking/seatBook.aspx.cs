using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace movie_booking
{
    public partial class seatBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your initialization logic here
        }

        protected void btn_conf_Click(object sender, EventArgs e)
        {
            string row_select = row.SelectedItem.Value == "0" ? "You have not chosen any row" : row.SelectedItem.Value;
            string seat_select = seat.SelectedItem.Value == "0" ? "You have not chosen any seat" : seat.SelectedItem.Value;

            Label1.Text = $"You selected seat number <b>{seat_select}</b> in row <b>{row_select}</b>.";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["movieConnection"].ConnectionString;

            try
            {
                using (con)
                {
                    string movieName = Request.QueryString["movieName"];
                    string st = Request.QueryString["showTime"];
                    Session["amount"] = Request.QueryString["Price"];
                    string name = Session["user"].ToString();

                    // Check if the seat is already booked
                    string selectCommand = "SELECT * FROM Screen WHERE Row = @row AND Seat_no = @seat AND Movie_Name = @movieName AND showTime = @showTime";
                    SqlCommand selectCmd = new SqlCommand(selectCommand, con);
                    selectCmd.Parameters.AddWithValue("row", row.SelectedItem.Value);
                    selectCmd.Parameters.AddWithValue("seat", seat.SelectedItem.Value);
                    selectCmd.Parameters.AddWithValue("movieName", movieName);

                    // Add the logic to get the show time
                    selectCmd.Parameters.AddWithValue("showTime", st);

                    con.Open();
                    SqlDataReader reader = selectCmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        // Seat is already booked
                        Label1.Text = "The selected seat is already booked. Please choose another seat.";
                        return; // Stop further processing
                    }

                    con.Close(); // Close the reader

                    // Proceed with seat booking
                    string insertCommand = "INSERT INTO [Screen](UserId, Movie_Name, Row, Seat_no, showTime) VALUES(@a, @b, @c, @d, @showTime)";
                    SqlCommand insertCmd = new SqlCommand(insertCommand, con);
                    insertCmd.Parameters.AddWithValue("a", name);
                    insertCmd.Parameters.AddWithValue("b", movieName);
                    insertCmd.Parameters.AddWithValue("c", row.SelectedItem.Value);
                    insertCmd.Parameters.AddWithValue("d", seat.SelectedItem.Value);

                    // Add the logic to get the show time
                    insertCmd.Parameters.AddWithValue("showTime", st);

                    con.Open();
                    insertCmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                con.Close(); // Close the connection
            }

            // After successfully booking the seat, redirect to Confirmed.aspx with relevant data as query parameters
            Response.Redirect($"Confirmed.aspx?movieName={Request.QueryString["movieName"]}&row={row.SelectedItem.Value}&seat={seat.SelectedItem.Value}&amount={Session["amount"]}&showTime={Request.QueryString["showTime"]}");

        }
    }
}
