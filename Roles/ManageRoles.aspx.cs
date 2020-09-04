using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_ManageRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DisplayRoleInGrid();
        }
    }

    protected void CreateRoleButton_Click(object sender, EventArgs e)
    {
        string newRoleName = RoleName.Text.Trim();

        if (!Roles.RoleExists(newRoleName))
        {
            // Create the role
            Roles.CreateRole(newRoleName);

            // Refresh the RoleList Grid    
            DisplayRoleInGrid();
        }
            

        RoleName.Text = string.Empty;
    }

    private void DisplayRoleInGrid()
    {
        RoleList.DataSource = Roles.GetAllRoles();
        RoleList.DataBind();
    }

    protected void RoleList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Get the RoleNameLabel
        Label RoleNameLabel = RoleList.Rows[e.RowIndex].FindControl("RoleNameLabel") as Label;

        //Delete the role
        Roles.DeleteRole(RoleNameLabel.Text, false);

        //Refresh
        DisplayRoleInGrid();
    }
}