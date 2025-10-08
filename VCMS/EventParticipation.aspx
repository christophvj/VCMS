<%@ Page Title="View Event Participation" Language="C#" AutoEventWireup="true" CodeBehind="EventParticipation.aspx.cs" Inherits="VCMS.EventParticipation" MasterPageFile="~/Site1.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Label ID="lblMyEventsAndDonations" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="My Events and Donations"></asp:Label>
        </div>
        <p style="height: 30px">
            <asp:Label ID="lblEvents" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Events"></asp:Label>
        </p>
        <p style="height: 164px">
            <asp:GridView ID="gvEvents" runat="server" Width="687px">
            </asp:GridView>
        </p>
        <asp:Button ID="btnDeregister" runat="server" Text="Deregister for Event" />
        <p>
            <asp:Label ID="lblDonations" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Donations"></asp:Label>
        </p>
        <asp:GridView ID="gvDonations" runat="server" Height="145px" Width="683px">
        </asp:GridView>

</asp:Content>

