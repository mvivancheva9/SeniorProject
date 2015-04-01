using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Collections_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // don't reload data during postbacks
        if (!IsPostBack)
        {

            PopulateControls();
        }
    }

    // Fill the page with data
    private void PopulateControls()
    {
        // Retrieve BrandID from the query string
        string brandId = Request.QueryString["BrandID"];
        // Retrieve CategoryID from the query string
        string collectionId = Request.QueryString["CollectionID"];
        // If browsing a category...
        if (collectionId != null)
        {
            // Retrieve category and department details and display them
            CollectionDetails cd = CatalogAccess.GetCollectionDetails(collectionId);
            BrandDetails bd = CatalogAccess.GetBrandDetails(brandId);
            catalogDescriptionLabel.Text = HttpUtility.HtmlEncode(cd.Description);
            // Set the title of the page
            this.Title = HttpUtility.HtmlEncode(SPConfiguration.SiteName +
                         ": " + bd.Brand_Name + ": " + cd.Name);
        }
        // If browsing a department...
        else if (brandId != null)
        {
            // Retrieve department details and display them
            BrandDetails bd = CatalogAccess.GetBrandDetails(brandId);
            catalogDescriptionLabel.Text = HttpUtility.HtmlEncode(bd.Description);
            // Set the title of the page
            this.Title = HttpUtility.HtmlEncode(SPConfiguration.SiteName + ": " + bd.Brand_Name);
        }
    }
}
