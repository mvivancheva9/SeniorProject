using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminAdvice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the advices grid
            BindGrid();
            // Get FashionID from the query string
            string fashionId = Request.QueryString["FashionID"];
            // Obtain the leisure's name
            FashionDetails fd = CatalogAccess.GetFashionDetails(fashionId);
            string Name = fd.Name + "</b>";
            // Link to fashion
            fashionLink.Text = Name;
            fashionLink.NavigateUrl = "AdminFashion.aspx";
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get FashionID from the query string
        string fashionId = Request.QueryString["FashionID"];
        // Get a DataTable object containing the fashion
        grid.DataSource = CatalogAccess.GetAllAdviceInFashion(fashionId);
        // Bind the data grid to the data source
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

    // Update row
    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Retrieve updated data
        string id = grid.DataKeys[e.RowIndex].Value.ToString();
        string name = ((TextBox)grid.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
        string description = ((TextBox)grid.Rows[e.RowIndex].FindControl("descriptionTextBox")).Text;
        string thumbnail = ((TextBox)grid.Rows[e.RowIndex].FindControl("thumbTextBox")).Text;
        string image = ((TextBox)grid.Rows[e.RowIndex].FindControl("imageTextBox")).Text;
        string promoFashion = ((CheckBox)grid.Rows[e.RowIndex].Cells[4].Controls[0]).Checked.ToString();
        string promoFront = ((CheckBox)grid.Rows[e.RowIndex].Cells[5].Controls[0]).Checked.ToString();
        // Execute the update command
        bool success = CatalogAccess.UpdateAdvice(id, name, description, thumbnail, image, promoFashion, promoFront);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Update successful" : "Update failed";
        // Reload the grid
        BindGrid();
    }

    // Delete a record
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Get the ID of the record to be deleted
        string id = grid.DataKeys[e.RowIndex].Value.ToString();
        // Execute the delete command
        bool success = CatalogAccess.DeleteAdvice(id);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Delete successful" : "Delete failed";
        // Reload the grid
        BindGrid();
    }

    // Create a new expose
    protected void createAdvice_Click(object sender, EventArgs e)
    {
        // Get FashionID from the query string
        string fashionId = Request.QueryString["FashionID"];
        // Execute the insert command
        bool success = CatalogAccess.CreateAdvice(fashionId, newName.Text, newDescription.Text, newThumbnail.Text, newImage.Text, newPromoFashion.Checked.ToString(), newPromoFront.Checked.ToString());
        // Display results
        statusLabel.Text = success ? "Insert successful" : "Insert failed";
        // Reload the grid
        BindGrid();
    }
}