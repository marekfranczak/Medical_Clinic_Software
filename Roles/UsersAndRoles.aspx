<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UsersAndRoles.aspx.cs" Inherits="Roles_UsersAndRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .Important
        {
        font-size: large;
        color: Red;
        }
        .auto-style6 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p align="center"> 

     <asp:Label ID="ActionStatus" runat="server" class="Important"></asp:Label> 
</p>
    <p align="center" class="auto-style6"> 

        <strong>Manage Roles by User</strong></p>
    <p align="left"> 
        <b>Select a User:</b> 
        <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged">
        </asp:DropDownList>
</p>
    <p align="left"> 
        &nbsp;<asp:Repeater ID="UserRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true"
                    Text='<%# Container.DataItem %>' OnCheckedChanged="RoleCheckBox_CheckChanged"/>
                <br />
            </ItemTemplate>
        </asp:Repeater>
</p>
    <p align="center" class="auto-style6"> 
        <strong>Manage Users by Role</strong></p>
    <p align="left"> 
        <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RoleList_SelectedIndexChanged">
        </asp:DropDownList>
</p>
    <p align="left"> 
        <asp:GridView ID="RolesUserList" runat="server" EmptyDataText="No users belong to this role." AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="RolesUserList_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Users">
                    <ItemTemplate>
                        <asp:Label ID="UserNameLabel" runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
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
    <b>UserName:</b> 
    <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox> 
    <br /> 
    <asp:Button ID="AddUserToRoleButton" runat="server" Text="Add User to Role" OnClick="AddUserToRoleButton_Click" /> 
</p>
</asp:Content>

