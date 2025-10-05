<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserInfo.aspx.cs" Inherits="VCMS.UpdateUserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


        <div class="Page_Heading">
            <h1>Update Account</h1>
        </div>

        <div class="AccountInf_Container">
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
            <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
            <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
             <asp:Label ID="lblPhoneNum" runat="server" Text="Phone Number"></asp:Label>
            <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
        </div>

        <div class="SaveBtn_Container">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>

        <div class="ChangePassword_Heading">
            <h2>Change Password</h2>
        </div>

        <div class="ChangePw_Container">
            <asp:Label ID="lblOldPw" runat="server" Text="Current Password"></asp:Label>
            <asp:TextBox ID="txtOldPw" runat="server" ></asp:TextBox>
            <asp:Label ID="lblNewPw" runat="server" Text="New Password"></asp:Label>
            <asp:TextBox ID="txtNewPw" runat="server" ></asp:TextBox>
            <asp:Label ID="lblConfirmPw" runat="server" Text="Confirm Password" ></asp:Label>
            <asp:TextBox ID="txtConfirmPw" runat="server" ></asp:TextBox>
        </div>

        <div class="PwButton_Container">
            <asp:Button ID="btnPassword" runat="server" Text="Update Password" OnClick="btnPassword_Click" />
        </div>


    </form>
</body>
</html>
