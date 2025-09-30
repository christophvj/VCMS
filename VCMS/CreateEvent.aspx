<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="VCMS.CreateEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Beneficiary"></asp:Label>
        <asp:DropDownList ID="BeneficiaryDropDown" runat="server" Height="24px" Width="173px">
        </asp:DropDownList>
        <asp:Label ID="lblBenmseg" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BeneficiaryDropDown" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Required field"></asp:RequiredFieldValidator>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Location"></asp:Label>
        <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLocation" ErrorMessage="Required field"></asp:RequiredFieldValidator>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Start date"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Calendar ID="cldrStartDate" runat="server" Height="16px" Width="206px"></asp:Calendar>
        </p>
        <asp:Label ID="Label5" runat="server" Text="End date"></asp:Label>
        <asp:Calendar ID="cldrEndDate" runat="server"></asp:Calendar>
        <asp:Button ID="btnSaveEvent" runat="server" OnClick="btnSaveEvent_Click" Text="Save Event" />
        <asp:Label ID="lblSaveMSg" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
