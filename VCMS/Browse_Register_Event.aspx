<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Browse_Register_Event.aspx.cs" Inherits="VCMS.Browse_Register_Event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Div "PageHeading" Contains Label for Page Title -->
        <div class ="PageHeading">
            <asp:Label ID="lblPageHeading" runat="server" Text="Register For Events"></asp:Label>
        </div>

        <div class="EventBlocks">
            <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand" OnItemDataBound="rptEvents_ItemDataBound">
                    <ItemTemplate>
                        <div class="EventCard">

                            <h3><%# Eval("EventName") %></h3>
                            <p><strong>Beneficiaries:</strong> <%# Eval("Beneficiaries") %></p>
                            <p><strong>Description:</strong> <%# Eval("Description") %></p>
                            <p><strong>Location:</strong> <%# Eval("Location") %></p>
                            <p><strong>Start Date:</strong> <%# Eval("StartDate", "{0:MMMM dd, yyyy}") %></p>
                            <p><strong>End Date:</strong> <%# Eval("EndDate", "{0:MMMM dd, yyyy}") %></p>

                            <asp:DropDownList ID="ddlSkills" runat="server"></asp:DropDownList>
                            <br /><br />

                            <asp:Button ID="btnRegister" runat="server" Text="Register" CommandName="Register" CommandArgument='<%# Eval("EventID") %>' />

                        </div>
                    </ItemTemplate>
            </asp:Repeater>
        </div>

    </form>
</body>
</html>
