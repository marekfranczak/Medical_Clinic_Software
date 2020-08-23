<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdditionalUserInfo.aspx.cs" Inherits="Membership_AdditionalUserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Bahnschrift Condensed" Font-Size="XX-Large" Text="Przekopiowano do KontaPacjenta"></asp:Label>
    <br />
    <asp:DetailsView ID="UserProfile" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="UserId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Height="100px" OnItemUpdated="UserProfile_ItemUpdated" Width="75px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:DynamicField DataField="Town" HeaderText="Town" />
            <asp:DynamicField DataField="Postal_Code" HeaderText="Postal_Code" />
            <asp:DynamicField DataField="Street_Number" HeaderText="Street_Number" />
            <asp:DynamicField DataField="Street" HeaderText="Street" />
            <asp:DynamicField DataField="Date_of_birth" HeaderText="Date_of_birth" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:Label ID="SettingUpdateMessage" runat="server" EnableViewState="False" Text="Twoje ustaweienia zostały zaktualizowane" Visible="False"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [UserId], [Town], [Street Number] AS Street_Number, [Street], [Postal Code] AS Postal_Code, [Date of birth] AS Date_of_birth FROM [UserProfiles] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

