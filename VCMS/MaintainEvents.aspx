<%@ Page Title="Maintain Events" Language="C#" AutoEventWireup="true" CodeBehind="MaintainEvents.aspx.cs" Inherits="VCMS.MaintainEvents" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="PageHeading card">
        <asp:Label ID="Label1" runat="server" Text="Maintain Events" CssClass="lbl"></asp:Label>
        <asp:Button ID="btnAddEvent" runat="server" OnClick="btnAddEvent_Click" Text="Add Event" CssClass="buttons" />
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="EventID"
        OnRowEditing="GridView1_RowEditing"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowDeleting="GridView1_RowDeleting"
        OnRowDataBound="GridView1_RowDataBound"
        CssClass="EventGrid">

        <Columns>
            <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" 
                ItemStyle-Width="50px" HeaderStyle-Width="50px" />

            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%# Eval("Name") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass="txtBoxes" />
                </EditItemTemplate>
                <ItemStyle Width="200px" />
                <HeaderStyle Width="200px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <%# Eval("Description") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="txtBoxes" />
                </EditItemTemplate>
                <ItemStyle Width="250px" />
                <HeaderStyle Width="250px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Location">
                <ItemTemplate>
                    <%# Eval("Location") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("Location") %>' CssClass="txtBoxes" />
                </EditItemTemplate>
                <ItemStyle Width="150px" />
                <HeaderStyle Width="150px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <%# Eval("StartDate", "{0:yyyy-MM-dd}") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate", "{0:yyyy-MM-dd}") %>' CssClass="txtBoxes" />
                </EditItemTemplate>
                <ItemStyle Width="120px" />
                <HeaderStyle Width="120px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="End Date">
                <ItemTemplate>
                    <%# Eval("EndDate", "{0:yyyy-MM-dd}") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("EndDate", "{0:yyyy-MM-dd}") %>' CssClass="txtBoxes" />
                </EditItemTemplate>
                <ItemStyle Width="120px" />
                <HeaderStyle Width="120px" />
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <!-- Page-specific styles -->
    <style>
        /* Page Heading */
        .PageHeading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }

        .PageHeading .lbl {
            font-size: 28px;
        }

        .EventGrid {
            width: 90%;
            margin: 0 auto 50px auto;
            border-collapse: collapse;
        }

        .EventGrid th, .EventGrid td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
            vertical-align: middle;
        }

        .EventGrid th {
            background-color: #004D40;
            color: white;
        }

        .EventGrid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .EventGrid .txtBoxes {
            width: 100%;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .PageHeading {
                flex-direction: column;
                gap: 10px;
            }
            .EventGrid {
                width: 100%;
                font-size: 14px;
            }
        }
    </style>

</asp:Content>
