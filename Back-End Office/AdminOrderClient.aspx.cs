using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminOrderClient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the categories grid
            BindGrid();
            // Get BrandID from the query string
            string orderId = Request.QueryString["OrderID"];
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get BrandID from the query string
        string orderId = Request.QueryString["OrderID"];
        // Get a DataTable object containing the categories
        grid.DataSource = OrdersAccess.GetClientInOrder(orderId);
        // Bind the data grid to the data source
        grid.DataBind();
    }


}