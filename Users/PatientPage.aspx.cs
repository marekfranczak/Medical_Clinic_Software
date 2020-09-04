using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PatientPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Server.Transfer("~/Users/LoginPage.aspx");
        }
    }


    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        if(System.Convert.ToInt16(DropDownList1.SelectedValue) == 0)
        {
            MultiView1.SetActiveView(View1);
        }
        if(System.Convert.ToInt16(DropDownList1.SelectedValue) == 1)
        {
            MultiView1.SetActiveView(View2);
        } else if(System.Convert.ToInt16(DropDownList1.SelectedValue) == 2)
        {
            if (User.IsInRole("patient"))
            {
                MultiView1.SetActiveView(View3);
            }
            else if (User.IsInRole("doctor"))
            {
                MultiView1.SetActiveView(View4);
            }
        }
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();

        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        e.Command.Parameters["@UserId"].Value = currentUserId;
    }

    protected void UserProfile_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        SettingUpdateMessage.Visible = true;
    }

    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();

        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        e.Command.Parameters["@UserId"].Value = currentUserId;
    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();

        Guid currentUserId = (Guid)currentUser.ProviderUserKey;


        string sql = "SELECT [DoctorId] FROM [Cadre] WHERE UserId = @UserId";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        
        int doctorId = 0;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@UserId", currentUserId);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string x = reader.GetValue(0).ToString();
                doctorId = reader.GetInt32(0);
                
            }
            con.Close();
        }

        
        e.Command.Parameters["@DoctorId"].Value = doctorId;
        
    }

    protected void AddComment_Click(object sender, EventArgs e)
    {

        int histryId = Convert.ToInt32(DoctorHistry.SelectedDataKey.Value);

        string sql = "UPDATE PatientHistory SET Comment = @Comment WHERE (HistryId = @HistryId)";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@Comment", CommentTB.Text.Trim());
            cmd.Parameters.AddWithValue("@HistryId", histryId);
            SqlDataReader reader = cmd.ExecuteReader();
            con.Close();
        }

        DoctorHistry.DataBind();
    }

    protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        TextBox Name = UserProfile.FindControl("NameTextBox") as TextBox;
        TextBox Town = UserProfile.FindControl("TownTextBox") as TextBox;
        TextBox Street = UserProfile.FindControl("StreetTextBox") as TextBox;
        TextBox StreetNumber = UserProfile.FindControl("StreetNumberTextBox") as TextBox;
        TextBox PostalCode = UserProfile.FindControl("PostalCodeTextBox") as TextBox;
        TextBox DateOfBirth = UserProfile.FindControl("DateOfBirthTextBox") as TextBox;

        MembershipUser currentUser = Membership.GetUser();
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        e.Command.Parameters["@UserId"].Value = currentUserId;
        e.Command.Parameters["@Town"].Value = Town.Text.Trim();
        e.Command.Parameters["@Street"].Value = Street.Text.Trim();
        e.Command.Parameters["@StreetNumber"].Value = StreetNumber.Text.Trim();
        e.Command.Parameters["@PostalCode"].Value = PostalCode.Text.Trim();
        e.Command.Parameters["@DateOfBirth"].Value = DateOfBirth.Text.Trim();
        e.Command.Parameters["@Name"].Value = Name.Text.Trim();
    }

    protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();

        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        e.Command.Parameters["@UserId"].Value = currentUserId;
    }
}