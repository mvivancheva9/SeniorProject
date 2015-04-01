using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Celebrities_Expose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    // Fill the control with data
    private void PopulateControls()
    {
        // Retrieve ExposeID from the query string
        string exposeId = Request.QueryString["ExposeID"];
        // stores product details
        ExposeDetails ed;
        // Retrieve product details
        ed = CatalogAccess.GetExposeDetails(exposeId);
        // Display product details
        titleLabel.Text = ed.Name;
        characteristicsLabel.Text = ed.Description;
        productImage.ImageUrl = "~/ExposeImages/" + ed.Image;
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                   " : Expose : " + ed.Name;


    }
}