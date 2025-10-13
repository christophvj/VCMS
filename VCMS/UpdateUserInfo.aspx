<%@ Page Title="Update Account" Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserInfo.aspx.cs" Inherits="VCMS.UpdateUserInfo" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="Page_Heading card">
        <h1>Update Account</h1>
    </div>

    <!-- Account Info Form -->
    <div class="AccountInf_Container card">
        <asp:Label ID="lblName" runat="server" Text="Name" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="txtBoxes"></asp:TextBox>

        <asp:Label ID="lblSurname" runat="server" Text="Surname" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtSurname" runat="server" CssClass="txtBoxes"></asp:TextBox>

        <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtBoxes"></asp:TextBox>

        <asp:Label ID="lblPhoneNum" runat="server" Text="Phone Number" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtPhoneNum" runat="server" CssClass="txtBoxes"></asp:TextBox>

        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBoxes"  ></asp:TextBox>
    </div>

    <div class="SaveBtn_Container">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttons" OnClick="btnSave_Click" />
    </div>

    <!-- Change Password Section -->
    <div class="ChangePassword_Heading card">
        <h2>Change Password</h2>
    </div>

    <div class="ChangePw_Container card">
        <asp:Label ID="lblOldPw" runat="server" Text="Current Password" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtOldPw" runat="server" CssClass="txtBoxes" TextMode="Password"></asp:TextBox>

        <asp:Label ID="lblNewPw" runat="server" Text="New Password" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtNewPw" runat="server" CssClass="txtBoxes" TextMode="Password"></asp:TextBox>

        <asp:Label ID="lblConfirmPw" runat="server" Text="Confirm Password" CssClass="lbl"></asp:Label>
        <asp:TextBox ID="txtConfirmPw" runat="server" CssClass="txtBoxes" ></asp:TextBox>
    </div>

    <div class="PwButton_Container">
        <asp:Button ID="btnPassword" runat="server" Text="Update Password" CssClass="buttons" OnClick="btnPassword_Click" />
    </div>

    <!-- Page-specific styles -->
    <style>
        /* Page Heading */
        .Page_Heading {
            text-align: center;
            margin: 30px auto 20px auto;
        }

        .Page_Heading h1 {
            font-size: 28px;
            color: #004D40;
        }

        /* Account Info & Change Password Containers */
        .AccountInf_Container,
        .ChangePw_Container,
        .ChangePassword_Heading {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
        }

        /* Headings inside Change Password section */
        .ChangePassword_Heading h2 {
            font-size: 24px;
            color: #004D40;
            margin: 0;
        }

        /* Add spacing between inputs */
        .AccountInf_Container .txtBoxes,
        .ChangePw_Container .txtBoxes {
            margin-bottom: 10px;
        }

        .SaveBtn_Container,
        .PwButton_Container {
            text-align: center;
            margin: 15px 0;
        }

        @media screen and (max-width: 480px) {
            .AccountInf_Container,
            .ChangePw_Container,
            .ChangePassword_Heading {
                padding: 15px;
            }

            .Page_Heading h1 {
                font-size: 24px;
            }

            .ChangePassword_Heading h2 {
                font-size: 20px;
            }
        }
    </style>

</asp:Content>
