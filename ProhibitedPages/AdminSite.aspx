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
            <asp:SqlDataSource ID="AddServicesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT UserProfiles.NameAndSurname, UserProfiles.UserId, aspnet_Roles.RoleName FROM aspnet_UsersInRoles INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN UserProfiles ON aspnet_UsersInRoles.UserId = UserProfiles.UserId WHERE (aspnet_Roles.RoleName = @RoleName)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="doctor" Name="RoleName" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="ServicesGridView" DataKeyNames="ServiceId" runat="server" AutoGenerateColumns="False" OnRowEditing="EditService" OnRowDataBound="RowDataBound" OnRowUpdating="UpdateService" OnRowCancelingEdit="CancelEdit" >
                <Columns>
                    <asp:CommandField ShowEditButton="true" />
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
                            <asp:Label ID="LabelDoctor" runat="server" Text='<%# Bind("NameAndSurname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Doctorddl" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <table class="auto-style3">
                <tr>
                    <td>Zabieg:<asp:TextBox ID="ServicesText" runat="server"></asp:TextBox>
                    </td>
                    <td>Cena:<asp:TextBox ID="PriceText" runat="server"></asp:TextBox>
                    </td>
                    <td>Lekarz:<asp:DropDownList ID="DoctorDropDownList" runat="server" DataSourceID="AddServicesSqlDataSource" DataTextField="NameAndSurname" DataValueField="UserId">
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
            <asp:GridView ID="CadreGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="CadreSqlDataSource" DataKeyNames="DoctorId" OnRowUpdating="CadreGridView_RowUpdating">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="DoctorId" HeaderText="DoctorId" InsertVisible="False" ReadOnly="True" SortExpression="DoctorId" />
                    <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" ReadOnly="True" SortExpression="NameAndSurname" />
                    <asp:TemplateField HeaderText="Specialization" SortExpression="Specialization">
                        <EditItemTemplate>
                            <asp:TextBox ID="SpecializationTextBox" runat="server" Text='<%# Bind("Specialization") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Specialization") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                        <EditItemTemplate>
                            <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Room" SortExpression="Room">
                        <EditItemTemplate>
                            <asp:TextBox ID="RoomTextBox" runat="server" Text='<%# Bind("Room") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Room") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="CadreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT aspnet_Roles.RoleName, UserProfiles.NameAndSurname, Cadre.Specialization, Cadre.Comment, Cadre.Room, Cadre.DoctorId FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN UserProfiles ON aspnet_UsersInRoles.UserId = UserProfiles.UserId INNER JOIN Cadre ON aspnet_UsersInRoles.UserId = Cadre.UserId WHERE (aspnet_Roles.RoleName = @RoleName)" DeleteCommand="DELETE FROM [Cadre] WHERE [DoctorId] = @DoctorId" UpdateCommand="UPDATE Cadre SET Specialization = @Specialization, Comment = @Comment, Room = @Room FROM Cadre INNER JOIN UserProfiles ON Cadre.UserId = UserProfiles.UserId WHERE (Cadre.DoctorId = @DoctorId)" >
                <DeleteParameters>
                    <asp:Parameter Name="DoctorId" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="doctor" Name="RoleName" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Specialization" Type="String" />
                    <asp:Parameter Name="Comment" Type="String" />
                    <asp:Parameter Name="Room" Type="Int32" />
                    <asp:Parameter Name="DoctorId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </asp:View>
        <br />
        <br />
        <asp:View ID="UserView" runat="server">
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AllUserSqlDataSource" DataKeyNames="Expr1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" ReadOnly="True" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="NameAndSurname" HeaderText="NameAndSurname" SortExpression="NameAndSurname" />
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" SortExpression="Password" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                    <asp:BoundField DataField="StreetNumber" HeaderText="StreetNumber" SortExpression="StreetNumber" />
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                    <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" ReadOnly="True" SortExpression="CreateDate" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" ReadOnly="True" />
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
            <asp:Button ID="DeleteUserButton" runat="server" OnClick="DeleteUserButton_Click" Text="Usuń" />
            <br />
            <asp:SqlDataSource ID="AllUserSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.LastActivityDate, UserProfiles.UserId AS Expr1, UserProfiles.Street, aspnet_Membership.Email, aspnet_Membership.CreateDate, aspnet_Membership.Comment, aspnet_Membership.Password, aspnet_Roles.RoleName, UserProfiles.NameAndSurname, UserProfiles.DateOfBirth, UserProfiles.PostalCode, UserProfiles.StreetNumber FROM aspnet_Users INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = @Role)">
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
            <asp:CreateUserWizard ID="RegisterUser" runat="server" ContinueDestinationPageUrl="~/ProhibitedPages/AdminSite.aspx" LoginCreatedUser="False" OnActiveStepChanged="RegisterUser_ActiveStepChanged">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" />
                    <asp:WizardStep ID="AdditionalInfo" runat="server" AllowReturn="False" StepType="Step" Title="Dodatkowe informacje">
                        <table class="auto-style3">
                            <tr>
                                <td>Imię i nazwisko</td>
                                <td>
                                    <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Miasto</td>
                                <td>
                                    <asp:TextBox ID="TownTB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Ulica</td>
                                <td>
                                    <asp:TextBox ID="StreetTB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Numer budynku</td>
                                <td>
                                    <asp:TextBox ID="StreetNumberTB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Kod pocztowy</td>
                                <td>
                                    <asp:TextBox ID="PostalCodeTB" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        Data urodzenia<asp:Calendar ID="DateOfBirth" runat="server"></asp:Calendar>
                        <asp:CheckBoxList ID="RoleList" runat="server">
                        </asp:CheckBoxList>
                    </asp:WizardStep>
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
            </asp:CreateUserWizard>
        </asp:View>
        <br />
    </asp:MultiView>
    <br />
</asp:Content>

