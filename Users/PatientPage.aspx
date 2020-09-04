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
            <asp:ListItem Value="2">Wizyty</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p class="auto-style6">
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <br />
                <asp:DetailsView ID="UserProfile" runat="server" OnItemUpdated="UserProfile_ItemUpdated" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Height="100px" Width="75px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <Fields>
                        <asp:TemplateField HeaderText="Imię i nazwisko" SortExpression="NameAndSurname">
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("NameAndSurname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("NameAndSurname") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("NameAndSurname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Miasto" SortExpression="Town">
                            <EditItemTemplate>
                                <asp:TextBox ID="TownTextBox" runat="server" Text='<%# Bind("Town") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Town") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Town") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ulica" SortExpression="Street">
                            <EditItemTemplate>
                                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Street") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Street") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numer budynku" SortExpression="StreetNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="StreetNumberTextBox" runat="server" Text='<%# Bind("StreetNumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StreetNumber") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("StreetNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kod pocztowy" SortExpression="PostalCode">
                            <EditItemTemplate>
                                <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PostalCode") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("PostalCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data urodzin" SortExpression="DateOfBirth">
                            <EditItemTemplate>
                                <asp:TextBox ID="DateOfBirthTextBox" runat="server" Text='<%# Bind("DateOfBirth", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateOfBirth", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("DateOfBirth", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:Label ID="SettingUpdateMessage" runat="server" EnableViewState="False" Text="Twoje ustaweienia zostały zaktualizowane" Visible="False"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT Town, Street, StreetNumber, PostalCode, DateOfBirth, NameAndSurname FROM UserProfiles WHERE (UserId = @UserId)" UpdateCommand="UPDATE UserProfiles SET Street =@Street, Town = @Town, StreetNumber = @StreetNumber, PostalCode = @PostalCode, DateOfBirth = @DateOfBirth, NameAndSurname = @Name FROM UserProfiles INNER JOIN aspnet_Users ON UserProfiles.UserId = aspnet_Users.UserId WHERE (aspnet_Users.UserId = @UserId)" OnUpdating="SqlDataSource1_Updating">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Town" />
            <asp:Parameter Name="Street" />
            <asp:Parameter Name="PostalCode" />
            <asp:Parameter Name="DateOfBirth" />
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="StreetNumber" />
        </UpdateParameters>
    </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:ChangePassword ID="ChangePassword1" runat="server">
                </asp:ChangePassword>
            </asp:View>
            <br />
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="PatientHistry" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                        <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" SortExpression="NameAndSurname" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT Services.Service, UserProfiles.NameAndSurname, Services.Price, PatientHistory.Data, PatientHistory.Time FROM Cadre INNER JOIN Services ON Cadre.DoctorId = Services.DoctorId INNER JOIN PatientHistory ON Services.ServiceId = PatientHistory.ServicesId INNER JOIN UserProfiles ON Cadre.UserId = UserProfiles.UserId WHERE (PatientHistory.UserId = @UserId)">
                    <SelectParameters>
                        <asp:Parameter Name="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <br />
            <br />
            <asp:View ID="View4" runat="server">
                <asp:GridView ID="DoctorHistry" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" DataKeyNames="HistryId">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" SortExpression="NameAndSurname" />
                        <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" OnSelecting="SqlDataSource4_Selecting" SelectCommand="SELECT PatientHistory.HistryId, PatientHistory.ServicesId, PatientHistory.Data, Services.Service, PatientHistory.UserId, UserProfiles.NameAndSurname, PatientHistory.Time, PatientHistory.Comment FROM PatientHistory INNER JOIN Services ON PatientHistory.ServicesId = Services.ServiceId INNER JOIN Cadre ON Services.DoctorId = Cadre.DoctorId INNER JOIN UserProfiles ON PatientHistory.UserId = UserProfiles.UserId WHERE (Cadre.UserId = @UserId)">
                    <SelectParameters>
                        <asp:Parameter Name="UserId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                Komentarz:<br />
                <asp:TextBox ID="CommentTB" runat="server" Height="72px" Width="577px"></asp:TextBox>
                <br />
                <asp:Button ID="AddComment" runat="server" Text="Dodaj komentarz" OnClick="AddComment_Click" />
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <p class="auto-style6">
        &nbsp;</p>
</asp:Content>

