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
        string sql = "SELECT Services.ServiceId, Services.Service, Services.Price, Services.Room, Cadre.Name FROM Cadre INNER JOIN Services ON Cadre.DoctorId = Services.DoctorId";
        string conString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    Services123.DataSource = dt;
                    Services123.DataBind();
                }
            }
        }
    }

    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && Services123.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlDoktor = (DropDownList)e.Row.FindControl("Doctorddl");
            string sql = "SELECT [DoctorId], [Name] FROM [Cadre]";
            string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStrning))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ddlDoktor.DataSource = dt;
                        ddlDoktor.DataTextField = "Name";
                        ddlDoktor.DataValueField = "Name";
                        ddlDoktor.DataBind();
                        string selectedName = DataBinder.Eval(e.Row.DataItem, "Name").ToString();
                        ddlDoktor.Items.FindByValue(selectedName).Selected = true;
                    }
                }
            }
        }
    }

    protected void EditService(object sender, GridViewEditEventArgs e)
    {
        Services123.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Services123.EditIndex = -1;
        this.DataBind();
    }

    protected void UpdateService(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList doctor = Services123.Rows[e.RowIndex].FindControl("Doctorddl") as DropDownList;
        TextBox ServiceTexBox = Services123.Rows[e.RowIndex].FindControl("ServiceTextBox") as TextBox;
        TextBox PriceTextBox = Services123.Rows[e.RowIndex].FindControl("PriceTextBox") as TextBox;
        TextBox RoomTextBox = Services123.Rows[e.RowIndex].FindControl("RoomTextBox") as TextBox;

        int doctorId=0;
        string sql = "SELECT [DoctorId] FROM [Cadre] WHERE Name = @Name";
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

        int serviceLabelID = Int32.Parse(Services123.DataKeys[e.RowIndex].Value.ToString());
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
    }
      
    protected void ServicesButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(ServicesView);
    }

    protected void CadreButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CadreView);
    }

    protected void PatientButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(PatientView);
    }

    protected void UserButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(UserView);
        
    }

    protected void AddCadreButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
    }


    protected void RegisterUserWithRoles_ActiveStepChanged(object sender, EventArgs e)
    {
        if(RegisterUserWithRoles.ActiveStep.Title == "Gotowe")
        {
            WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;

            CheckBoxList RoleList = SpecifyRolesStep.FindControl("RoleList") as CheckBoxList;

            foreach(ListItem li in RoleList.Items)
            {
                if (li.Selected)
                    Roles.AddUserToRole(RegisterUserWithRoles.UserName, li.Text);
            }
        }
    }

    protected void CreateNewUserButton_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CreateNewUserView);
        WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;
        CheckBoxList RoleList = SpecifyRolesStep.FindControl("RoleList") as CheckBoxList;
        RoleList.DataSource = Roles.GetAllRoles();
        RoleList.DataBind();
    }

    protected void AddServiceButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        int doctorId = 0;
        string sql = "SELECT [DoctorId] FROM [Cadre] WHERE Name = @Name";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@Name", DoctorDropDownList.SelectedItem.Text.Trim());
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

    protected void Services123_RowDeleted(object sender, GridViewDeleteEventArgs e)
    {
        string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string updateUrl = "DELETE FROM Services WHERE ServiceId = @ServiceId";
        int serviceID = Int32.Parse(Services123.DataKeys[e.RowIndex].Value.ToString());

        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(updateUrl, myConnection);
            myCommand.Parameters.AddWithValue("@ServiceId", serviceID);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        BindGrid();

    }







}