<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ServicesPage.aspx.cs" Inherits="ServicesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 959px;
            text-align:left;
        }
        .auto-style4 {
            width: 191px;
            text-align:left;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            width: 14px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label5" runat="server" Text="Usługi które oferujemy:" ></asp:Label>
    </p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <br />
            <asp:View ID="View1" runat="server">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="ServicesSqlDataSource">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="NameAndSurnameLabel" runat="server" Text='<%# Eval("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ServiceLabel" runat="server" Text='<%# Eval("Service") %>' />
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
                                <asp:TextBox ID="ServiceTextBox" runat="server" Text='<%# Bind("Service") %>' />
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
                                <asp:TextBox ID="ServiceTextBox" runat="server" Text='<%# Bind("Service") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="NameAndSurnameLabel" runat="server" Text='<%# Eval("NameAndSurname") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ServiceLabel" runat="server" Text='<%# Eval("Service") %>' />
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
                                            <th runat="server">Service</th>
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
                                <asp:Label ID="ServiceLabel" runat="server" Text='<%# Eval("Service") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="ServicesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT UserProfiles.NameAndSurname, Services.Service FROM Services INNER JOIN Cadre ON Services.DoctorId = Cadre.DoctorId INNER JOIN aspnet_Users ON Cadre.UserId = aspnet_Users.UserId INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId"></asp:SqlDataSource>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="ServiceChoiseView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PatientServicesSqlDataSource" ForeColor="#333333" GridLines="None" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                        <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" SortExpression="NameAndSurname" />
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
                <br />
                <asp:SqlDataSource ID="PatientServicesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT Services.Service, Services.Price, Services.Room, UserProfiles.NameAndSurname FROM Cadre INNER JOIN Services ON Cadre.DoctorId = Services.DoctorId INNER JOIN aspnet_Users ON Cadre.UserId = aspnet_Users.UserId INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId"></asp:SqlDataSource>
                <br />
                <asp:Panel ID="AddVisitPanel" runat="server">
                    <table class="auto-style6">
                        <tr>
                            <td>
                                <asp:Calendar ID="DatePicker" runat="server"></asp:Calendar>
                            </td>
                            <td>
                                <asp:DropDownList ID="TimePicker" runat="server">
                                    <asp:ListItem>9:00</asp:ListItem>
                                    <asp:ListItem>9:30</asp:ListItem>
                                    <asp:ListItem>10:00</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style7">
                                <asp:Button ID="SignUpButton" runat="server" OnClick="SignUpButton_Click" Text="Zapisz się" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Label ID="DataLabel" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

