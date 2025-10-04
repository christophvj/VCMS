<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsersAndBeneficiaries.aspx.cs" Inherits="VCMS.ManageUsersAndBeneficiaries" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users and Beneficiaries</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin:20px;">
            <h2>Add New User</h2>
            <asp:TextBox ID="txtName" runat="server" Placeholder="Name"></asp:TextBox><br />
            <asp:TextBox ID="txtSurname" runat="server" Placeholder="Surname"></asp:TextBox><br />
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox><br />
            <asp:TextBox ID="txtPhoneNumber" runat="server" Placeholder="Phone Number"></asp:TextBox><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox><br />
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" />

            <h3>Remove Users</h3>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" OnRowDeleting="gvUsers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <hr />

            <h2>Add New Beneficiary</h2>
            <asp:TextBox ID="txtBeneficiaryName" runat="server" Placeholder="Name"></asp:TextBox><br />
            <asp:TextBox ID="txtAmountReceived" runat="server" Placeholder="Amount Received"></asp:TextBox><br />
            <asp:Button ID="btnAddBeneficiary" runat="server" Text="Add Beneficiary" OnClick="btnAddBeneficiary_Click" />

            <h3>Remove Beneficiaries</h3>
            <asp:GridView ID="gvBeneficiaries" runat="server" AutoGenerateColumns="False" DataKeyNames="BeneficiaryID" OnRowDeleting="gvBeneficiaries_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="BeneficiaryID" HeaderText="BeneficiaryID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="AmountReceived" HeaderText="Amount Received" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
