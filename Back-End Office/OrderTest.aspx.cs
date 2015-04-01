using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_OrderTest : System.Web.UI.Page
{
    protected void goButton_Click(object sender, EventArgs e)
    {
        try
        {
            CommerceLibOrderInfo orderInfo = CommerceLibAccess.GetOrder(
              orderIDBox.Text);          
            resultLabel.Text = "Order found.";
          addressLabel.Text = orderInfo.CustomerAddressAsString.Replace(
           "\n", "<br />");
         orderLabel.Text = orderInfo.OrderAsString.Replace("\n", "<br />");
        }
        catch
        {
            resultLabel.Text = "No order found, or order is in old format.";
            addressLabel.Text = "";
            orderLabel.Text = "";
        }
    }
}
