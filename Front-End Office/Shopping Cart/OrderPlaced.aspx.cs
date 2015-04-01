using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_Office_Shopping_Cart_OrderPlaced : System.Web.UI.Page
{
    protected override void OnInit(EventArgs e)
    {
        //(Master as SP).EnforceSSL = true;
        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                    " : Order Placed";
    }
    // list the most recent orders
    protected void byRecentGo_Click(object sender, EventArgs e)
    {
        // how many orders to list?
        int recordCount;

        // load the new data into the grid
        if (int.TryParse(recentCountTextBox.Text, out recordCount))
            grid.DataSource = OrdersAccess.GetByRecent(recordCount);
        // refresh the data grid
        grid.DataBind();
    }
}
