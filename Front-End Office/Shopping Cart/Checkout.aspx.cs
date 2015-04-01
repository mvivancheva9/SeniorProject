using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Front_End_Office_Shopping_Cart_Checkout : System.Web.UI.Page
{
 protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
      PopulateControls();
  }

  // fill controls with data
 private void PopulateControls()
 {
     // get the items in the shopping cart
     DataTable dt = ShoppingCartAccess.GetItems();
     // populate the list with the shopping cart contents
     grid.DataSource = dt;
     grid.DataBind();
     grid.Visible = true;
     // display the total amount
     decimal amount = ShoppingCartAccess.GetTotalAmount();
     totalAmountLabel.Text = String.Format("{0:00 лв.}", amount);

 }
  protected void placeOrderButton_Click(object sender, 
    EventArgs e)
  {

    // Get the total amount
    decimal amount = ShoppingCartAccess.GetTotalAmount();
    // Create the order and store the order ID
    string orderId = ShoppingCartAccess.CreateOrder();
    string ordername = SPConfiguration.SiteName + 
      " Order " + orderId;
   
    Response.Redirect("~/Front-End Office/Shopping Cart/OrderPlaced.aspx");
  }
}


       