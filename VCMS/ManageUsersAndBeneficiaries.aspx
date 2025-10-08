<%@ Page Title="Manage System Members" Language="C#" AutoEventWireup="true" CodeBehind="ManageUsersAndBeneficiaries.aspx.cs" Inherits="VCMS.ManageUsersAndBeneficiaries" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ManageContainer card">
        <h1 class="PageHeading">Manage System Members</h1>

        <!-- Add New User Section -->
        <div class="SectionBlock">
            <h2 class="lbl">Add New User</h2>
            <asp:Button ID="btnAddUser" runat="server" CssClass="buttons" Text="Add User" OnClick="btnAddUser_Click" />
        </div>

        <!-- Remove Users Section -->
        <div class="SectionBlock">
            <h3 class="lbl">Remove Users</h3>
            <asp:GridView ID="gvUsers" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="UserID"
                OnRowDeleting="gvUsers_RowDeleting"
                CssClass="DataGrid">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <hr class="Divider" />

        <!-- Add New Beneficiary Section -->
        <div class="SectionBlock">
            <h2 class="lbl">Add New Beneficiary</h2>
            <asp:TextBox ID="txtBeneficiaryName" runat="server" CssClass="txtBoxes shortInput" Placeholder="Name"></asp:TextBox><br /><br />
            <asp:TextBox ID="txtAmountReceived" runat="server" CssClass="txtBoxes shortInput" Placeholder="Amount Received"></asp:TextBox><br /><br />
            <asp:Button ID="btnAddBeneficiary" runat="server" CssClass="buttons" Text="Add Beneficiary" OnClick="btnAddBeneficiary_Click" />
        </div>

        <!-- Remove Beneficiaries Section -->
        <div class="SectionBlock">
            <h3 class="lbl">Remove Beneficiaries</h3>
            <asp:GridView ID="gvBeneficiaries" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="BeneficiaryID"
                OnRowDeleting="gvBeneficiaries_RowDeleting"
                CssClass="DataGrid">
                <Columns>
                    <asp:BoundField DataField="BeneficiaryID" HeaderText="BeneficiaryID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="AmountReceived" HeaderText="Amount Received" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- PAGE-SPECIFIC STYLING -->
    <style>
        /* Main container layout */
        .ManageContainer {
            max-width: 900px;
            margin: 30px auto;
        }

        /* Section block spacing */
        .SectionBlock {
            margin-bottom: 40px;
        }

        /* Divider line */
        .Divider {
            border: none;
            height: 1px;
            background-color: #ccc;
            margin: 30px 0;
        }

        /* GridView styling */
        .DataGrid {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .DataGrid th {
            background-color: #004D40;
            color: white;
            text-align: left;
            padding: 10px;
        }

        .DataGrid td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .DataGrid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .DataGrid tr:hover {
            background-color: #f1f1f1;
        }

        /* Page heading */
        .PageHeading {
            text-align: center;
            color: #004D40;
            margin-bottom: 40px;
        }

        /* Shorter textboxes for Beneficiaries */
        .shortInput {
            width: 250px;
        }
    </style>

</asp:Content>
