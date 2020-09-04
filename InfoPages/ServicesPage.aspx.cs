using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServicesPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole("patient"))
        {
            MultiView1.SetActiveView(View2);
        }
        else
        {
            MultiView1.SetActiveView(View1);
        }
    }



    protected void SignUpButton_Click(object sender, EventArgs e)
    {
        
        String serviceString = ServiceChoiseView.SelectedRow.Cells[1].Text;
        
        String calendar = DatePicker.SelectedDate.Year.ToString() + "-" + DatePicker.SelectedDate.Month.ToString() + "-" + DatePicker.SelectedDate.Day.ToString();
        
        String time = TimePicker.SelectedItem.Text;
        time += ":00";
        

        int serviceId = -1;
        string comment = string.Empty;
        string sql = "SELECT [ServiceId] FROM [Services] WHERE Service = @Service";
        string conStrning = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@Service", ServiceChoiseView.SelectedRow.Cells[1].Text);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                serviceId = reader.GetInt32(0);
            }
            con.Close();
        }

        
        Guid guid = new Guid(); 
        string userName = User.Identity.Name;
        string UserSql = "SELECT [UserId] FROM [aspnet_Users] WHERE UserName = @UserName";

        string conStringUser = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrning))
        {
            SqlCommand cmd = new SqlCommand(UserSql, con);
            con.Open();
            cmd.Parameters.AddWithValue("@UserName", userName);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                guid = reader.GetGuid(0);
            }
            con.Close();
        }

        string connectingString = ConfigurationManager.ConnectionStrings["BBB"].ConnectionString;
        string createUrl = "INSERT INTO PatientHistory(ServicesId, Comment, Data, Time, DataAndTime, UserId) VALUES  (@ServiceId, @Comment, @Data, @Time, @DataAndTime, @UserId)";

        using (SqlConnection myConnection = new SqlConnection(connectingString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(createUrl, myConnection);
            myCommand.Parameters.AddWithValue("@ServiceId", serviceId);
            myCommand.Parameters.AddWithValue("@Comment", comment);
            myCommand.Parameters.AddWithValue("@Data", calendar);
            myCommand.Parameters.AddWithValue("@Time", time);
            myCommand.Parameters.AddWithValue("@DataAndTime", calendar+" "+time);
            myCommand.Parameters.AddWithValue("@UserId", guid.ToString("D"));
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        DataLabel.Text = " Udało się zapisać na wizytę!";
    }

    

}