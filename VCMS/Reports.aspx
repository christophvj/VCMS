<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="VCMS.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="Page_Heading">
            <h1>Reports</h1>
        </div>

        <!-- Container for the menu -->
        <div class="Menu_Block">
            <asp:Menu ID="menuReports" runat="server" Orientation="Horizontal" OnMenuItemClick="menuReports_MenuItemClick">


            <Items>
                <asp:MenuItem Text="Top 10 Events" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="Volunteers Per Event" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="Beneficiaries Per Event" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="Total Donations Per Event" Value="3"></asp:MenuItem>
            </Items>

            </asp:Menu>
        </div>

        <!-- MultiView to hold different reports -->
        <asp:MultiView ID="mvReports" runat="server" ActiveViewIndex="0">

            <!-- View for Top 10 Events Report -->
            <asp:View ID="viewTopEvents" runat="server">
                <h2>Top 10 Events</h2>
                <asp:GridView ID="gvTopEvents" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </asp:View>

            <!-- View for Volunteers Per Event Report -->
            <asp:View ID="viewVolunteersPerEvent" runat="server">
                <h2>Volunteers Per Event</h2>
                <asp:GridView ID="gvVolunteersPerEvent" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </asp:View>

            <!-- View for Beneficiaries Per Event Report -->
            <asp:View ID="viewBeneficiariesPerEvent" runat="server">
                <h2>Beneficiaries Per Event</h2>
                <asp:GridView ID="gvBeneficiariesPerEvent" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </asp:View>

            <!-- View for Total Donations Per Event Report -->
            <asp:View ID="viewTotalDonationsPerEvent" runat="server">
                <h2>Total Donations Per Event Report</h2>
                <asp:GridView ID="gvTotalDonationsPerEvent" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </asp:View>

        </asp:MultiView>

    </form>
</body>
</html>
