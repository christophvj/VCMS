<%@ Page Title="View Event Participation" Language="C#" AutoEventWireup="true" CodeBehind="EventParticipation.aspx.cs" Inherits="VCMS.EventParticipation" MasterPageFile="~/Site1.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Label ID="lblMyEventsAndDonations" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="My Events and Donations"></asp:Label>
        </div>
        <p style="height: 30px">
            <asp:Label ID="lblEvents" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Events"></asp:Label>
        </p>
        
        <asp:GridView ID="gvEvents" runat="server" Width="687px"
    AutoGenerateColumns="False"
    DataKeyNames="EventID"
    OnRowEditing="gvEvents_RowEditing"
    OnRowCancelingEdit="gvEvents_RowCancelingEdit"
    OnRowUpdating="gvEvents_RowUpdating"
    OnRowDeleting="gvEvents_RowDeleting"
    CssClass="table table-striped">
    <Columns>
        <asp:BoundField DataField="EventID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="EventName" HeaderText="Event Name" ReadOnly="True" />
        <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
        <asp:BoundField DataField="Skill" HeaderText="Skill" ReadOnly="True" />
        <asp:TemplateField HeaderText="Hours">
            <ItemTemplate>
                <%# Eval("WorkHours") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtWorkHours" runat="server" Text='<%# Bind("WorkHours") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" DeleteText="Deregister" />
    </Columns>
</asp:GridView>
       
            <asp:Label ID="lblDonations" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Donations"></asp:Label>
        </p>
        <asp:GridView ID="gvDonations" runat="server" Height="145px" Width="683px">
        </asp:GridView>

</asp:Content>

