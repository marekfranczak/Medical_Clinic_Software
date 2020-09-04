<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UnauthorizedAccess.aspx.cs" Inherits="UnauthorizedAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label5" runat="server" Text="Nie masz uprawnień aby zaglądać na tą stronę."></asp:Label>
    <br />
    <asp:Label ID="Label6" runat="server" Text="W razie pytań skontaktuj się z administracją."></asp:Label>
</asp:Content>

