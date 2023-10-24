<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Movie_Ticket_Booking.AdminPage" %>

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
            margin: 0 auto;
            padding: 20px;
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
            display: inline-block;
            margin-right: 15px;
        }

        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 16px;
        }

        a:hover {
            color: #FF5733; /* Change the color on hover as per your preference */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Admin Page</h2>

            <!-- Navigation Links -->
            <ul>
                <li><a href="AdminAdd.aspx">Add Movie</a></li>
                <li><a href="AdminDelete.aspx">Delete Movie</a></li>
                <li><a href="AdminUpdate.aspx">Update Movie</a></li>
            </ul>
        </div>
    </form>
</body>
</html>
