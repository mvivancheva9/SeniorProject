using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_Activity : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    private void PopulateControls()
    {
        // Retrieve LeisureID from the query string
        string leisureId = Request.QueryString["LeisureID"];
        // Retrieve Page from the query string
        string page = Request.QueryString["Page"];
        if (page == null) page = "1";
        // How many pages of products?
        int howManyPages = 1;
        // pager links format
        string firstPageUrl = "";
        string pagerFormat = "";

        // If browsing a category...
        if (leisureId != null)
        {
            // Retrieve list of activities in a leisure
            list.DataSource =
            CatalogAccess.GetActivityInLeisure(leisureId, page, out howManyPages);
            list.DataBind();
            // get first page url and pager format
            firstPageUrl = Link.ToLeisure(leisureId, "1");
            pagerFormat = Link.ToLeisure(leisureId, "{0}");
        }
        
        else
        {
            // Retrieve list of products on catalog promotion
            list.DataSource =
            CatalogAccess.GetActivityOnFrontPromo(page, out howManyPages);
            list.DataBind();
            // have the current page as integer
            int currentPage = Int32.Parse(page);

        }

        // Display pager controls
        topPager.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, false);
    }


    // Executed when each item of the list is bound to the data source
    protected void list_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        // obtain the attributes of the product
        DataRowView dataRow = (DataRowView)e.Item.DataItem;
        string activityId = dataRow["ActivityID"].ToString();
            }

}