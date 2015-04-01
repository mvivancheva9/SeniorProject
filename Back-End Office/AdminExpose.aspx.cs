using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Back_End_Office_AdminExpose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the categories grid
            BindGrid();
            // Get NewID from the query string
            string newId = Request.QueryString["NewID"];
            // Obtain the brand's name
            NewDetails nd = CatalogAccess.GetNewDetails(newId);
            string Name = nd.Name + "</b>";
            // Link to news
            newLink.Text = Name;
            newLink.NavigateUrl = "AdminNews.aspx";
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get NewID from the query string
        string newId = Request.QueryString["NewID"];
        // Get a DataTable object containing the categories
        grid.DataSource = CatalogAccess.GetAllExposeInNew(newId);
        // Bind the data grid to the data source
        grid.DataBind();
    }

    // Enter row into edit mode
    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the row for which to enable edit mode
        grid.EditIndex = e.NewEditIndex;
        // Set status message 
        statusLabel.Text = "Обновябане на редица # " + e.NewEditIndex.ToString();
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
        statusLabel.Text = "Промяна прекъсната";
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
        string promoNew = ((CheckBox)grid.Rows[e.RowIndex].Cells[4].Controls[0]).Checked.ToString();
        string promoFrontNew = ((CheckBox)grid.Rows[e.RowIndex].Cells[5].Controls[0]).Checked.ToString();
        // Execute the update command
        bool success = CatalogAccess.UpdateExpose(id, name, description, thumbnail, image, promoNew, promoFrontNew);
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
        bool success = CatalogAccess.DeleteExpose(id);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Изтриване Успешно" : "Изтриване Неуспешно";
        // Reload the grid
        BindGrid();
    }

    // Create a new expose
    protected void createExpose_Click(object sender, EventArgs e)
    {
        // Get NewID from the query string
        string newId = Request.QueryString["NewID"];
        // Execute the insert command
        bool success = CatalogAccess.CreateExpose(newId, newName.Text, newDescription.Text, newThumbnail.Text, newImage.Text, newPromoNew.Checked.ToString(), newPromoFrontNew.Checked.ToString());
        // Display results
        statusLabel.Text = success ? "Вмъкване Успешно" : "Вмъкване Неуспешно";
        // Reload the grid
        BindGrid();
    }
}