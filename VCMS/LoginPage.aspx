<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="VCMS.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required field" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email not found." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
           
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    </form>
</body>
</html>
