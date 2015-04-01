using System;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Front_End_Office_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                    " : Register";
    }

    protected void CreateUserWizard1_CreatedUser(object sender,
    EventArgs e)
    {
        Roles.AddUserToRole((sender as CreateUserWizard).UserName,
        "Customers");
    }
}
