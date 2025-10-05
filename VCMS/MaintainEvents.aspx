<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainEvents.aspx.cs" Inherits="VCMS.MaintainEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Maintain Events"></asp:Label>
            <asp:Button ID="btnAddEvent" runat="server" OnClick="btnAddEvent_Click" Text="Add Event" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataKeyNames="EventID"
            OnRowEditing="GridView1_RowEditing"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowDataBound="GridView1_RowDataBound"
            CssClass="table table-striped">

    <Columns>
        <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" />

        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <%# Eval("Name") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <%# Eval("Description") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Location">
            <ItemTemplate>
                <%# Eval("Location") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("Location") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Start Date">
            <ItemTemplate>
                <%# Eval("StartDate", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate", "{0:yyyy-MM-dd}") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="End Date">
            <ItemTemplate>
                <%# Eval("EndDate", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("EndDate", "{0:yyyy-MM-dd}") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
    </form>
</body>
</html>
