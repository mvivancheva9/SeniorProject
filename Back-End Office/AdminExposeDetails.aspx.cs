using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Back_End_Office_AdminExposeDetails : System.Web.UI.Page
{
    // store product, category and brand IDs as class members
    private string currentExposeId, currentnewId;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Get BrandID, CategoryID, ProductID from the query string 
        // and save their values
        currentnewId = Request.QueryString["NewID"];
        currentExposeId = Request.QueryString["ExposeID"];

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
        // Retrieve product details and category details from database
       ExposeDetails exposeDetails = CatalogAccess.GetExposeDetails(currentExposeId);
        // Set up labels and images
        exposeNameLabel.Text = exposeDetails.Name;
        image1.ImageUrl = Link.ToExposeImage(exposeDetails.Thumbnail);
        image2.ImageUrl = Link.ToExposeImage(exposeDetails.Image);
        // Link to brand
        newLink.Text = exposeDetails.Name;
        newLink.NavigateUrl = "AdminNews.aspx?NewID=" + currentnewId;

        
        // Clear form
        newLabel.Text = "";
        newListAssign.Items.Clear();
        newListMove.Items.Clear();
        newListRemove.Items.Clear();

        // Fill categoriesLabel and categoriesListRemove with data
        string newId, Name;
        DataTable exposeNew = CatalogAccess.GetNewWithExpose(currentExposeId);
        for (int i = 0; i < exposeNew.Rows.Count; i++)
        {
            // obtain category id and name
            newId = exposeNew.Rows[i]["NewId"].ToString();
            Name = exposeNew.Rows[i]["Name"].ToString();
            // add a link to the category admin page
            newLabel.Text +=
              (newLabel.Text == "" ? "" : ", ") +
              "<a href='AdminExpose.aspx?NewID=" + newId + "'>" +
              Name + "</a>";

            // populate the categoriesListRemove combo box
            newListRemove.Items.Add(new ListItem(Name, newId));
        }

        // Delete from catalog or remove from category?
        if (exposeNew.Rows.Count > 1)
        {
            deleteButton.Visible = false;
            removeButton.Enabled = true;
        }
        else
        {
            deleteButton.Visible = true;
            removeButton.Enabled = false;
        }

        // Fill categoriesListMove and categoriesListAssign with data
        exposeNew = CatalogAccess.GetNewWithoutExpose(currentExposeId);
        for (int i = 0; i < exposeNew.Rows.Count; i++)
        {
            // obtain category id and name
             newId = exposeNew.Rows[i]["NewId"].ToString();
            Name = exposeNew.Rows[i]["Name"].ToString();
            // populate the list boxes
            newListAssign.Items.Add(new ListItem(Name, newId));
            newListMove.Items.Add(new ListItem(Name, newId));
        }
    }


    // Remove the product from a category
    protected void removeButton_Click(object sender, EventArgs e)
    {
        // Check if a category was selected
        if (newListRemove.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string newId = newListRemove.SelectedItem.Value;
            // Remove the product from the category 
            bool success = CatalogAccess.RemoveExposeFromNew(currentExposeId, newId);
            // Display status message
            statusLabel.Text = success ? "Новината беше успешно премахната" : "Премахването на продукта беше неуспешно";
            // Refresh the page
            PopulateControls();
        }
        else
            statusLabel.Text = "Трябва да изберете Категория";
    }

    // delete a product from the catalog
    protected void deleteButton_Click(object sender, EventArgs e)
    {
        // Delete the product from the catalog
        CatalogAccess.DeleteExpose(currentExposeId);
        // Need to go back to the categories page now
        Response.Redirect("AdminNews.aspx");
    }

    // assign the product to a new category
    protected void assignButton_Click(object sender, EventArgs e)
    {
        // Check if a category was selected
        if (newListAssign.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string newId = newListAssign.SelectedItem.Value;
            // Assign the product to the category
            bool success = CatalogAccess.AssignExposeToNew(currentExposeId, newId);
            // Display status message
            statusLabel.Text = success ? "Продукта беше успешно добавен" : "Добавянето на продукта - неуспешно";
            // Refresh the page
            PopulateControls();
        }
        else
            statusLabel.Text = "Трябва да изберете категория";
    }


    // move the product to another category
    protected void moveButton_Click(object sender, EventArgs e)
    {
        // Check if a category was selected
        if (newListMove.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string newNewId = newListMove.SelectedItem.Value;
            // Move the product to the category
            bool success = CatalogAccess.MoveExposeToNew(currentExposeId, currentnewId, newNewId);
            // If the operation was successful, reload the page, 
            // so the new category will reflect in the query string
            if (!success)
                statusLabel.Text = "Не е възможно преместването на продукта в желаната категория";
            else
                Response.Redirect("AdminExposeDetails.aspx" +
                     "&NewID=" + newNewId +
                      "&ExposeID=" + currentExposeId);
        }
        else
            statusLabel.Text = "Трябва да изберете категория";
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
                string location = Server.MapPath("~/ExposeImages/") + fileName;
                // save image to server
                image1FileUpload.SaveAs(location);
                // update database with new product details
                ExposeDetails ed = CatalogAccess.GetExposeDetails(currentExposeId);
                CatalogAccess.UpdateExpose(currentExposeId, ed.Name, ed.Description, fileName, ed.Image, ed.PromoNew.ToString(), ed.PromoFrontNew.ToString());
                // reload the page 
                Response.Redirect("AdminExposeDetails.aspx" +
                        "?NewID=" + currentnewId +
                        "&ExposeID=" + currentExposeId);
            }
            catch
            {
                statusLabel.Text = "Kaчването на малката снимка - неуспешно";
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
                string location = Server.MapPath("~/ExposeImages/") + fileName;
                // save image to server
                image2FileUpload.SaveAs(location);
                // update database with new product details
                ExposeDetails ed = CatalogAccess.GetExposeDetails(currentExposeId);
                CatalogAccess.UpdateExpose(currentExposeId, ed.Name, ed.Description, ed.Thumbnail, fileName, ed.PromoNew.ToString(), ed.PromoFrontNew.ToString());
                // reload the page 
                Response.Redirect("AdminExposeDetails.aspx" +
                        "?NewID=" + currentnewId +
                        "&ExposeID=" + currentExposeId);
            }
            catch
            {
                statusLabel.Text = "Качването на голямата снимка - неуспешно";
            }
        }
    }
}