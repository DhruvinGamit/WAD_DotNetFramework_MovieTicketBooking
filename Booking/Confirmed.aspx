<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmed.aspx.cs" Inherits="Movie_Ticket_Booking.Confirmed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        /* Add your styles here */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Your HTML content here -->

            <center>
                <h2><b>Tickets have been successfully booked!</b></h2>
                <br />
            </center>
            <br />
            <center>
                <h2><u>BOOKING DETAILS :</u></h2>
            </center>
            <center>
                <h2>
                    <asp:Label ID="lblMovieName" runat="server" Text=""></asp:Label>
                </h2>
                <h2>
                    <asp:Label ID="lblRow" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSeat" runat="server" Text=""></asp:Label>
                </h2>
                <p>&nbsp;</p>
            </center>
            <br />
            <center>
                <h2><b>AMOUNT TO BE PAID : <asp:Label ID="lblAmount" runat="server"></asp:Label></b></h2>
                PAYMENT METHOD : PAID
                <br />
                <br />
                <br />
            </center>
        </div>
    </form>
</body>
</html>
