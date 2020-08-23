<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserBasedAuthorization.aspx.cs" Inherits="Membership_UserBasedAuthorization" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="User-Based Authorization"></asp:Label>
    </p>
    <p>
        <asp:LoginView ID="LoginViewForFileContentsBox" runat="server">
            <LoggedInTemplate>
                <asp:TextBox ID="FileContents" runat="server" Columns="72" Rows="10" TextMode="MultiLine"></asp:TextBox>
            </LoggedInTemplate>
        </asp:LoginView>
    </p>
    <p>
        <asp:GridView ID="FilesGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="FullName" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Pokaż" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LoginView ID="LoginView1" runat="server">
                            <LoggedInTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Pokaż"></asp:LinkButton>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Nazwa" />
                <asp:BoundField DataField="Length" DataFormatString="{0:N0}" HeaderText="Rozmiar w Bajtach" HtmlEncode="False" />
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
    </p>
    <p>
    </p>
</asp:Content>

