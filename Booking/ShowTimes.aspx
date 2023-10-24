<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTimes.aspx.cs" Inherits="Movie_Ticket_Booking.ShowTimes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Times</title>
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
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
        }

        .booking-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Show Times for Movie: <asp:Label ID="lblMovieName" runat="server" Text=""></asp:Label></h2>
            <ul>
                <%-- Display show times dynamically in the code-behind --%>
                <%= GetShowTimes() %>
            </ul>
        </div>
    </form>
</body>
</html>
