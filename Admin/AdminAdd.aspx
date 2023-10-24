<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAdd.aspx.cs" Inherits="Movie_Ticket_Booking.AdminAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <style>
        /* Your existing styles remain unchanged */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add Movie Information</h2>
            <div>
                <label for="txtMovieName">Movie Name:</label>
                <asp:TextBox ID="txtMovieName" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtReleaseDate">Release Date:</label>
                <asp:TextBox ID="txtReleaseDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div>
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtShowTime">Show Time:</label>
                <asp:TextBox ID="txtShowTime" runat="server" TextMode="Time"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnAddMovie" runat="server" Text="Add Movie" OnClick="btnAddMovie_Click" />
            </div>
        </div>
    </form>
</body>
</html>
