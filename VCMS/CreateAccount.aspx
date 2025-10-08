<%@ Page Title="Create Account" Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="VCMS.CreateAccount" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Main container for create account page -->
    <div class="create-account-container card">

        <!-- Page Heading -->
        <div class="PageHeading" style="text-align:center; margin-bottom:20px;">
            <asp:Label ID="lblPageHeading" runat="server" Text="Create Account" CssClass="lbl"></asp:Label>
        </div>

        <!-- User Input Fields -->
        <div class="PageContent">
            <asp:Label ID="lblName" runat="server" Text="Name" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="txtBoxes" placeholder="Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Name Required" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>

            <asp:Label ID="lblSurname" runat="server" Text="Surname" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtSurname" runat="server" CssClass="txtBoxes" placeholder="Surname"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSurname" ErrorMessage="Surname Required" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>

            <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBoxes" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="lbl" ForeColor="#E53935"></asp:RegularExpressionValidator>

            <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="txtBoxes" placeholder="Phone Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number Required" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid Phone Number" ValidationExpression="^0\d{9}$" CssClass="lbl" ForeColor="#E53935"></asp:RegularExpressionValidator>

            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBoxes" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required" CssClass="lbl" ForeColor="#E53935"></asp:RequiredFieldValidator>
        </div>

        <!-- Sign Up Button -->
        <div class="SignUpButton" style="margin-top:20px; text-align:center;">
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="buttons" OnClick="btnSignUp_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="lbl" style="display:block; margin-top:10px;"></asp:Label>
        </div>

        <div>
            <asp:HyperLink ID="linkLogin" runat="server" NavigateUrl="~/LoginPage.aspx" CssClass="login-link">
                Already have an account? Log in
            </asp:HyperLink>
        </div>

    </div>

    <!-- Create Account Page Specific Styles -->
    <style>
        /* Center the form on the page */
        .create-account-container {
            max-width: 450px;
            margin: 60px auto;
            padding: 30px;
        }

        /* Make page heading bigger */
        .PageHeading .lbl {
            font-size: 28px;
        }

        /* Add spacing between labels and inputs */
        .PageContent .lbl {
            display: block;
            margin-top: 10px;
            margin-bottom: 3px;
        }

        /* Add spacing between inputs */
        .PageContent .txtBoxes {
            margin-bottom: 8px;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .create-account-container {
                margin: 30px 20px;
                padding: 20px;
            }
        }

        /* Link below Sign Up button */
        .login-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #00796B;
            text-decoration: underline;
            cursor: pointer;
            font-weight: 500;
            transition: color 0.3s ease;
        }
    </style>

</asp:Content>
