<%@ Page Title="Register For Event" Language="C#" AutoEventWireup="true" CodeBehind="Register_Event.aspx.cs" Inherits="VCMS.Browse_Register_Event" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="PageHeading card">
        <asp:Label ID="lblPageHeading" runat="server" Text="Register For Events" CssClass="lbl"></asp:Label>
    </div>

    <!-- Events Listing -->
    <div class="EventBlock">
        <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand" OnItemDataBound="rptEvents_ItemDataBound">
            <ItemTemplate>
                <div class="EventBlockContent card">

                    <h3><%# Eval("EventName") %></h3>
                    <p><strong>Beneficiaries:</strong> <%# Eval("Beneficiaries") %></p>
                    <p><strong>Description:</strong> <%# Eval("Description") %></p>
                    <p><strong>Location:</strong> <%# Eval("Location") %></p>
                    <p><strong>Start Date:</strong> <%# Eval("StartDate", "{0:MMMM dd, yyyy}") %></p>
                    <p><strong>End Date:</strong> <%# Eval("EndDate", "{0:MMMM dd, yyyy}") %></p>

                    <asp:DropDownList ID="ddlSkills" runat="server" CssClass="txtBoxes"></asp:DropDownList>
                    <br />

                    <asp:Button ID="btnRegister" runat="server" Text="Register" CommandName="Register" CommandArgument='<%# Eval("EventID") %>' CssClass="buttons" />

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Page-specific styles -->
    <style>
        /* Page heading */
        .PageHeading {
            text-align: center;
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
        }

        .PageHeading .lbl {
            font-size: 28px;
        }

        /* Event block */
        .EventBlock {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 800px;
            margin: 0 auto 50px auto;
        }

        .EventBlockContent {
            padding: 20px;
        }

        .EventBlockContent h3 {
            margin-top: 0;
            color: #004D40;
            font-size: 22px;
            font-weight: 700;
            border-bottom: 2px solid #00796B;
            padding-bottom: 5px;
        }

        .EventBlockContent p {
            margin: 5px 0;
        }

        /* Adjust spacing for dropdown and button */
        .EventBlockContent .txtBoxes {
            width: 200px;
            margin-bottom: 5px;
        }

        .EventBlockContent .buttons {
            margin-top: 10px;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .EventBlock {
                gap: 15px;
            }

            .PageHeading .lbl {
                font-size: 24px;
            }

            .EventBlockContent {
                padding: 15px;
            }
        }
    </style>

</asp:Content>
