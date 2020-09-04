using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_UsersAndRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindUsersToUserList();
            BindRolesToList();
            CheckRolesForSelectedUser();
            DisplayUsersBelongingToRole();
        }
    }

    protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
    {
        CheckBox RoleCheckBox = sender as CheckBox;

        string selectedUserName = UserList.SelectedValue;

        string roleName = RoleCheckBox.Text;

        if (RoleCheckBox.Checked)
        {
            Roles.AddUserToRole(selectedUserName, roleName);
            ActionStatus.Text = string.Format("User {0} was added to role {1}.", selectedUserName, roleName);
        }
        else
        {
            Roles.RemoveUserFromRole(selectedUserName, roleName);
            ActionStatus.Text = string.Format("User {0} was removed from role {1}.", selectedUserName, roleName);
        }

        DisplayUsersBelongingToRole();
    }

    private void BindUsersToUserList()
    {
        MembershipUserCollection users = Membership.GetAllUsers();
        UserList.DataSource = users;
        UserList.DataBind();
    }

    private void BindRolesToList()
    {
        string[] roles = Roles.GetAllRoles();
        UserRoleList.DataSource = roles;
        UserRoleList.DataBind();

        RoleList.DataSource = roles;
        RoleList.DataBind();
    }

    private void CheckRolesForSelectedUser()
    {
        //Determine what roles the selected user belong to
        string selectedUserName = UserList.SelectedValue;
        string[] selectedUsersRoles = Roles.GetRolesForUser(selectedUserName);

        foreach(RepeaterItem ri in UserRoleList.Items)
        {
            //Programmatically reference the CheckBox
            CheckBox RoleCheckBox = ri.FindControl("RoleCheckBox") as CheckBox;
            //See if CheckBox.Text is in selectedRoles
            if (selectedUsersRoles.Contains<string>(RoleCheckBox.Text))
            {
                RoleCheckBox.Checked = true;
            }
            else
            {
                RoleCheckBox.Checked = false;
            }
        }
    }

    private void DisplayUsersBelongingToRole()
    {
        string selectingRole = RoleList.SelectedValue;

        string[] usersBelongingToRole = Roles.GetUsersInRole(selectingRole);

        RolesUserList.DataSource = usersBelongingToRole;
        RolesUserList.DataBind();
    }

    protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckRolesForSelectedUser();
    }

    protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayUsersBelongingToRole();
    }

    protected void RolesUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string selectedRoleName = RoleList.SelectedValue;

        Label UserNameLabel = RolesUserList.Rows[e.RowIndex].FindControl("UserNameLabel") as Label;

        Roles.RemoveUserFromRole(UserNameLabel.Text, selectedRoleName);

        DisplayUsersBelongingToRole();

        ActionStatus.Text = string.Format("User {0} was removed from role {1}", UserNameLabel.Text, selectedRoleName);
        CheckRolesForSelectedUser();
    }

    protected void AddUserToRoleButton_Click(object sender, EventArgs e)
    {
        string selectedRoleName = RoleList.SelectedValue;
        string userNameToAddToRole = UserNameToAddToRole.Text;
        
        if(userNameToAddToRole.Trim().Length == 0)
        {
            ActionStatus.Text = "You must enter a username in the textbox.";
            return;
        }

        MembershipUser userInfo = Membership.GetUser(userNameToAddToRole);
        if(userInfo == null)
        {
            ActionStatus.Text = string.Format("The user {0} does not exist in the system.", userNameToAddToRole);
            return;
        }

        if(Roles.IsUserInRole(userNameToAddToRole, selectedRoleName))
        {
            ActionStatus.Text = string.Format("User {0} already is a member of role {1}.", userNameToAddToRole, selectedRoleName);
            return;
        }

        Roles.AddUserToRole(userNameToAddToRole, selectedRoleName);

        UserNameToAddToRole.Text = string.Empty;

        DisplayUsersBelongingToRole();

        ActionStatus.Text = string.Format("User {0} was added to role {1}.", userNameToAddToRole, selectedRoleName);
        CheckRolesForSelectedUser();
    }
}