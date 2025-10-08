<%@ Page Title="Donation" Language="C#" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="VCMS.Donation" MasterPageFile="~/Site1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Heading -->
    <div class="PageHeading card">
        <asp:Label ID="lblPageHeading" runat="server" Text="Make a Donation" CssClass="lbl"></asp:Label>
    </div>

    <!-- Events Listing -->
    <div class="EventBlock">
        <asp:Repeater ID="rptEvents" runat="server" OnItemCommand="rptEvents_ItemCommand">
            <ItemTemplate>

                <div class="EventBlockContent card">
                    <h3><%# Eval("EventName") %></h3>
                    <p><strong>Beneficiaries:</strong> <%# Eval("Beneficiaries") %></p>
                    <p><strong>Description:</strong> <%# Eval("Description") %></p>
                    <p><strong>Location:</strong> <%# Eval("Location") %></p>
                    <p><strong>Start Date:</strong> <%# Eval("StartDate", "{0:MMMM dd, yyyy}") %></p>
                    <p><strong>End Date:</strong> <%# Eval("EndDate", "{0:MMMM dd, yyyy}") %></p>

                    <asp:TextBox ID="txtDonationAmount" runat="server" placeholder="Enter donation amount" CssClass="txtBoxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDonation" runat="server" ControlToValidate="txtDonationAmount" ErrorMessage="Donation amount is required" ForeColor="Red" ValidationGroup='<%# "vg" + Eval("EventID") %>' CssClass="lbl"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvDonation" runat="server" ControlToValidate="txtDonationAmount" MinimumValue="1" MaximumValue="10000" Type="Double" ErrorMessage="Enter a valid amount between 1 and 10000" ForeColor="Red" ValidationGroup='<%# "vg" + Eval("EventID") %>' CssClass="lbl"></asp:RangeValidator>

                    <br /><br />

                    <asp:Button ID="btnDonate" runat="server" Text="Donate" CommandName="Donate" CommandArgument='<%# Eval("EventID") %>' ValidationGroup='<%# "vg" + Eval("EventID") %>' CssClass="buttons" />

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

        /* Adjust spacing between input and buttons */
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
