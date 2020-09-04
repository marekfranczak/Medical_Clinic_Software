using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUserPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUser_ActiveStepChanged(object sender, EventArgs e)
    {
        if (CreateUser.ActiveStep.Title == "Gotowe")
        {
            WizardStep UserInfo = CreateUser.FindControl("AdditionalInfo") as WizardStep;

            TextBox Name = UserInfo.FindControl("NameTB") as TextBox;
            TextBox Town = UserInfo.FindControl("TownTB") as TextBox;
            TextBox Street = UserInfo.FindControl("StreetTB") as TextBox;
            TextBox StreetNumber = UserInfo.FindControl("StreetNumberTB") as TextBox;
            TextBox PostalCode = UserInfo.FindControl("PostalCodeTB") as TextBox;
            Calendar DateOfBirth = UserInfo.FindControl("DateOfBirth") as Calendar;

            MembershipUser newUser = Membership.GetUser(CreateUser.UserName);
            Guid newUserId = (Guid)newUser.ProviderUserKey;

            string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
            string updateUrl = "INSERT INTO UserProfiles(NameAndSurname, Town, Street, StreetNumber, PostalCode, DateOfBirth, UserId) VALUES  (@NameAndSurname, @Town, @Street, @StreetNumber, @PostalCode, @UserId)";

            using (SqlConnection myConnection = new SqlConnection(connectingString))
            {
                myConnection.Open();
                SqlCommand myCommand = new SqlCommand(updateUrl, myConnection);
                myCommand.Parameters.AddWithValue("@NameAndSurname", Name.Text.Trim());
                myCommand.Parameters.AddWithValue("@Town", Town.Text.Trim());
                myCommand.Parameters.AddWithValue("@Street", Street.Text.Trim());
                myCommand.Parameters.AddWithValue("@StreetNumber", StreetNumber.Text.Trim());
                myCommand.Parameters.AddWithValue("@PostalCode", PostalCode.Text.Trim());
                myCommand.Parameters.AddWithValue("@DateOfBirth", DateOfBirth.SelectedDate);
                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }

            string userName = CreateUser.UserName;
            Roles.AddUserToRole(userName, "patient");
        }
    }
}