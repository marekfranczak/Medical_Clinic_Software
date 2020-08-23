<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSite.aspx.cs" Inherits="ProhibitedPages_AdminSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="To jest stona ADMINA!!!"></asp:Label>
    <br />
    <table class="auto-style3">
        <tr>
            <td>
                <asp:Button ID="ServicesButton" runat="server" Text="Usługi" OnClick="ServicesButton_Click" />
            </td>
            <td>
                <asp:Button ID="CadreButton" runat="server" Text="Kadra" OnClick="CadreButton_Click" />
            </td>
            <td>
                <asp:Button ID="PatientButton" runat="server" Text="Pacjenci" OnClick="PatientButton_Click" />
            </td>
            <td>
                <asp:Button ID="UserButton" runat="server" Text="Użytkownicy" OnClick="UserButton_Click" />
            </td>
            <td>
                <asp:Button ID="CreateNewUserButton" runat="server" Text="Utwórz użytkownika" OnClick="CreateNewUserButton_Click" />
            </td>
            <td>
                <asp:Button ID="Button6" runat="server" Text="Button" />
            </td>
            <td>
                <asp:Button ID="Button7" runat="server" Text="Button" />
            </td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ServicesView" runat="server">
            <br />
            <asp:SqlDataSource ID="ServicesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT Services.ServiceId, Services.Service, Services.Price, Services.Room, Cadre.Name FROM Cadre INNER JOIN Services ON Cadre.DoctorId = Services.DoctorId" UpdateCommand="UPDATE Services SET Service = @Service, Price = @Price, Room = @Room, DoctorId = @DoctorId">
                <UpdateParameters>
                    <asp:Parameter Name="Service" />
                    <asp:Parameter Name="Price" />
                    <asp:Parameter Name="Room" />
                    <asp:ControlParameter Name="DoctorId" ControlID="ContentPlaceholderID$docName"/>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="AddServicesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [DoctorId], [Name]FROM [Cadre]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="Services123" DataKeyNames="ServiceId" runat="server" AutoGenerateColumns="false" OnRowEditing="EditService" OnRowDataBound="RowDataBound" OnRowUpdating="UpdateService" OnRowCancelingEdit="CancelEdit" OnRowDeleting="Services123_RowDeleted" >
                <Columns>
                    <asp:BoundField DataField="ServiceId" HeaderText="Id" />
                    <asp:TemplateField HeaderText="Service">
                        <ItemTemplate>
                            <asp:Label ID="ServiceLabel" runat="server" Text='<%# Bind("Service") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="ServiceTextBox" runat="server" Text='<%# Bind("Service") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Room">
                        <ItemTemplate>
                            <asp:Label ID="RoomLabel" runat="server" Text='<%# Bind("Room") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="RoomTextBox" runat="server" Text='<%# Bind("Room") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Doctor">
                        <ItemTemplate>
                            <asp:Label ID="LabelDoctor" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Doctorddl" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                    <asp:CommandField ShowDeleteButton ="true" />
                </Columns>
            </asp:GridView>
            <table class="auto-style3">
                <tr>
                    <td>Zabieg:<asp:TextBox ID="ServicesText" runat="server"></asp:TextBox>
                    </td>
                    <td>Cena:<asp:TextBox ID="PriceText" runat="server"></asp:TextBox>
                    </td>
                    <td>Lekarz:<asp:DropDownList ID="DoctorDropDownList" runat="server" DataSourceID="AddServicesSqlDataSource" DataTextField="Name" DataValueField="DoctorId">
                        </asp:DropDownList>
                    </td>
                    <td>Pokój:<asp:TextBox ID="RoomServiceText" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="AddServiceButton" runat="server" Text="Dodaj" OnClick="AddServiceButton_Click" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:View>
        <asp:View ID="CadreView" runat="server">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DoctorId" DataSourceID="CadreSqlDataSource" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="DoctorId" HeaderText="DoctorId" InsertVisible="False" ReadOnly="True" SortExpression="DoctorId" />
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Specialization" HeaderText="Specialization" SortExpression="Specialization" />
                    <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                    <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
            <table class="auto-style3">
                <tr>
                    <td>Imię:<asp:TextBox ID="NameText" runat="server"></asp:TextBox>
                    </td>
                    <td>Specjalizacja:<asp:TextBox ID="SpecializationText" runat="server"></asp:TextBox>
                    </td>
                    <td>Komentarz:<asp:TextBox ID="CommentText" runat="server"></asp:TextBox>
                    </td>
                    <td>Pokój:<asp:TextBox ID="RoomCadreText" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="AddCadreButton" runat="server" Text="Dodaj" OnClick="AddCadreButton_Click" />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="CadreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [DoctorId], [Name], [Specialization], [Comment], [Room] FROM [Cadre] WHERE ([DoctorId] = @DoctorId)" DeleteCommand="DELETE FROM [Cadre] WHERE [DoctorId] = @DoctorId" InsertCommand="INSERT INTO [Cadre] ([Name], [Specialization], [Comment], [Room]) VALUES (@Name, @Specialization, @Comment, @Room)" UpdateCommand="UPDATE [Cadre] SET [Name] = @Name, [Specialization] = @Specialization, [Comment] = @Comment, [Room] = @Room WHERE [DoctorId] = @DoctorId">
                <DeleteParameters>
                    <asp:Parameter Name="DoctorId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Specialization" Type="String" />
                    <asp:Parameter Name="Comment" Type="String" />
                    <asp:Parameter Name="Room" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DoctorDropDownList" Name="DoctorId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Specialization" Type="String" />
                    <asp:Parameter Name="Comment" Type="String" />
                    <asp:Parameter Name="Room" Type="Int32" />
                    <asp:Parameter Name="DoctorId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </asp:View>
        <br />
        <asp:View ID="PatientView" runat="server">
            <table class="auto-style3">
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="PatientSqlDataSource">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="PatientHistrySqlDataSource" Height="50px" Width="125px">
                            <Fields>
                                <asp:BoundField DataField="Service" HeaderText="Service" SortExpression="Service" />
                                <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="PatientSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [UserName], [UserId] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="PatientHistrySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT Services.Service, PatientHistory.Data, aspnet_Users.UserName, PatientHistory.Comment, Services.Price, aspnet_Users.UserId FROM PatientHistory INNER JOIN Services ON PatientHistory.ServicesId = Services.ServiceId INNER JOIN Patient ON PatientHistory.HistryId = Patient.PatientHistoryId INNER JOIN aspnet_Users ON Patient.UserId = aspnet_Users.UserId WHERE (aspnet_Users.UserName = @UserName) OR (aspnet_Users.UserId = @UserId)">
                <SelectParameters>
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="UserId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <br />
        <asp:View ID="UserView" runat="server">
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AllUserSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
                    <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="Street Number" HeaderText="Street Number" SortExpression="Street Number" />
                    <asp:BoundField DataField="Postal Code" HeaderText="Postal Code" SortExpression="Postal Code" />
                    <asp:BoundField DataField="Date of birth" HeaderText="Date of birth" SortExpression="Date of birth" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                    <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="AllUserSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.LastActivityDate, UserProfiles.Town, UserProfiles.Street, UserProfiles.[Street Number], UserProfiles.[Postal Code], UserProfiles.[Date of birth], aspnet_Membership.Email, aspnet_Membership.CreateDate, aspnet_Membership.Comment, aspnet_Membership.Password, aspnet_Roles.RoleName FROM aspnet_Users INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = @Role)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RolesDropDownList" DbType="String" DefaultValue="admin" Name="Role" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="RolesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
            <br />
            <asp:DropDownList ID="RolesDropDownList" runat="server" AutoPostBack="True" DataSourceID="RolesDataSource" DataTextField="RoleName" DataValueField="RoleName">
            </asp:DropDownList>
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        </asp:View>
        <br />
        <asp:View ID="CreateNewUserView" runat="server">
            <asp:CreateUserWizard ID="RegisterUserWithRoles" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" ContinueDestinationPageUrl="~/ProhibitedPages/AdminSite.aspx" Font-Names="Verdana" Font-Size="0.8em" LoginCreatedUser="False" OnActiveStepChanged="RegisterUserWithRoles_ActiveStepChanged">
                <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" />
                    <asp:WizardStep ID="SpecifyRolesStep" runat="server" AllowReturn="False" StepType="Step" Title="Określ role">
                        <asp:CheckBoxList ID="RoleList" runat="server">
                        </asp:CheckBoxList>
                    </asp:WizardStep>
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                <StepStyle BorderWidth="0px" />
            </asp:CreateUserWizard>
        </asp:View>
        <br />
    </asp:MultiView>
    <br />
</asp:Content>

