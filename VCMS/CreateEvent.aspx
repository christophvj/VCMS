<%@ Page Title="Create Event" Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="VCMS.CreateEvent" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="create-event-container card">
        <h2 class="page-title">Create New Event</h2>

        <!-- Beneficiary -->
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Beneficiary:" CssClass="lbl"></asp:Label>
            <asp:DropDownList ID="BeneficiaryDropDown" runat="server" CssClass="txtBoxes"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="BeneficiaryDropDown" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
            <asp:Label ID="lblBenmseg" runat="server" Visible="False" CssClass="lbl"></asp:Label>
        </div>

        <!-- Event Name -->
        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Name of Event:" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtEventName" runat="server" CssClass="txtBoxes"></asp:TextBox>
        </div>

        <!-- Description -->
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Description:" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="txtBoxes" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtDescription" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <!-- Location -->
        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Location:" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server" CssClass="txtBoxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtLocation" ErrorMessage="Required field" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <!-- Start Date -->
          <!-- Start Date -->
          <div class="form-group calendar-group">
              <asp:Label ID="Label4" runat="server" Text="Start Date:" CssClass="lbl"></asp:Label>
              <asp:Calendar ID="cldrStartDate" runat="server" CssClass="calendar"
                 OnSelectionChanged="cldrStartDate_SelectionChanged"
               OnDayRender="cldrStartDate_DayRender" />
             
          </div>


        <!-- End Date -->
        <div class="form-group calendar-group">
            <asp:Label ID="Label5" runat="server" Text="End Date:" CssClass="lbl"></asp:Label>
            <asp:Calendar ID="cldrEndDate" runat="server" CssClass="calendar" OnSelectionChanged="cldrEndDate_SelectionChanged"></asp:Calendar>
        </div>

        <!-- Save Button -->
        <div class="form-group">
            <asp:Button ID="btnSaveEvent" runat="server" Text="Save Event" CssClass="buttons" OnClick="btnSaveEvent_Click" />
            <asp:Label ID="lblSaveMSg" runat="server" Visible="False" CssClass="lbl"></asp:Label>
        </div>
    </div>

    <!-- Page-Specific Styling -->
    <style>
        .create-event-container {
            max-width: 600px;
            margin: 40px auto;
            border-radius: 10px;
        }

        .page-title {
            text-align: center;
            color: #004D40;
            margin-bottom: 25px;
            font-size: 1.8em;
            font-weight: 700;
        }

        .form-group {
            text-align: center;
            margin-top: 15px;
        }

        .calendar {
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 8px;
            width: 100%;
            background-color: #f9f9f9;
        }

        .calendar-group {
            display: flex;
            flex-direction: column;
        }

        .error {
            color: red;
            font-size: 13px;
            display: block;
            margin-top: 4px;
        }
    </style>

</asp:Content>
