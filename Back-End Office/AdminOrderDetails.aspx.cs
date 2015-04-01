using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminOrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // check if we must display order details       
        if (!Page.IsPostBack && Request.QueryString["OrderID"] != null)
        {
            string orderId = Request.QueryString["OrderID"];
            // fill constituent controls with data
            PopulateControls(orderId);
           
        }
        
    }

   
    // populate the form with data
    private void PopulateControls(string orderId)
    {
        // obtain order info
        OrderInfo orderInfo = OrdersAccess.GetInfo(orderId);
        // populate labels and text boxes with order info
        orderIdLabel.Text = "Поръчка Номер:" + orderId;
        

        // fill the data grid with order details
        grid.DataSource = OrdersAccess.GetDetails(orderId);
        grid.DataBind();
    }

    

}
