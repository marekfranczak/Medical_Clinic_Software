using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership_UserBasedAuthorization : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userName = User.Identity.Name;
        if(string.Compare(userName, "asd", true) == 0)
        {
            FilesGrid.Columns[1].Visible = true;
        }
        else
        {
            FilesGrid.Columns[1].Visible = false;
        }

        if (!Page.IsPostBack)
        {
            string appPath = Request.PhysicalApplicationPath;
            DirectoryInfo dirInfo = new DirectoryInfo(appPath);

            FileInfo[] files = dirInfo.GetFiles();

            FilesGrid.DataSource = files;
            FilesGrid.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string fullName = FilesGrid.SelectedValue.ToString();
        string contents = File.ReadAllText(fullName);
        TextBox FileContentsTextBox = LoginViewForFileContentsBox.FindControl("FileContents") as TextBox;
        FileContentsTextBox.Text = contents;
        //FileContents.Text = contents;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string fullName = FilesGrid.DataKeys[e.RowIndex].Value.ToString();
        TextBox FileContentsTextBox = LoginViewForFileContentsBox.FindControl("FileContents") as TextBox;
        FileContentsTextBox.Text = string.Format("Wybrałeś do usunięcia plik: {0}.", fullName);
        //FileContents.Text = string.Format("Wybrałeś do usunięcia plik: {0}.", fullName);

        //Aby program faktycznie usuwał pliki to należy odkomendować poniższą linijkę
        //File.Delete(fullName);
    }
}