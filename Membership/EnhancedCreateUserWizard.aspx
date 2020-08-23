<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EnhancedCreateUserWizard.aspx.cs" Inherits="Membership_EnhancedCreateUserWizard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label5" runat="server" Font-Names="Franklin Gothic Demi Cond" Font-Size="XX-Large" ForeColor="Blue" Text="Lista użytkowników"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" SortExpression="LastLoginDate" />
                <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="Street Number" HeaderText="Street Number" SortExpression="Street Number" />
                <asp:BoundField DataField="Postal Code" HeaderText="Postal Code" SortExpression="Postal Code" />
                <asp:BoundField DataField="Date of birth" HeaderText="Date of birth" SortExpression="Date of birth" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT aspnet_Membership.UserId, aspnet_Users.UserName, aspnet_Membership.Email, aspnet_Membership.LastLoginDate, UserProfiles.Town, UserProfiles.Street, UserProfiles.[Street Number], UserProfiles.[Postal Code], UserProfiles.[Date of birth] FROM aspnet_Users INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId"></asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>

