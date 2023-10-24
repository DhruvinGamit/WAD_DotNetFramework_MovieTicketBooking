<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdate.aspx.cs" Inherits="Movie_Ticket_Booking.AdminUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Movie</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
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

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Update Movie Information</h2>
            <label for="txtUpdateMovieName">Movie Name:</label>
            <asp:TextBox ID="txtUpdateMovieName" runat="server"></asp:TextBox>

            <label for="txtNewReleaseDate">New Release Date:</label>
            <asp:TextBox ID="txtNewReleaseDate" runat="server"></asp:TextBox>

            <label for="txtNewPrice">New Price:</label>
            <asp:TextBox ID="txtNewPrice" runat="server"></asp:TextBox>

<label for="txtNewShowTime">New Show Time:</label>
<asp:TextBox ID="txtNewShowTime" runat="server" TextMode="Time"></asp:TextBox>


            <asp:Button ID="btnUpdateMovie" runat="server" Text="Update Movie" OnClick="btnUpdateMovie_Click" />
        </div>
    </form>
</body>
</html>
