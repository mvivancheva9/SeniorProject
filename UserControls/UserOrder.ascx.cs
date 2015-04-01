using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_UserOrder : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // don't reload data during postbacks
        if (!IsPostBack)
        {

            // Obtain the ID of the selected brand
            string orderId = Request.QueryString["OrderID"];
            // Continue only if BrandID exists in the query string
            if (orderId != null)
            {
                // Catalog.GetCategoriesInBrand returns a DataTable
                // object containing category data, which is displayed by the DataList
                list.DataSource =
                  CatalogAccess.GetCategoryInBrand(orderId);
                // Needed to bind the data bound controls to the data source
                list.DataBind();
            }
        }

    }
}