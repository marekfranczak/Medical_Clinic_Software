using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership_CreatingUserAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterUser_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        string trimmedUserName = RegisterUser.UserName.Trim();
        if(RegisterUser.UserName.Length != trimmedUserName.Length)
        {
            InvalidUserNameOrPassword.Text = "Nazwa użytkowania nie może zawierać spacji.";
            InvalidUserNameOrPassword.Visible = true;

            e.Cancel = true;
        }
        else
        {
            if(RegisterUser.Password.IndexOf(RegisterUser.UserName, StringComparison.OrdinalIgnoreCase) >= 0)
            {
                InvalidUserNameOrPassword.Text = "Nazwa użytkownika nie może zawierać się w haśle.";
                InvalidUserNameOrPassword.Visible = true;

                e.Cancel = true;
            }
        }
    }

    protected void RegisterUser_ActiveStepChanged(object sender, EventArgs e)
    {
        if (RegisterUser.ActiveStep.Title == "Gotowe")
        {
            WizardStep UserSetting = RegisterUser.FindControl("UserSettings") as WizardStep;

            TextBox HomeTown = UserSettings.FindControl("HomeTown") as TextBox;
            TextBox Homepage = UserSetting.FindControl("Homepage") as TextBox;
            TextBox Signature = UserSetting.FindControl("Signature") as TextBox;

            MembershipUser newUser = Membership.GetUser(RegisterUser.UserName);
            Guid newUserId = (Guid)newUser.ProviderUserKey;

            string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
            string updateUrl = "INSERT INTO UserProfiles(HomeTown, HomepageUrl, Signature, UserId) VALUES  (@HomeTown, @HomepageUrl, @Signature, @UserId)";

            using(SqlConnection myConnection = new SqlConnection(connectingString))
            {
                myConnection.Open();
                SqlCommand myCommand = new SqlCommand(updateUrl, myConnection);
                myCommand.Parameters.AddWithValue("@HomeTown", HomeTown.Text.Trim());
                myCommand.Parameters.AddWithValue("@HomepageUrl", Homepage.Text.Trim());
                myCommand.Parameters.AddWithValue("@Signature", Signature.Text.Trim());
                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }
        }
    }
}