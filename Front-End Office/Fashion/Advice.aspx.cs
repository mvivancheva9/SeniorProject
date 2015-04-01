using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Fashion_Advice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    // Fill the control with data
    private void PopulateControls()
    {
        // Retrieve ProductID from the query string
        string adviceId = Request.QueryString["AdviceID"];
        // stores product details
        AdviceDetails zd;
        // Retrieve product details
        zd = CatalogAccess.GetAdviceDetails(adviceId);
        // Display product details
        titleLabel.Text = zd.Name;
        characteristicsLabel.Text = zd.Description;
        productImage.ImageUrl = "~/ProductImages/" + zd.Image;
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                   " : Activity : " + zd.Name;


    }
}