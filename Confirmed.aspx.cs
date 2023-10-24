using System;
using System.Web.UI;

namespace Movie_Ticket_Booking
{
    public partial class Confirmed : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayBookingDetails();
            }
        }

        private void DisplayBookingDetails()
        {
            if (Session["user"] != null && Request.QueryString["movieName"] != null)
            {
                string movieName = Request.QueryString["movieName"];
                string row = Request.QueryString["row"];
                string seat = Request.QueryString["seat"];
                string amount = Request.QueryString["amount"];
                string showTime = Request.QueryString["showTime"];

                // Display the retrieved values
                lblMovieName.Text = $"Movie: {movieName}";
                lblRow.Text = $"Row: {row}";
                lblSeat.Text = $"Seat: {seat}";
                lblAmount.Text = $"Amount: {amount:C}";
            }
            else
            {
                // Handle the case when required data is not available
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}
