using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminBrand2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the brand grid
            BindGrid();
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get a DataTable object containing the catalog brands
        grid.DataSource = CatalogAccess.GetBrand();
        // Bind the data bound controls to the data source
        grid.DataBind();
    }
}