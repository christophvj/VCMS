<%@ Page Title="Log-In" Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="VCMS.LoginPage" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Login Page Container -->
    <div class="login-container card">

        <h2 class="lbl" style="text-align:center; margin-bottom:20px;">Login</h2>

        <!-- Email -->
        <asp:Label ID="Label1" runat="server" Text="Email" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBoxes"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ControlToValidate="txtEmail" CssClass="lbl" ForeColor="#E53935" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        <!-- Password -->
        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="lbl" style="margin-top:15px; display:block;"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBoxes" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>

        <asp:Label ID="Label3" runat="server" Text="Label" CssClass="lbl" Visible="False"></asp:Label>

        <!-- Login Button -->
        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="buttons" OnClick="Button1_Click" style="margin-top:20px; width:100%;" />
        <!-- Create Account Link -->
        <div style="text-align:center; margin-top:15px;">
            <asp:HyperLink ID="linkCreateAccountLogin" runat="server" NavigateUrl="~/CreateAccount.aspx" CssClass="loginLink" 
                style="padding:5px 10px; border-radius:4px; display:inline-block;">
                Don't have an account? Create one
            </asp:HyperLink>
        </div>

    </div>

    <!-- Login Page Specific Styles -->
    <style>
        /* Center the login form on the page */
        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .loginLink {
            color: #00796B; /* teal text */
            font-weight: 500;
            text-decoration: underline;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .loginLink:hover {
            color: #004D40; /* darker teal on hover */
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .login-container {
                margin: 50px 20px;
                padding: 20px;
            }
        }
    </style>

</asp:Content>
