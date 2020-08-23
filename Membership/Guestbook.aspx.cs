using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership_Guestbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void PostCommentButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        MembershipUser currentUser = Membership.GetUser();
        Guid curretUserId = (Guid)currentUser.ProviderUserKey;

        string connectionString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string insertSql = "INSERT INTO GuestbookComments(Subject, Body, UserID) VALUES (@Subject, @Body, @UserId)";

        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
            myCommand.Parameters.AddWithValue("@Subject", Subject.Text.Trim());
            myCommand.Parameters.AddWithValue("@Body", Body.Text.Trim());
            myCommand.Parameters.AddWithValue("@UserId", curretUserId);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        Subject.Text = string.Empty;
        Body.Text = string.Empty;
        ListView1.DataBind();
    }
}