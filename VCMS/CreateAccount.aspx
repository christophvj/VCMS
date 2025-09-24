<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="VCMS.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Div "PageHeading" Contains Label for Page Title -->
        <div class ="PageHeading">
            <asp:Label ID="lblPageHeading" runat="server" Text="Create Account"></asp:Label>
        </div>

        <!-- Div "PageContent" Contains Textboxes for User Input -->
        <div class="PageContent">
            <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Name Required"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtSurname" runat="server" placeholder="Surname"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSurname" ErrorMessage="Surname Required"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Invalid Phone Number" ValidationExpression="^0\d{9}$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
        </div>

        <!-- Div "SignUpButton" Contains Button to Submit User Input -->
        <div class="SignUpButton">
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
        </div>

    </form>
</body>
</html>
