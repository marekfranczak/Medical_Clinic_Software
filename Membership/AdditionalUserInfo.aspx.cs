using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership_AdditionalUserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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