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
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="ImięLabel" runat="server" Text='<%# Eval("Imię") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecjalizacjaLabel" runat="server" Text='<%# Eval("Specjalizacja") %>' />
                            </td>
                            <td>
                                <asp:Label ID="KomentarzLabel" runat="server" Text='<%# Eval("Komentarz") %>' />
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
                                <asp:TextBox ID="ImięTextBox" runat="server" Text='<%# Bind("Imię") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SpecjalizacjaTextBox" runat="server" Text='<%# Bind("Specjalizacja") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="KomentarzTextBox" runat="server" Text='<%# Bind("Komentarz") %>' />
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
                                <asp:TextBox ID="ImięTextBox" runat="server" Text='<%# Bind("Imię") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SpecjalizacjaTextBox" runat="server" Text='<%# Bind("Specjalizacja") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="KomentarzTextBox" runat="server" Text='<%# Bind("Komentarz") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="ImięLabel" runat="server" Text='<%# Eval("Imię") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecjalizacjaLabel" runat="server" Text='<%# Eval("Specjalizacja") %>' />
                            </td>
                            <td>
                                <asp:Label ID="KomentarzLabel" runat="server" Text='<%# Eval("Komentarz") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">Imię</th>
                                            <th runat="server">Nazwisko</th>
                                            <th runat="server">Specjalizacja</th>
                                            <th runat="server">Komentarz</th>
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
                                <asp:Label ID="ImięLabel" runat="server" Text='<%# Eval("Imię") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SpecjalizacjaLabel" runat="server" Text='<%# Eval("Specjalizacja") %>' />
                            </td>
                            <td>
                                <asp:Label ID="KomentarzLabel" runat="server" Text='<%# Eval("Komentarz") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [Imię], [Nazwisko], [Specjalizacja], [Komentarz] FROM [Cadre]"></asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Imię" HeaderText="Imię" SortExpression="Imię" />
                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                        <asp:BoundField DataField="Specjalizacja" HeaderText="Specjalizacja" SortExpression="Specjalizacja" />
                        <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" SortExpression="Komentarz" />
                        <asp:BoundField DataField="Pokój" HeaderText="Pokój" SortExpression="Pokój" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [Imię], [Nazwisko], [Specjalizacja], [Komentarz], [Pokój] FROM [Cadre]"></asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" DataKeyNames="IDDoktora">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="IDDoktora" HeaderText="IDDoktora" InsertVisible="False" ReadOnly="True" SortExpression="IDDoktora" />
                        <asp:BoundField DataField="Imię" HeaderText="Imię" SortExpression="Imię" />
                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                        <asp:BoundField DataField="Specjalizacja" HeaderText="Specjalizacja" SortExpression="Specjalizacja" />
                        <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" SortExpression="Komentarz" />
                        <asp:BoundField DataField="Pokój" HeaderText="Pokój" SortExpression="Pokój" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT Imię, Nazwisko, Specjalizacja, Komentarz, Pokój, IDDoktora FROM Cadre" DeleteCommand="DELETE FROM Cadre WHERE (IDDoktora = @IDDoktora)" InsertCommand="INSERT INTO Cadre(Imię, Nazwisko, Specjalizacja, Komentarz, Pokój) VALUES (@Imię, @Nazwisko, @Specjalizacja, @Komentarz, @Pokój)" UpdateCommand="UPDATE Cadre SET Imię = @Imię, Nazwisko = @Nazwisko, Specjalizacja = @Specjalizacja, Komentarz = @Komentarz, Pokój = @Pokój WHERE (IDDoktora = @IDDoktora)">
                    <DeleteParameters>
                        <asp:Parameter Name="IDDoktora" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Imię" />
                        <asp:Parameter Name="Nazwisko" />
                        <asp:Parameter Name="Specjalizacja" />
                        <asp:Parameter Name="Komentarz" />
                        <asp:Parameter Name="Pokój" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Imię" />
                        <asp:Parameter Name="Nazwisko" />
                        <asp:Parameter Name="Specjalizacja" />
                        <asp:Parameter Name="Komentarz" />
                        <asp:Parameter Name="Pokój" />
                        <asp:Parameter Name="IDDoktora" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

