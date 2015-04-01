using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Get CategoryID and BrandID from the query string
            string categoryId = Request.QueryString["CategoryID"];
            string brandId = Request.QueryString["BrandID"];
            // Obtain the category name
            CategoryDetails cd = CatalogAccess.GetCategoryDetails(categoryId);
            string categoryName = cd.Category_Name;
            // Link to brand
            catLink.Text = categoryName;
            catLink.NavigateUrl = "AdminCategories.aspx?BrandID=" + brandId;
            // Load the products grid
            BindGrid();
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get CategoryID from the query string
        string categoryId = Request.QueryString["CategoryID"];
        // Get a DataTable object containing the products
        grid.DataSource = CatalogAccess.GetAllProductsInCategory(categoryId);
        // Needed to bind the data bound controls to the data source
        grid.DataBind();
    }

    // Enter row into edit mode
    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the row for which to enable edit mode
        grid.EditIndex = e.NewEditIndex;
        // Set status message 
        statusLabel.Text = "Editing row # " + e.NewEditIndex.ToString();
        // Reload the grid
        BindGrid();
    }

    // Cancel edit mode
    protected void grid_RowCancelingEdit(object sender,
    GridViewCancelEditEventArgs e)
    {
        // Cancel edit mode
        grid.EditIndex = -1;
        // Set status message
        statusLabel.Text = "Editing canceled";
        // Reload the grid
        BindGrid();
    }

    // Update a product
    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Retrieve updated data
        try
        {
            string id = grid.DataKeys[e.RowIndex].Value.ToString();
            string name = ((TextBox)grid.Rows[e.RowIndex].FindControl("nameTextBox")).Text;
            string description = ((TextBox)grid.Rows[e.RowIndex].FindControl("descriptionTextBox")).Text;
            string price = ((TextBox)grid.Rows[e.RowIndex].FindControl("priceTextBox")).Text;
            string thumbnail = ((TextBox)grid.Rows[e.RowIndex].FindControl("thumbTextBox")).Text;
            string image = ((TextBox)grid.Rows[e.RowIndex].FindControl("imageTextBox")).Text;
            string promoBrand = ((CheckBox)grid.Rows[e.RowIndex].Cells[6].Controls[0]).Checked.ToString();
            string promoFront = ((CheckBox)grid.Rows[e.RowIndex].Cells[7].Controls[0]).Checked.ToString();
            // Execute the update command
            bool success = CatalogAccess.UpdateProduct(id, name, description, price, thumbnail, image, promoBrand, promoFront);
            // Cancel edit mode
            grid.EditIndex = -1;
            // Display status message
            statusLabel.Text = success ? "Product update successful" : "Product update failed";
        }
        catch
        {
            // Display error
            statusLabel.Text = "Product update failed";
        }
        // Reload grid
        BindGrid();
    }

    // Create a new product
    protected void createProduct_Click(object sender, EventArgs e)
    {
        // Get CategoryID from the query string
        string categoryId = Request.QueryString["CategoryID"];
        // Execute the insert command
        bool success = CatalogAccess.CreateProduct(categoryId, newName.Text, newDescription.Text, newPrice.Text, newThumbnail.Text, newImage.Text, newPromoBrand.Checked.ToString(), newPromoFront.Checked.ToString());
        // Display status message
        statusLabel.Text = success ? "Insert successful" : "Insert failed";
        // Reload the grid
        BindGrid();
    }

}