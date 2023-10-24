<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Movie_Ticket_Booking.Register" %>

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
            width: 584px;
            margin: auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 50px;
        }

        .form-heading {
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
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

        .register-button {
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

        .login-link {
            font-size: 16px;
            color: #4caf50;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="form-container">
            <div class="form-heading">SIGN UP</div>
            <div class="form-group">
                <label for="UserNameTextBox">USERNAME:</label>
                <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox" Display="Dynamic" ErrorMessage="Please Enter UserName" ForeColor="Red" SetFocusOnError="True" CssClass="error-message">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="PasswordTextBox">PASSWORD:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" CssClass="error-message">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Please Enter a Strong Password with Uppercase, Lowercase, Numbers, and Special Characters" ForeColor="Red" SetFocusOnError="True" ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">*</asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="ConfirmPasswordTextBox">CONFIRM PASSWORD:</label>
                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" ErrorMessage="Password Do Not Match" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" ErrorMessage="Password do not Match" ForeColor="Red" SetFocusOnError="True">*</asp:CompareValidator>
            </div>
            <div class="form-group">
                <label for="EmailTextBox">EMAIL:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Please Enter Email" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Please Enter Valid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="REGISTER" OnClick="Button1_Click" CssClass="register-button" />
                <br />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="login-link">Go to Login form</asp:HyperLink>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CCCCCC" Font-Size="Larger" ForeColor="Red" />
        </div>
    </form>
</body>
</html>
