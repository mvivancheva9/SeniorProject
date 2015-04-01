using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_ProductList2 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    private void PopulateControls()
    {
        // Retrieve BrandID from the query string
        string brandId = Request.QueryString["BrandID"];
        // Retrieve CategoryID from the query string
        string collectionId = Request.QueryString["CollectionID"];
        // Retrieve Page from the query string
        string page = Request.QueryString["Page"];
        if (page == null) page = "1";
        // How many pages of products?
        int howManyPages = 1;
        // pager links format
        string firstPageUrl = "";
        string pagerFormat = "";

        // If browsing a category...
        if (collectionId != null)
        {
            // Retrieve list of products in a category
            list.DataSource =
            CatalogAccess.GetProductsInCollection(collectionId, page, out howManyPages);
            list.DataBind();
            // get first page url and pager format
            firstPageUrl = Link.ToCollection(brandId, collectionId, "1");
            pagerFormat = Link.ToCollection(brandId, collectionId, "{0}");
        }
        else if (brandId != null)
        {
            // Retrieve list of products on department promotion
            list.DataSource = CatalogAccess.GetProductsOnBrandPromo
            (brandId, page, out howManyPages);
            list.DataBind();
            // get first page url and pager format
            firstPageUrl = Link.ToBrand2(brandId, "1");
            pagerFormat = Link.ToBrand2(brandId, "{0}");
        }
        else
        {
            // Retrieve list of products on catalog promotion
            list.DataSource =
            CatalogAccess.GetProductsOnFrontPromo(page, out howManyPages);
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
        string productId = dataRow["ProductID"].ToString();
        
        }
    }
