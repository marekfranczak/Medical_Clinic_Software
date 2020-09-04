<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUserPage.aspx.cs" Inherits="CreateUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:CreateUserWizard ID="CreateUser" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" CancelDestinationPageUrl="~/MainPage.aspx" ContinueDestinationPageUrl="~/PatientPage.aspx" DisplayCancelButton="True" FinishDestinationPageUrl="~/LoginPage.aspx" Font-Names="Verdana" Font-Size="10pt" OnActiveStepChanged="CreateUser_ActiveStepChanged">
            <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" >
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width:100%;height:100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button ID="StepNextButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" Font-Names="Verdana" ForeColor="#284775" Text="Utwórz użytkownika" ValidationGroup="CreateUserWizard1" />
                                </td>
                                <td align="right" colspan="0">
                                    <asp:Button ID="CancelButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="Cancel" Font-Names="Verdana" ForeColor="#284775" Text="Anuluj" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:WizardStep ID="AdditionalInfo" runat="server" StepType="Step" Title="Dodatkowe Informacje" AllowReturn="False">
                    <table class="auto-style3">
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Imię i Nazwisko"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Miasto"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="CityTB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Ulica"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="StreetTB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Numer budynku"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="StreetNumberTB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Kod pocztowy"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="PostalCodeTB" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="Label9" runat="server" Text="Data urodzenia"></asp:Label>
                    <br />
                    <asp:Calendar ID="DateOfBirth" runat="server"></asp:Calendar>
                </asp:WizardStep>
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle BorderWidth="0px" />
        </asp:CreateUserWizard>
        <br />
    </p>
    <p>
    </p>
</asp:Content>

