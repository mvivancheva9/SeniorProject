using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Shopping_Cart_CustomerInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // Populate the GridView with data
    private void BindGrid()
    {
        // Get CategoryID from the query string
        string orderId = Request.QueryString["OrderID"];
        // Get a DataTable object containing the products
        grid.DataSource = OrdersAccess.GetClientInOrder(orderId);
        // Needed to bind the data bound controls to the data source
        grid.DataBind();
    }
    // Create a new product
    protected void createProduct_Click(object sender, EventArgs e)
    {
        // Get CategoryID from the query string
        string orderId = Request.QueryString["OrderID"];
        // Execute the insert command
        bool success = OrdersAccess.CreateClient(orderId, newName.Text, newAddress.Text, newPhone.Text, newEmail.Text);
        
        BindGrid();
        Response.Redirect("Default.aspx");
    }
}