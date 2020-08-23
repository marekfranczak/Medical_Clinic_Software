<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RoleBasedAuthorization.aspx.cs" Inherits="Roles_RoleBasedAuthorization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:Label ID="Label7" runat="server" Text="You are not logged into the system. Therefore you cannot edit or delete any user

          information."></asp:Label>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:Label ID="Label8" runat="server" Text="You are not a member of the Supervisors or Administrators roles. Therefore you
          cannot edit or delete any user information."></asp:Label>
        </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="admin">
                <ContentTemplate>
                    <asp:Label ID="Label9" runat="server" Text="As an Administrator, you may edit and delete user accounts. 
                    Remember: With great power comes great responsibility!"></asp:Label>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="doctor">
                <ContentTemplate>
                    <asp:Label ID="Label10" runat="server" Text="As a doctor, you may edit users&#39; Email and Comment information. 
                    Simply click the Edit button, make your changes, and then click Update."></asp:Label>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <br />
    <br />
    <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" OnRowCancelingEdit="UserGrid_RowCancelingEdit" OnRowEditing="UserGrid_RowEditing" OnRowUpdating="UserGrid_RowUpdating" OnRowDeleting="UserGrid_RowDeleting" OnRowCreated="UserGrid_RowCreated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj"></asp:LinkButton>

                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj"></asp:LinkButton>
                </EditItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj"></asp:LinkButton>

                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" />
            <asp:BoundField DataField="LastLoginDate" DataFormatString="{0:d}" HeaderText="Last Login" HtmlEncode="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Email" Text='<%# Bind("Email") %>'></asp:TextBox>    

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"    
                        ControlToValidate="Email" Display="Dynamic"    
                        ErrorMessage="You must provide an email address." 
                        SetFocusOnError="True">*</asp:RequiredFieldValidator>    

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"    
                        ControlToValidate="Email" Display="Dynamic"    
                        ErrorMessage="The email address you have entered is not valid. Please fix 
                            this and try again."    
                        SetFocusOnError="True"    

                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*
                    </asp:RegularExpressionValidator>    
               </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Comment" TextMode="MultiLine"
                    Columns="40" Rows="4" Text='<%# Bind("Comment") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1"
               runat="server"
               ShowMessageBox="True"
               ShowSummary="False" />
    <br />
    <br />
</asp:Content>

