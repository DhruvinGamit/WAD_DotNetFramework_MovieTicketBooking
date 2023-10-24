<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDelete.aspx.cs" Inherits="Movie_Ticket_Booking.AdminDelete" %>

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
            background-color: #e74c3c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Delete Movie</h2>
            <div>
                <label for="txtDeleteMovie">Movie Id to Delete:</label>
                <asp:TextBox ID="txtDeleteMovie" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnDeleteMovie" runat="server" Text="Delete Movie" OnClick="btnDeleteMovie_Click" />
            </div>
        </div>
    </form>
</body>
</html>
