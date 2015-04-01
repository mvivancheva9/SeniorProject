using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Back_End_Office_AdminActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Load the grid only the first time the page is loaded
        if (!Page.IsPostBack)
        {
            // Load the activities grid
            BindGrid();
            // Get LeisureID from the query string
            string leisureId = Request.QueryString["LeisureID"];
            // Obtain the leisure's name
            LeisureDetails ld = CatalogAccess.GetLeisureDetails(leisureId);
            string Name = ld.Name + "</b>";
            // Link to leisure
            leisureLink.Text = Name;
            leisureLink.NavigateUrl = "AdminLeisure.aspx";
        }
    }

    // Populate the GridView with data
    private void BindGrid()
    {
        // Get LeisureID from the query string
        string leisureId = Request.QueryString["LeisureID"];
        // Get a DataTable object containing the leisures
        grid.DataSource = CatalogAccess.GetAllActivityInLeisure(leisureId);
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
        string promoLeisure = ((CheckBox)grid.Rows[e.RowIndex].Cells[4].Controls[0]).Checked.ToString();
        string promoFront = ((CheckBox)grid.Rows[e.RowIndex].Cells[5].Controls[0]).Checked.ToString();
        // Execute the update command
        bool success = CatalogAccess.UpdateActivity(id, name, description, thumbnail, image, promoLeisure, promoFront);
        // Cancel edit mode
        grid.EditIndex = -1;
        // Display status message
        statusLabel.Text = success ? "Update successful" : "Update failed";
        // Reload the grid
        BindGrid();
    }

   }