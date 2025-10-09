<%@ Page Title="Reports" Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="VCMS.Reports" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="Page_Heading card">
        <asp:Label ID="lblPageHeading" runat="server" Text="Reports" CssClass="lbl"></asp:Label>
    </div>

    <!-- Menu for switching reports -->
    <div class="Menu_Block card">
        <asp:Menu ID="menuReports" runat="server" Orientation="Horizontal"
                  OnMenuItemClick="menuReports_MenuItemClick"
                  CssClass="report-menu"
                  StaticSelectedStyle-CssClass="active-report-tab">
            <Items>
                <asp:MenuItem Text="Top 10 Events" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="Volunteers Per Event" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="Events Per Beneficiarie" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="Total Donations Per Event" Value="3"></asp:MenuItem>
            </Items>
        </asp:Menu>
    </div>

    <!-- Export Button --> 
    <div style="text-align:center; margin-bottom:20px;">
        <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" OnClick="btnExportToExcel_Click" CssClass="export-btn" />
    </div>

    <!-- Reports MultiView -->
    <asp:MultiView ID="mvReports" runat="server" ActiveViewIndex="0">

        <!-- Top 10 Events Report -->
        <asp:View ID="viewTopEvents" runat="server">
            <asp:Panel ID="pnlTopEvents" runat="server" CssClass="ReportPanel">
                <h2>Top 10 Events</h2>
                <asp:GridView ID="gvTopEvents" runat="server" AutoGenerateColumns="True" CssClass="DataGrid" GridLines="None"></asp:GridView>
            </asp:Panel>
        </asp:View>

        <!-- Volunteers Per Event Report -->
        <asp:View ID="viewVolunteersPerEvent" runat="server">
            <asp:Panel ID="pnlVolunteers" runat="server" CssClass="ReportPanel">
                <h2>Volunteers Per Event</h2>
                <asp:GridView ID="gvVolunteersPerEvent" runat="server" AutoGenerateColumns="True" CssClass="DataGrid" GridLines="None"></asp:GridView>
            </asp:Panel>
        </asp:View>

        <!-- Beneficiaries Per Event Report -->
        <asp:View ID="viewBeneficiariesPerEvent" runat="server">
            <asp:Panel ID="pnlBeneficiaries" runat="server" CssClass="ReportPanel">
                <h2>Beneficiaries Per Event</h2>
                <asp:GridView ID="gvBeneficiariesPerEvent" runat="server" AutoGenerateColumns="True" CssClass="DataGrid" GridLines="None"></asp:GridView>
            </asp:Panel>
        </asp:View>

        <!-- Total Donations Per Event Report -->
        <asp:View ID="viewTotalDonationsPerEvent" runat="server">
            <asp:Panel ID="pnlDonations" runat="server" CssClass="ReportPanel">
                <h2>Total Donations Per Event</h2>
                <asp:GridView ID="gvTotalDonationsPerEvent" runat="server" AutoGenerateColumns="True" CssClass="DataGrid" GridLines="None"></asp:GridView>
            </asp:Panel>
        </asp:View>

    </asp:MultiView>

    <!-- Page-specific styling -->
    <style>
        /* Page heading */
        .Page_Heading {
            text-align: center;
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
        }

        .Page_Heading .lbl {
            font-size: 28px;
        }

        /* Menu styling */
        .Menu_Block {
            max-width: 800px;
            margin: 20px auto;
            padding: 10px 20px;
        }

        /* Report Menu Container */
        .report-menu {
            display: flex;
            justify-content: center;
            gap: 16px;
            padding: 10px 0;
            margin: 0;
        }

        /* Force menu to remove default table rendering */
        .report-menu .level1 {
            display: flex !important;
            gap: 50px;
            padding: 0;
            margin: 0;
        }

        /* Menu Items */
        .report-menu a {
            display: inline-block;
            background-color: #E0F2F1;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 6px;
            color: #004D40;
            text-decoration: none;
            border: 2px solid transparent;
            transition: all 0.25s ease;
        }

        /* Hover */
        .report-menu a:hover {
            background-color: #B2DFDB;
            border-color: #00796B;
            color: #004D40;
        }

        /* Active tab */
        .active-report-tab a {
            background-color: #00796B !important;
            color: #fff !important;
            border-color: #004D40 !important;
        }

        /* Panel for each report */
        .ReportPanel {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        /* Report headings */
        .ReportPanel h2 {
            color: #004D40;
            border-bottom: 2px solid #00796B;
            padding-bottom: 5px;
            margin-top: 0;
        }

        /* Consistent GridView Styling */
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

        /* Export Button */
        .export-btn {
            padding: 10px 20px;
            background-color: #00796B;
            color: white;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .export-btn:hover {
            background-color: #004D40;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .Page_Heading .lbl {
                font-size: 24px;
            }

            .Menu_Block {
                padding: 5px 10px;
            }

            .ReportPanel {
                padding: 15px;
            }

            .DataGrid th, .DataGrid td {
                padding: 5px;
            }
        }
    </style>

</asp:Content>
