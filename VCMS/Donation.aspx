<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="VCMS.Donation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="PageHeading">
            <asp:Label ID="lblPageHeading" runat="server" Text="Make a Donation" ></asp:Label>
        </div>

        <div class="EventBlock">
            <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand">
                    
                <ItemTemplate>

                    <div class="EventBlockContent">
                        <h3><%# Eval("EventName") %></h3>
                        <p><strong>Beneficiaries:</strong> <%# Eval("Beneficiaries") %></p>
                        <p><strong>Description:</strong> <%# Eval("Description") %></p>
                        <p><strong>Location:</strong> <%# Eval("Location") %></p>
                        <p><strong>Start Date:</strong> <%# Eval("StartDate", "{0:MMMM dd, yyyy}") %></p>
                        <p><strong>End Date:</strong> <%# Eval("EndDate", "{0:MMMM dd, yyyy}") %></p>

                        <asp:TextBox ID="txtDonationAmount" runat="server" placeholder="Enter donation amount"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDonation" runat="server" ControlToValidate="txtDonationAmount" ErrorMessage="Donation amount is required" ForeColor="Red" ValidationGroup='<%# "vg" + Eval("EventID") %>'></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvDonation" runat="server" ControlToValidate="txtDonationAmount" MinimumValue="1" MaximumValue="10000" Type="Double" ErrorMessage="Enter a valid amount between 1 and 10000" ForeColor="Red" ValidationGroup='<%# "vg" + Eval("EventID") %>'></asp:RangeValidator>

                        <br /><br />

                        <asp:Button ID="btnDonate" runat="server" Text="Donate" CommandName="Donate" CommandArgument='<%# Eval("EventID") %>' ValidationGroup='<%# "vg" + Eval("EventID") %>'/>

                    </div>

                </ItemTemplate>

            </asp:Repeater>
        </div>

    </form>
</body>
</html>
