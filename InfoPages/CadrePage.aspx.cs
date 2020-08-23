using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CadrePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated && string.Compare(User.Identity.Name, "asd") == 0)
        {
            MultiView1.SetActiveView(View3);
        }
        else if (User.Identity.IsAuthenticated)
        {
            MultiView1.SetActiveView(View2);
        }
        else
        {
            MultiView1.SetActiveView(View1);
        }
    }
}