<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CadrePage.aspx.cs" Inherits="CadrePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 959px;
        }
        .auto-style4 {
            width: 191px;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style8 {
        text-align: left;
        width: 600px;
        height: 23px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style8">
        <asp:Label ID="Label5" runat="server" Text="Oto kadra naszej przychodni:"></asp:Label>
    </p>
    <p class="auto-style6">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="CadreSqlDataSource">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="NameAndSurnameLabel" runat="server" Text='<%# Eval("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecializationLabel" runat="server" Text='<%# Eval("Specialization") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color:#008A8C;color: #FFFFFF;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Aktualizuj" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" />
                            </td>
                            <td>
                                <asp:TextBox ID="NameAndSurnameTextBox" runat="server" Text='<%# Bind("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SpecializationTextBox" runat="server" Text='<%# Bind("Specialization") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>Nie zostały zwrócone żadne dane.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Wstaw" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Wyczyść" />
                            </td>
                            <td>
                                <asp:TextBox ID="NameAndSurnameTextBox" runat="server" Text='<%# Bind("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SpecializationTextBox" runat="server" Text='<%# Bind("Specialization") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="NameAndSurnameLabel" runat="server" Text='<%# Eval("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecializationLabel" runat="server" Text='<%# Eval("Specialization") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">NameAndSurname</th>
                                            <th runat="server">Specialization</th>
                                            <th runat="server">Comment</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="NameAndSurnameLabel" runat="server" Text='<%# Eval("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecializationLabel" runat="server" Text='<%# Eval("Specialization") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="CadreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT UserProfiles.NameAndSurname, Cadre.Specialization, Cadre.Comment FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN Cadre INNER JOIN UserProfiles ON Cadre.UserId = UserProfiles.UserId ON aspnet_Users.UserId = Cadre.UserId AND aspnet_Users.UserId = UserProfiles.UserId WHERE (aspnet_Roles.RoleName = @RoleName)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="doctor" Name="RoleName" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PatientCadreSqlDataSource" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" SortExpression="NameAndSurname" />
                        <asp:BoundField DataField="Specialization" HeaderText="Specialization" SortExpression="Specialization" />
                        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                        <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="PatientCadreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT UserProfiles.NameAndSurname, Cadre.Specialization, Cadre.Comment, Cadre.Room FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN Cadre ON aspnet_Users.UserId = Cadre.UserId INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId WHERE (aspnet_Roles.RoleName = @RoleName)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="doctor" Name="RoleName" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

