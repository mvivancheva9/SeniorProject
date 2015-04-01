using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Leisure_Time_Leisure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    // Fill the control with data
    private void PopulateControls()
    {
        // Retrieve ProductID from the query string
        string activityId = Request.QueryString["ActivityID"];
        // stores product details
        ActivityDetails ad;
        // Retrieve product details
        ad = CatalogAccess.GetActivityDetails(activityId);
        // Display product details
        titleLabel.Text = ad.Name;
        characteristicsLabel.Text = ad.Description;
        productImage.ImageUrl = "~/ProductImages/" + ad.Image;
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                   " : Activity : " + ad.Name;

        
    }
}