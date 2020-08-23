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
            float: left;
        }
        .auto-style7 {
            width: 115px;
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
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="ZabiegLabel" runat="server" Text='<%# Eval("Zabieg") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LekarzLabel" runat="server" Text='<%# Eval("Lekarz") %>' />
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
                                <asp:TextBox ID="ZabiegTextBox" runat="server" Text='<%# Bind("Zabieg") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LekarzTextBox" runat="server" Text='<%# Bind("Lekarz") %>' />
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
                                <asp:TextBox ID="ZabiegTextBox" runat="server" Text='<%# Bind("Zabieg") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LekarzTextBox" runat="server" Text='<%# Bind("Lekarz") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="ZabiegLabel" runat="server" Text='<%# Eval("Zabieg") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LekarzLabel" runat="server" Text='<%# Eval("Lekarz") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">Zabieg</th>
                                            <th runat="server">Lekarz</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="ZabiegLabel" runat="server" Text='<%# Eval("Zabieg") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LekarzLabel" runat="server" Text='<%# Eval("Lekarz") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [Zabieg], [Lekarz] FROM [Services]"></asp:SqlDataSource>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Zabieg" HeaderText="Zabieg" SortExpression="Zabieg" />
                        <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                        <asp:BoundField DataField="Pokój" HeaderText="Pokój" SortExpression="Pokój" />
                        <asp:BoundField DataField="Lekarz" HeaderText="Lekarz" SortExpression="Lekarz" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [Zabieg], [Cena], [Pokój], [Lekarz] FROM [Services]"></asp:SqlDataSource>
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

