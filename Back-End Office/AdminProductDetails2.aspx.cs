using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Back_End_Office_AdminProductDetails2 : System.Web.UI.Page
{
    // store product, collection and brand IDs as class members
    private string currentProductId, currentCollectionId, currentbrandId;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Get BrandID, CollectionID, ProductID from the query string 
        // and save their values
        currentbrandId = Request.QueryString["BrandID"];
        currentCollectionId = Request.QueryString["CollectionID"];
        currentProductId = Request.QueryString["ProductID"];

        // Fill the controls with data only on the initial page load
        if (!IsPostBack)
        {
            // Fill controls with data
            PopulateControls();
        }
    }

    // Populate the controls
    private void PopulateControls()
    {
        // Retrieve product details and collection details from database
        ProductDetails productDetails = CatalogAccess.GetProductDetails(currentProductId);
        CollectionDetails collectionDetails = CatalogAccess.GetCollectionDetails(currentCollectionId);
        // Set up labels and images
        productNameLabel.Text = productDetails.Product_Name;
        image1.ImageUrl = Link.ToProductImage(productDetails.Thumbnail);
        image2.ImageUrl = Link.ToProductImage(productDetails.Image);

        // Link to brand
        collLink.Text = collectionDetails.Name;
        collLink.NavigateUrl = "AdminCollections.aspx?BrandID=" + currentbrandId;

        // Clear form
        collectionLabel.Text = "";
        collectionListAssign.Items.Clear();
        collectionListMove.Items.Clear();
        collectionListRemove.Items.Clear();

        // Fill collectionLabel and collectionListRemove with data
        string collectionId, collectionName;
        DataTable productCollection = CatalogAccess.GetCollectionWithProduct(currentProductId);
        for (int i = 0; i < productCollection.Rows.Count; i++)
        {
            // obtain collection id and name
            collectionId = productCollection.Rows[i]["CollectionId"].ToString();
            collectionName = productCollection.Rows[i]["Name"].ToString();
            // add a link to the collection admin page
            collectionLabel.Text +=
              (collectionLabel.Text == "" ? "" : ", ") +
              "<a href='AdminProducts2.aspx?BrandID=" +
              CatalogAccess.GetCollectionDetails(currentCollectionId).BrandId +
              "&CollectionID=" + collectionId + "'>" +
              collectionName + "</a>";

            // populate the categoriesListRemove combo box
            collectionListRemove.Items.Add(new ListItem(collectionName, collectionId));

         }

        // Delete from catalog or remove from category?
        if (productCollection.Rows.Count > 1)
        {
            deleteButton.Visible = false;
            removeButton.Enabled = true;
        }
        else
        {
            deleteButton.Visible = true;
            removeButton.Enabled = false;
        }

        // Fill collectionListMove and collectionListAssign with data
        productCollection = CatalogAccess.GetCollectionWithoutProduct(currentProductId);
        for (int i = 0; i < productCollection.Rows.Count; i++)
        {
            // obtain collection id and name
            collectionId = productCollection.Rows[i]["CollectionId"].ToString();
            collectionName = productCollection.Rows[i]["Name"].ToString();
            // populate the list boxes
            collectionListAssign.Items.Add(new ListItem(collectionName, collectionId));
            collectionListMove.Items.Add(new ListItem(collectionName, collectionId));
        }
    }

    // Remove the product from a collection
    protected void removeButton_Click(object sender, EventArgs e)
    {
        // Check if a collection was selected
        if (collectionListRemove.SelectedIndex != -1)
        {
            // Get the collection ID that was selected in the DropDownList
            string collectionId = collectionListRemove.SelectedItem.Value;
            // Remove the product from the collection 
            bool success = CatalogAccess.RemoveProductFromCollection(currentProductId, collectionId);
            // Display status message
            statusLabel.Text = success ? "Product removed successfully" : "Product removal failed";
            // Refresh the page
            PopulateControls();
        }
        else
            statusLabel.Text = "You need to select a category";
    }

    // delete a product from the catalog
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        // Delete the product from the catalog
        CatalogAccess.DeleteProduct(currentProductId);
        // Need to go back to the categories page now
        Response.Redirect("AdminBrand.aspx");
    }

    // assign the product to a new collection
    protected void assignButton_Click(object sender, EventArgs e)
    {
        // Check if a collection was selected
        if (collectionListAssign.SelectedIndex != -1)
        {
            // Get the collection ID that was selected in the DropDownList
            string collectionId = collectionListAssign.SelectedItem.Value;
            // Assign the product to the collection
            bool success = CatalogAccess.AssignProductToCollection(currentProductId, collectionId);
            // Display status message
            statusLabel.Text = success ? "Product assigned successfully" : "Product assignation failed";
            // Refresh the page
            PopulateControls();
        }
        else
            statusLabel.Text = "You need to select a category";
    }


    // move the product to another collection
    protected void moveButton_Click(object sender, EventArgs e)
    {
        // Check if a collection was selected
        if (collectionListMove.SelectedIndex != -1)
        {
            // Get the collection ID that was selected in the DropDownList
            string newCollectionId = collectionListMove.SelectedItem.Value;
            // Move the product to the collection
            bool success = CatalogAccess.MoveProductToCollection(currentProductId, currentCollectionId, newCollectionId);
            // If the operation was successful, reload the page, 
            // so the new collection will reflect in the query string
            if (!success)
                statusLabel.Text = "Couldn't move the product to the specified collection";
            else
                Response.Redirect("AdminProductDetails2.aspx" +
                      "?BrandID=" + currentbrandId +
                      "&CollectionID=" + newCollectionId +
                      "&ProductID=" + currentProductId);
        }
        else
            statusLabel.Text = "You need to select a collection";
    }

    // upload product's first image
    protected void upload1Button_Click(object sender, EventArgs e)
    {
        // proceed with uploading only if the user selected a file
        if (image1FileUpload.HasFile)
        {
            try
            {
                string fileName = image1FileUpload.FileName;
                string location = Server.MapPath("~/ProductImages/") + fileName;
                // save image to server
                image1FileUpload.SaveAs(location);
                // update database with new product details
                ProductDetails pd = CatalogAccess.GetProductDetails(currentProductId);
                CatalogAccess.UpdateProduct(currentProductId, pd.Product_Name, pd.Product_Characteristics, pd.Price.ToString(), fileName, pd.Image, pd.PromoBrand.ToString(), pd.PromoFront.ToString());
                // reload the page 
                Response.Redirect("AdminProductDetails2.aspx" +
                        "?BrandID=" + currentbrandId +
                        "&CollectionID=" + currentCollectionId +
                        "&ProductID=" + currentProductId);
            }
            catch
            {
                statusLabel.Text = "Uploading image 1 failed";
            }
        }
    }

    // upload product's second image
    protected void upload2Button_Click(object sender, EventArgs e)
    {
        // proceed with uploading only if the user selected a file
        if (image2FileUpload.HasFile)
        {
            try
            {
                string fileName = image2FileUpload.FileName;
                string location = Server.MapPath("~/ProductImages/") + fileName;
                // save image to server
                image2FileUpload.SaveAs(location);
                // update database with new product details
                ProductDetails pd = CatalogAccess.GetProductDetails(currentProductId);
                CatalogAccess.UpdateProduct(currentProductId, pd.Product_Name, pd.Product_Characteristics, pd.Price.ToString(), pd.Thumbnail, fileName, pd.PromoBrand.ToString(), pd.PromoFront.ToString());
                // reload the page 
                Response.Redirect("AdminProductDetails2.aspx" +
                        "?BrandID=" + currentbrandId +
                        "&CollectionID=" + currentCollectionId +
                        "&ProductID=" + currentProductId);
            }
            catch
            {
                statusLabel.Text = "Uploading image 2 failed";
            }
        }
    }
}