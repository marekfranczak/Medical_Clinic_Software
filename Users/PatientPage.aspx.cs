using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            MultiView1.SetActiveView(View3);
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
}