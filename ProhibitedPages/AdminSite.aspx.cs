using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProhibitedPages_AdminSite : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }

    private void BindGrid()
    {
        string sql = "SELECT Services.Service, Services.ServiceId, Services.Price, Services.Room, UserProfiles.NameAndSurname FROM Services INNER JOIN Cadre ON Services.DoctorId = Cadre.DoctorId INNER JOIN UserProfiles ON Cadre.UserId = UserProfiles.UserId";
        string conString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    ServicesGridView.DataSource = dt;
                    ServicesGridView.DataBind();
                }
            }
        }
    }

    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && ServicesGridView.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlDoktor = (DropDownList)e.Row.FindControl("Doctorddl");
            string sql = "SELECT UserProfiles.NameAndSurname FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN UserProfiles ON aspnet_Users.UserId = UserProfiles.UserId WHERE (aspnet_Roles.RoleName = 'doctor')";

            string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStrning))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlDoktor.DataSource = dt;
                        ddlDoktor.DataTextField = "NameAndSurname";
                        ddlDoktor.DataValueField = "NameAndSurname";
                        ddlDoktor.DataBind();
                        string selectedName = DataBinder.Eval(e.Row.DataItem, "NameAndSurname").ToString();
                        ddlDoktor.Items.FindByValue(selectedName).Selected = true;
                    }
                }
            }
        }
    }

    protected void EditService(object sender, GridViewEditEventArgs e)
    {
        ServicesGridView.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ServicesGridView.EditIndex = -1;
        this.BindGrid();
    }

    protected void UpdateService(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList doctor = ServicesGridView.Rows[e.RowIndex].FindControl("Doctorddl") as DropDownList;
        TextBox ServiceTexBox = ServicesGridView.Rows[e.RowIndex].FindControl("ServiceTextBox") as TextBox;
        TextBox PriceTextBox = ServicesGridView.Rows[e.RowIndex].FindControl("PriceTextBox") as TextBox;
        TextBox RoomTextBox = ServicesGridView.Rows[e.RowIndex].FindControl("RoomTextBox") as TextBox;

        int doctorId=0;
        string sql = "SELECT Cadre.DoctorId FROM UserProfiles INNER JOIN Cadre ON UserProfiles.UserId = Cadre.UserId WHERE (UserProfiles.NameAndSurname = @Name)";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@Name", doctor.SelectedItem.Text.Trim());
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                doctorId = reader.GetInt32(0);
            }
            con.Close();       
        }

        int serviceLabelID = Int32.Parse(ServicesGridView.DataKeys[e.RowIndex].Value.ToString());
        string serviceString = ServiceTexBox.Text.Trim();
        int priceString = Int32.Parse(PriceTextBox.Text.Trim());
        int roomString = Int32.Parse(RoomTextBox.Text.Trim());

        string conString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            string query = "UPDATE Services SET DoctorId = @DoctorId, Service = @Service, Price = @Price, Room = @Room WHERE ServiceId = @ServiceId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@ServiceId", serviceLabelID);
                cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                cmd.Parameters.AddWithValue("@Price", priceString);
                cmd.Parameters.AddWithValue("@Room", roomString);
                cmd.Parameters.AddWithValue("@Service", serviceString);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        BindGrid();
    }
      
    protected void ServicesButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(ServicesView);
    }

    protected void CadreButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CadreView);
    }

    protected void UserButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(UserView);
        
    }

    protected void RegisterUser_ActiveStepChanged(object sender, EventArgs e)
    {
        if(RegisterUser.ActiveStep.Title == "Gotowe")
        {
            WizardStep SpecifyRolesStep = RegisterUser.FindControl("AdditionalInfo") as WizardStep;
            CheckBoxList RoleList = SpecifyRolesStep.FindControl("RoleList") as CheckBoxList;
            string userName = RegisterUser.UserName;

            foreach(ListItem li in RoleList.Items)
            {
                if (li.Selected)
                    Roles.AddUserToRole(userName, li.Text);
            }

            if (Roles.IsUserInRole(userName, "doctor"))
            {
                string connectingStringAddDoctor = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
                string addDoctorUrl = "INSERT INTO Cadre(UserId) VALUES  (@UserId)";
                MembershipUser newDoctor = Membership.GetUser(userName);
                Guid newDoctorId = (Guid)newDoctor.ProviderUserKey;

                using (SqlConnection myConnection = new SqlConnection(connectingStringAddDoctor))
                {
                    myConnection.Open();
                    SqlCommand myCommand = new SqlCommand(addDoctorUrl, myConnection);
                    myCommand.Parameters.AddWithValue("@UserId", newDoctorId);
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();
                }
            }

            WizardStep UserInfo = RegisterUser.FindControl("AdditionalInfo") as WizardStep;

            TextBox Name = UserInfo.FindControl("NameTB") as TextBox;
            TextBox Town = UserInfo.FindControl("TownTB") as TextBox;
            TextBox Street = UserInfo.FindControl("StreetTB") as TextBox;
            TextBox StreetNumber = UserInfo.FindControl("StreetNumberTB") as TextBox;
            TextBox PostalCode = UserInfo.FindControl("PostalCodeTB") as TextBox;
            String calendar = DateOfBirth.SelectedDate.Year.ToString() + "-" + DateOfBirth.SelectedDate.Month.ToString() + "-" + DateOfBirth.SelectedDate.Day.ToString();

            MembershipUser newUser = Membership.GetUser(RegisterUser.UserName);
            Guid newUserId = (Guid)newUser.ProviderUserKey;

            string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
            string updateUrl = "INSERT INTO UserProfiles(NameAndSurname, Town, Street, StreetNumber, PostalCode, DateOfBirth, UserId) VALUES  (@NameAndSurname, @Town, @Street, @StreetNumber, @PostalCode, @DateOfBirth, @UserId)";

            using (SqlConnection myConnection = new SqlConnection(connectingString))
            {
                myConnection.Open();
                SqlCommand myCommand = new SqlCommand(updateUrl, myConnection);
                myCommand.Parameters.AddWithValue("@NameAndSurname", Name.Text.Trim());
                myCommand.Parameters.AddWithValue("@Town", Town.Text.Trim());
                myCommand.Parameters.AddWithValue("@Street", Street.Text.Trim());
                myCommand.Parameters.AddWithValue("@StreetNumber", Int32.Parse(StreetNumber.Text.Trim()));
                myCommand.Parameters.AddWithValue("@PostalCode", PostalCode.Text.Trim());
                myCommand.Parameters.AddWithValue("@DateOfBirth", calendar);
                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }

        }
    }

    protected void CreateNewUserButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CreateNewUserView);
        WizardStep AdditionalInfo = RegisterUser.FindControl("AdditionalInfo") as WizardStep;
        CheckBoxList RoleList = AdditionalInfo.FindControl("RoleList") as CheckBoxList;
        RoleList.DataSource = Roles.GetAllRoles();
        RoleList.DataBind();
    }

    protected void AddServiceButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        int doctorId = 0;
        string sql = "SELECT [DoctorId] FROM [Cadre] WHERE UserId = @UserId";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string doctorName = DoctorDropDownList.SelectedItem.Text.Trim();
        
        MembershipUser doctorMembership = Membership.GetUser(doctorName);
        Guid doctorIdGuid = (Guid) doctorMembership.ProviderUserKey;

        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@UserId", doctorIdGuid);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                doctorId = reader.GetInt32(0);
            }
            con.Close();
        }

        string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string updateUrl = "INSERT INTO Services(Service, Price, Room, DoctorId) VALUES  (@Service, @Price, @Room, @DoctorId)";

        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(updateUrl, myConnection);
            myCommand.Parameters.AddWithValue("@Service", ServicesText.Text.Trim());
            myCommand.Parameters.AddWithValue("@Price", Int32.Parse(PriceText.Text.Trim()));
            myCommand.Parameters.AddWithValue("@Room", Int32.Parse(RoomServiceText.Text.Trim()));
            myCommand.Parameters.AddWithValue("@DoctorId", doctorId);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        BindGrid();
    }

    protected void CadreGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (!Page.IsValid)
            return;

        //string UserName = UserGrid.DataKeys[e.RowIndex].Value.ToString();

        TextBox SpecializationTextBox = CadreGridView.Rows[e.RowIndex].FindControl("SpecializationTextBox") as TextBox;
        TextBox CommentTextBox = CadreGridView.Rows[e.RowIndex].FindControl("CommentTextBox") as TextBox;
        TextBox RoomTextBox = CadreGridView.Rows[e.RowIndex].FindControl("RoomTextBox") as TextBox;
       

        string conString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            string query = "UPDATE Cadre SET Specialization = @Specialization, Comment = @Comment, Room = @Room WHERE DoctorId = @DoctorId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@Specialization", SpecializationTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Comment", CommentTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Room", Int32.Parse(RoomTextBox.Text.Trim()));
                cmd.Parameters.AddWithValue("@DoctorId", CadreGridView.DataKeys[e.RowIndex].Value);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Redirect(Request.Url.AbsoluteUri);
            }
        }


        CadreGridView.EditIndex = -1;
        
    }

    protected void DeleteUserButton_Click(object sender, EventArgs e)
    {
        string x = GridView4.SelectedRow.Cells[1].Text;

        string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string deleteProfile = "DELETE FROM UserProfiles WHERE UserId = @UserId";
        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(deleteProfile, myConnection);
            myCommand.Parameters.AddWithValue("@UserId", x);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        
        string deleteHistry = "DELETE FROM PatientHistory WHERE UserId = @UserId";
        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(deleteHistry, myConnection);
            myCommand.Parameters.AddWithValue("@UserId", x);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        int doctorId = 0;
        string sql = "SELECT Cadre.DoctorId FROM Cadre WHERE (UserId = @UserId)";
        using (SqlConnection con = new SqlConnection(connectingString))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@UserId", x);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                doctorId = reader.GetInt32(0);
            }
            con.Close();
        }

        string updateService = "UPDATE Services SET DoctorId = NULL WHERE DoctorId = @DoctorId";
        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(updateService, myConnection);
            myCommand.Parameters.AddWithValue("@DoctorId", doctorId);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        string deleteCdre = "DELETE FROM Cadre WHERE UserId = @UserId";
        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(deleteCdre, myConnection);
            myCommand.Parameters.AddWithValue("@UserId", x);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        Membership.DeleteUser(x);
        GridView4.DataBind();
    }
}