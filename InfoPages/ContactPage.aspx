<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactPage.aspx.cs" Inherits="ContactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 959px;
        }
        .auto-style4 {
            width: 191px;
        }
        .auto-style8 {
            width: 200px;
            text-align:left;
        }
        .auto-style9 {
            color: #0000FF;
            text-align:left;
        }
        .auto-style10{
            text-align:left;
        }
    .auto-style11 {
        width: 600px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style11">
        <asp:Label CssClass="auto-style10" ID="Label5" runat="server" Text="Kontakt:"></asp:Label>
    </p>
    <p>
        <table class="auto-style8">
            <tr>
                <td class="auto-style9"><em>Miasto</em></td>
            </tr>
            <tr>
                <td class="auto-style9"><em>Ulica</em></td>
            </tr>
            <tr>
                <td class="auto-style9"><em>tel.: 123 456 789</em></td>
            </tr>
            <tr>
                <td class="auto-style9"><em>tel.: 987 654 321</em></td>
            </tr>
            <tr>
                <td class="auto-style9"><em>email: strona@domena.pl</em></td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

