<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PatientPage.aspx.cs" Inherits="PatientPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style6 {
        width: 600px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style6">
        Witaj na swojej stronie:
        <asp:LoginName ID="LoginName1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/MainPage.aspx"  />
    </p>
    <p class="auto-style6">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MultiView1_ActiveViewChanged">
            <asp:ListItem Selected="True" Value="0">Moje dane</asp:ListItem>
            <asp:ListItem Value="1">Moje hasło</asp:ListItem>
            <asp:ListItem Value="2">Historia wizyt</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p class="auto-style6">
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <br />
                <asp:DetailsView ID="UserProfile" runat="server" OnItemUpdated="UserProfile_ItemUpdated" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="UserId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Height="100px" Width="75px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <Fields>
                        <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                        <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                        <asp:BoundField DataField="Street_Number" HeaderText="Street Number" SortExpression="Street_Number" />
                        <asp:BoundField DataField="Postal_Code" HeaderText="Postal Code" SortExpression="Postal_Code" />
                        <asp:BoundField DataField="Date_of_birth" HeaderText="Date of birth" SortExpression="Date_of_birth" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:Label ID="SettingUpdateMessage" runat="server" EnableViewState="False" Text="Twoje ustaweienia zostały zaktualizowane" Visible="False"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [UserId], [Street], [Town], [Street Number] AS Street_Number, [Postal Code] AS Postal_Code, [Date of birth] AS Date_of_birth FROM [UserProfiles] WHERE ([UserId] = @UserId)" UpdateCommand="UPDATE UserProfiles SET Town = @Town, Street = @Street, [Street Number] = @StreetNumber, [Postal Code] = @PostalCode, [Date of birth] = @DateOfBirth, UserId = WHERE (UserId = @UserId)">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Town" />
            <asp:Parameter Name="Street" />
            <asp:Parameter Name="StreetNumber" />
            <asp:Parameter Name="PostalCode" />
            <asp:Parameter Name="DateOfBirth" />
            <asp:Parameter Name="UserId" />
        </UpdateParameters>
    </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:ChangePassword ID="ChangePassword1" runat="server">
                </asp:ChangePassword>
            </asp:View>
            <br />
            <asp:View ID="View3" runat="server">
                <br />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
    </p>
    <p class="auto-style6">
        &nbsp;</p>
</asp:Content>

