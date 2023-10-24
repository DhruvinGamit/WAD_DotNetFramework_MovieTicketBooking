<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Movie_Ticket_Booking.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 16px;
        }

        a:hover {
            color: #FF5733;
        }

        .booking-button {
            background-color: #3498db;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .booking-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Home Page</h2>
            <p>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </p>

            <asp:Button class="logout" ID="LogoutClick" runat="server" OnClick="LogoutClick_Click" Text="Logout"  Height="39px" Width="91px" />

            <!-- Movie List Section -->
            <h3>Movie List&nbsp;&nbsp;&nbsp; </h3>

            <ul>
                <%-- This is a server-side code block where we retrieve and display movies --%>
                <%= GetMoviesWithBookButton() %>
            </ul>
        </div>
    </form>
</body>
</html>
