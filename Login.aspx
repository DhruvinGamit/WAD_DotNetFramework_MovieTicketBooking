<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Movie_Ticket_Booking.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #form-container {
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 450px;
        }

        .login-text {
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error-message {
            color: #ff0000;
            font-size: 14px;
        }

        .login-button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .signup-link {
            font-size: 16px;
            color: #4caf50;
            text-decoration: none;
        }
        .auto-style1 {
            margin-left: 160px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="form-container">
            <div class="login-text">
                <p class="auto-style1">
&nbsp;&nbsp;&nbsp; LOGIN</p>
            </div>
            <div class="form-group">
                <label for="UserNameBox">USERNAME:</label>
                <asp:TextBox ID="UserNameBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameBox" Display="Dynamic" ErrorMessage="Please Enter Valid Username" ForeColor="Red" SetFocusOnError="True" CssClass="error-message">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="PasswordBox">PASSWORD:</label>
                <asp:TextBox ID="PasswordBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordBox" Display="Dynamic" ErrorMessage="Please Enter Valid Password" ForeColor="Red" SetFocusOnError="True" CssClass="error-message">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="LoginBtn" runat="server" CssClass="login-button" Text="LOGIN" OnClick="LoginBtn_Click" />
            </div>
            <div class="auto-style2">
                Need an account? <a href="Register.aspx" class="signup-link">Sign up</a>
            </div>
            <br />
            <div class="auto-style2">
                Are you Admin? <a href="Admin.aspx" class="signup-link">Admin</a>
            </div>
         
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#0CCCCC" Font-Size="Larger" ForeColor="Red" CssClass="auto-style5" Height="118px" />
    </form>
</body>
</html>
