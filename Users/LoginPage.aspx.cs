using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                Response.Redirect("~/UnauthorizedAccess.aspx");
        }
            

    }

    //protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    //{
        //if(YourValidationFunction(Login1.UserName, Login1.Password))
        //{
        //    string name = Login1.UserName;
        //    //e.Authenticated = true;
        //    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
        //    //Login1.Visible = false;
        //    //if (User.Identity.IsAuthenticated)
        //    //    Label5.Text = "WYGRANA";
        //    //Label6.Text = "Sukces";
        //}   
        //else
        //{
        //    e.Authenticated = false;
        //}

        //if(Membership.ValidateUser(Login1.UserName, Login1.Password))
        //{
        //    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
        //}

        
    //}

    protected void Login1_LoginError(object sender, EventArgs e)
    {
        Login1.FailureText = "Logowanie nie powiodło się. Spróbuj ponownie.";
        MembershipUser usrInfo = Membership.GetUser(Login1.UserName);
        if(usrInfo != null)
        {
            if (usrInfo.IsLockedOut)
            {
                Login1.FailureText = "Konto zostało zablokowane z po przekroczeniu limitu nieudanych logować. Skontaktuj się z administratorem.";
            }
            else if (!usrInfo.IsApproved)
            {
                Login1.FailureText = "Twoje konto nie zostało jeszcze zatwierdzone.";
            }
        }
    }

    private bool YourValidationFunction(string UserName, string Password)
    {
        bool boolReturnValue = false;
        SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string SQLQuery = "SELECT [Name], [Password] FROM [Users]";
        SqlCommand cmd = new SqlCommand(SQLQuery, strConnection);
        SqlDataReader Dr;
        strConnection.Open();
        Dr = cmd.ExecuteReader();
        while (Dr.Read())
        {
            string personName = Dr["Name"].ToString();
            string personPass = Dr["Password"].ToString();
            Label6.Text = UserName + " " + Password;
            
            bool name = String.Compare(personName, UserName) == 0;
            bool pass = String.Compare(personPass, Password) == 0;

            if (name && pass)
            {
                Label6.Text = Dr["Password"].ToString();
                boolReturnValue = true;
            }
        }
        Dr.Close();
        return boolReturnValue;
    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Server.Transfer("MainPage.aspx");
    }

}