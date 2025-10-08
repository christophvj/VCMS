<%@ Page Title="View Event Participation" Language="C#" AutoEventWireup="true" CodeBehind="EventParticipation.aspx.cs" Inherits="VCMS.EventParticipation" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="card" style="text-align:center; margin-bottom: 20px;">
        <asp:Label ID="lblMyEventsAndDonations" runat="server" CssClass="lbl" Font-Size="XX-Large" Text="My Events and Donations"></asp:Label>
    </div>

    <!-- Events Section -->
    <div class="card" style="margin-bottom: 20px; padding: 15px;">
        <!-- Section Label -->
        <asp:Label ID="lblEvents" runat="server" CssClass="lbl" Font-Size="X-Large" Text="Events"></asp:Label>

        <!-- Events GridView -->
        <asp:GridView ID="gvEvents" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="EventID"
            OnRowEditing="gvEvents_RowEditing"
            OnRowCancelingEdit="gvEvents_RowCancelingEdit"
            OnRowUpdating="gvEvents_RowUpdating"
            OnRowDeleting="gvEvents_RowDeleting"
            OnRowDataBound="gvEvents_RowDataBound"
            CssClass="DataGrid"
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" HeaderStyle-Width="50px" ItemStyle-Width="50px" />
                <asp:BoundField DataField="EventName" HeaderText="Event Name" ReadOnly="True" HeaderStyle-Width="150px" ItemStyle-Width="150px" />
                <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Skill" HeaderText="Skill" ReadOnly="True" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                <asp:TemplateField HeaderText="Hours">
                    <ItemTemplate>
                        <%# Eval("WorkHours") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtWorkHours" runat="server" CssClass="txtBoxes" Text='<%# Bind("WorkHours") %>' Style="width:50px;" />
                    </EditItemTemplate>
                    <HeaderStyle Width="60px" />
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" DeleteText="Deregister" HeaderStyle-Width="100px" ItemStyle-Width="100px" />
            </Columns>
        </asp:GridView>
    </div>

    <!-- Donations Section -->
    <div class="card" style="margin-bottom: 20px; padding: 15px;">
        <!-- Section Label -->
        <asp:Label ID="lblDonations" runat="server" CssClass="lbl" Font-Size="X-Large" Text="Donations"></asp:Label>

        <!-- Donations GridView -->
        <asp:GridView ID="gvDonations" runat="server" Width="46%" CssClass="DataGrid" GridLines="None">
        </asp:GridView>
    </div>

    <!-- Page-specific styling -->
    <style>
        /* PAGE-SPECIFIC STYLING FOR EVENT PARTICIPATION PAGE */

        /* DataGrid styling for this page (enhancing general CSS) */
        .DataGrid {
            width: auto; /* table adjusts to column widths */
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            background-color: #fff;
            margin-top: 10px;
        }

        .DataGrid th {
            background-color: #004D40;
            color: #fff;
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

        /* Adjust spacing for section headers */
        .card .lbl {
            margin-bottom: 10px;
            display: block;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .DataGrid th, .DataGrid td {
                padding: 5px;
            }
        }
    </style>

</asp:Content>
