using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (User.Identity.IsAuthenticated)
        //{
        //    AccountButton.Text = User.Identity.Name;
        //}
        if (Request.IsAuthenticated)
        {
            //AccountButton.Text = User.Identity.Name;
            
        }
    }

    protected void ServicessButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("ServicesPage.aspx");
    }

    protected void CadreButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("CadrePage.aspx");
    }

    protected void ContactButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("ContactPage.aspx");
    }

    protected void AccountButton_Click(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Server.Transfer("RolesDwa/PatientPage.aspx");
        else
            Server.Transfer("LoginPage.aspx");
    }



    protected void CreatingUserAccount_Click(object sender, EventArgs e)
    {

    }

    protected void UserBasedAuthorization_Click(object sender, EventArgs e)
    {

    }

    protected void Guestbook_Click(object sender, EventArgs e)
    {

    }
}