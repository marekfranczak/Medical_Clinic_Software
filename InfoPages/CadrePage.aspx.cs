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
        if (User.IsInRole("patient"))
        {
            MultiView1.SetActiveView(View2);
        }
        else
        {
            MultiView1.SetActiveView(View1);
        }
    }
}