using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the categories grid
            BindGrid();
            // Get BrandID from the query string
            string brandId = Request.QueryString["BrandID"];
            // Obtain the brand's name
            BrandDetails bd = CatalogAccess.GetBrandDetails(brandId);
            string brand_Name = bd.Brand_Name + "</b>";
            // Link to brand
            brandLink.Text = brand_Name;
            brandLink.NavigateUrl = "AdminBrand.aspx";
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get BrandID from the query string
        string brandId = Request.QueryString["BrandID"];
        // Get a DataTable object containing the categories
        grid.DataSource = CatalogAccess.GetCategoryInBrand(brandId);
        // Bind the data grid to the data source
        grid.DataBind();
    }

    // Enter row into edit mode
    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the row for which to enable edit mode
        grid.EditIndex = e.NewEditIndex;
        // Set status message 
        statusLabel.Text = "Промяна на редица # " + e.NewEditIndex.ToString();
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
        statusLabel.Text = "Промяна Прекъсната";
        // Reload the grid
        BindGrid();
    }

    // Update row
    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Retrieve updated data
        string id = grid.DataKeys[e.RowIndex].Value.ToString();
        string name = ((TextBox)grid.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
        string description = ((TextBox)grid.Rows[e.RowIndex].FindControl("descriptionTextBox")).Text;
        // Execute the update command
        bool success = CatalogAccess.UpdateCategory(id, name, description);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Обновяване Успешно" : "Обновяване Неуспешно";
        // Reload the grid
        BindGrid();
    }

    // Delete a record
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Get the ID of the record to be deleted
        string id = grid.DataKeys[e.RowIndex].Value.ToString();
        // Execute the delete command
        bool success = CatalogAccess.DeleteCategory(id);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Изтриване Успешно" : "Изтриване Неуспешно";
        // Reload the grid
        BindGrid();
    }

    // Create a new category
    protected void createCategory_Click(object sender, EventArgs e)
    {
        // Get BrandID from the query string
        string brandId = Request.QueryString["BrandID"];
        // Execute the insert command
        bool success = CatalogAccess.CreateCategory(brandId, newName.Text, newDescription.Text);
        // Display results
        statusLabel.Text = success ? "Вмъкване Успешно" : "Вмъкване Неуспешно";
        // Reload the grid
        BindGrid();
    }
}
