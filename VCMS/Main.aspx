<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="VCMS.Main" MasterPageFile="~/Site1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Main container -->
    <div class="main-container card">

        <!-- Page Heading -->
        <h1 class="lbl main-heading">Welcome to VCSM</h1>

        <!-- Description -->
        <p class="main-description">
            The Volunteer & Donation Management System (VCSM) helps users and administrators manage events, donations, and volunteer activities efficiently. 
            Use the navigation bar above to explore the system features.
        </p>

    </div>

    <!-- Page-specific styles -->
    <style>
        /* Center the main container */
        .main-container {
            max-width: 700px;
            margin: 60px auto;
            padding: 30px;
            text-align: center;
        }

        /* Heading style */
        .main-heading {
            font-size: 32px;
            margin-bottom: 20px;
            color: #004D40;
        }

        /* Description style */
        .main-description {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 480px) {
            .main-container {
                margin: 30px 20px;
                padding: 20px;
            }

            .main-heading {
                font-size: 26px;
            }

            .main-description {
                font-size: 16px;
            }
        }
    </style>

</asp:Content>
