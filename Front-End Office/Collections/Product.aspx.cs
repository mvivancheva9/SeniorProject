using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Front_End_Office_Collections_Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControls();
    }

    // Fill the control with data
    private void PopulateControls()
    {
        // Retrieve ProductID from the query string
        string productId = Request.QueryString["ProductID"];
        // stores product details
        ProductDetails pd;
        // Retrieve product details
        pd = CatalogAccess.GetProductDetails(productId);
        // Display product details
        titleLabel.Text = pd.Product_Name;
        characteristicsLabel.Text = pd.Product_Characteristics;
        productImage.ImageUrl = "~/ProductImages/" + pd.Image;
        // Set the title of the page
        this.Title = SPConfiguration.SiteName +
                   " : Product : " + pd.Product_Name;

        // obtain the attributes of the product
        DataTable attrTable = CatalogAccess.GetProductAttributes(productId);

        // temp variables
        string prevAttributeName = "";
        string attribute_Name, Value, attributeValueId;

        // current DropDown for attribute values
        Label attribute_NameLabel;
        DropDownList ValuesDropDown = new DropDownList();

        // read the list of attributes
        foreach (DataRow r in attrTable.Rows)
        {
            // get attribute data
            attribute_Name = r["Attribute_Name"].ToString();
            Value = r["Value"].ToString();
            attributeValueId = r["AttributeValueID"].ToString();

            // if starting a new attribute (e.g. Color, Size)
            if (attribute_Name != prevAttributeName)
            {
                prevAttributeName = attribute_Name;
                attribute_NameLabel = new Label();
                attribute_NameLabel.Text = attribute_Name + ": ";
                ValuesDropDown = new DropDownList();
                attrPlaceHolder.Controls.Add(attribute_NameLabel);
                attrPlaceHolder.Controls.Add(ValuesDropDown);
            }

            // add a new attribute value to the DropDownList
            ValuesDropDown.Items.Add(new ListItem(Value, attributeValueId));
        }
    }
}