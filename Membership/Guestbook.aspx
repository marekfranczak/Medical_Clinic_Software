<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Guestbook.aspx.cs" Inherits="Membership_Guestbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject" ErrorMessage="Wprowadz temat komentarza" ForeColor="Red" ValidationGroup="EnterComment"></asp:RequiredFieldValidator>
        <asp:TextBox ID="Subject" runat="server" CausesValidation="True" Width="500px"></asp:TextBox>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Body" ErrorMessage="Wprowadź tekst komentarza" ForeColor="Red" ValidationGroup="EnterComment"></asp:RequiredFieldValidator>
        <asp:TextBox ID="Body" runat="server" CausesValidation="True" Height="80px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="PostCommentButton" runat="server" OnClick="PostCommentButton_Click" Text="Opublikuj komentarz" ValidationGroup="EnterComment" />
    </p>
    <p>
        &nbsp;</p>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FFF8DC;">UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
            <br />
            Body:
            <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
            <br />
            CommentDate:
            <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
            <br />
            HomeTown:
            <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
            <br />
            Signature:
            <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
            <br />
            HomepageUrl:
            <asp:Label ID="HomepageUrlLabel" runat="server" Text='<%# Eval("HomepageUrl") %>' />
            <br />
<br /></span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #008A8C;color: #FFFFFF;">UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            Subject:
            <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            Body:
            <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
            <br />
            CommentDate:
            <asp:TextBox ID="CommentDateTextBox" runat="server" Text='<%# Bind("CommentDate") %>' />
            <br />
            HomeTown:
            <asp:TextBox ID="HomeTownTextBox" runat="server" Text='<%# Bind("HomeTown") %>' />
            <br />
            Signature:
            <asp:TextBox ID="SignatureTextBox" runat="server" Text='<%# Bind("Signature") %>' />
            <br />
            HomepageUrl:
            <asp:TextBox ID="HomepageUrlTextBox" runat="server" Text='<%# Bind("HomepageUrl") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Aktualizuj" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>Nie zostały zwrócone żadne dane.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
            <br />Subject:
            <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
            <br />Body:
            <asp:TextBox ID="BodyTextBox" runat="server" Text='<%# Bind("Body") %>' />
            <br />CommentDate:
            <asp:TextBox ID="CommentDateTextBox" runat="server" Text='<%# Bind("CommentDate") %>' />
            <br />HomeTown:
            <asp:TextBox ID="HomeTownTextBox" runat="server" Text='<%# Bind("HomeTown") %>' />
            <br />Signature:
            <asp:TextBox ID="SignatureTextBox" runat="server" Text='<%# Bind("Signature") %>' />
            <br />HomepageUrl:
            <asp:TextBox ID="HomepageUrlTextBox" runat="server" Text='<%# Bind("HomepageUrl") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Wstaw" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Wyczyść" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #DCDCDC;color: #000000;">UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
            <br />
            Body:
            <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
            <br />
            CommentDate:
            <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
            <br />
            HomeTown:
            <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
            <br />
            Signature:
            <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
            <br />
            HomepageUrl:
            <asp:Label ID="HomepageUrlLabel" runat="server" Text='<%# Eval("HomepageUrl") %>' />
            <br />
<br /></span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
            <br />
            Body:
            <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
            <br />
            CommentDate:
            <asp:Label ID="CommentDateLabel" runat="server" Text='<%# Eval("CommentDate") %>' />
            <br />
            HomeTown:
            <asp:Label ID="HomeTownLabel" runat="server" Text='<%# Eval("HomeTown") %>' />
            <br />
            Signature:
            <asp:Label ID="SignatureLabel" runat="server" Text='<%# Eval("Signature") %>' />
            <br />
            HomepageUrl:
            <asp:Label ID="HomepageUrlLabel" runat="server" Text='<%# Eval("HomepageUrl") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBB %>" SelectCommand="SELECT aspnet_Users.UserName, GuestbookComments.Subject, GuestbookComments.Body, GuestbookComments.CommentDate, UserProfiles.HomeTown, UserProfiles.Signature, UserProfiles.HomepageUrl FROM aspnet_Users INNER JOIN GuestbookComments ON aspnet_Users.UserId = GuestbookComments.UserID INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId ORDER BY GuestbookComments.CommentDate DESC"></asp:SqlDataSource>
    </p>
</asp:Content>

