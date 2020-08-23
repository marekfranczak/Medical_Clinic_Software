<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreatingUserAccount.aspx.cs" Inherits="Membership_CreatingUserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" CancelDestinationPageUrl="~/MainPage.aspx" ContinueDestinationPageUrl="~/MainPage.aspx" DisplayCancelButton="True" FinishDestinationPageUrl="~/Users/PatientPage.aspx" LoginCreatedUser="False" OnCreatingUser="RegisterUser_CreatingUser" OnActiveStepChanged="RegisterUser_ActiveStepChanged">
    <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
    <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" />
        <asp:WizardStep ID="UserSettings" runat="server" StepType="Step" Title="Your settings">
            Home Town:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="HomeTown" runat="server" Width="150px"></asp:TextBox>
            <br />
            <br />
            Homepage:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Homepage" runat="server" Width="150px"></asp:TextBox>
            <br />
            <br />
            Signature:<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Signature" runat="server" Height="64px" TextMode="MultiLine" Width="150px"></asp:TextBox>
            <br />
        </asp:WizardStep>
        <asp:CompleteWizardStep runat="server" />
    </WizardSteps>
    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
    <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
    <StepStyle BorderWidth="0px" />
</asp:CreateUserWizard>
    <asp:Label ID="InvalidUserNameOrPassword" runat="server" EnableViewState="False" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
</asp:Content>

