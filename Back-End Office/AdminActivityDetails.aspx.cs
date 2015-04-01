using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Back_End_Office_AdminActivityDetails : System.Web.UI.Page
{
    // store product, category and brand IDs as class members
    private string currentActivityId, currentLeisureId;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Get BrandID, CategoryID, ProductID from the query string 
        // and save their values
        currentLeisureId = Request.QueryString["LeisureID"];
        currentActivityId = Request.QueryString["ActivityID"];

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
        ActivityDetails activityDetails = CatalogAccess.GetActivityDetails(currentActivityId);
        // Set up labels and images
        activityNameLabel.Text = activityDetails.Name;
        image1.ImageUrl = Link.ToActivityImage(activityDetails.Thumbnail);
        image2.ImageUrl = Link.ToActivityImage(activityDetails.Image);
        // Link to brand
        leisureLink.Text = activityDetails.Name;
        leisureLink.NavigateUrl = "AdminLeisure.aspx?LeisureID=" + currentLeisureId;


        // Clear form
        leisureLabel.Text = "";
        leisureListAssign.Items.Clear();
        leisureListMove.Items.Clear();
        leisureListRemove.Items.Clear();

        // Fill categoriesLabel and categoriesListRemove with data
        string leisureId, Name;
        DataTable activityLeisure = CatalogAccess.GetLeisureWithActivity(currentActivityId);
        for (int i = 0; i < activityLeisure.Rows.Count; i++)
        {
            // obtain category id and name
            leisureId = activityLeisure.Rows[i]["LeisureId"].ToString();
            Name = activityLeisure.Rows[i]["Name"].ToString();
            // add a link to the category admin page
            leisureLabel.Text +=
              (leisureLabel.Text == "" ? "" : ", ") +
              "<a href='AdminActivity.aspx?LeisureID=" + leisureId + "'>" +
              Name + "</a>";

            // populate the categoriesListRemove combo box
            leisureListRemove.Items.Add(new ListItem(Name, leisureId));
        }

        // Delete from catalog or remove from category?
        if (activityLeisure.Rows.Count > 1)
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
        activityLeisure = CatalogAccess.GetLeisureWithoutActivity(currentActivityId);
        for (int i = 0; i < activityLeisure.Rows.Count; i++)
        {
            // obtain category id and name
            leisureId = activityLeisure.Rows[i]["LeisureId"].ToString();
            Name = activityLeisure.Rows[i]["Name"].ToString();
            // populate the list boxes
            leisureListAssign.Items.Add(new ListItem(Name, leisureId));
            leisureListMove.Items.Add(new ListItem(Name, leisureId));
        }
    }


    // Remove the product from a category
    protected void removeButton_Click(object sender, EventArgs e)
    {
        // Check if a category was selected
        if (leisureListRemove.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string leisureId = leisureListRemove.SelectedItem.Value;
            // Remove the product from the category 
            bool success = CatalogAccess.RemoveActivityFromLeisure(currentActivityId, leisureId);
            // Display status message
            statusLabel.Text = success ? "Koнтакта беше успешно премахната" : "Премахването на контакта беше неуспешно";
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
        CatalogAccess.DeleteActivity(currentActivityId);
        // Need to go back to the categories page now
        Response.Redirect("AdminLeisure.aspx");
    }

    // assign the product to a new category
    protected void assignButton_Click(object sender, EventArgs e)
    {
        // Check if a category was selected
        if (leisureListAssign.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string leisureId = leisureListAssign.SelectedItem.Value;
            // Assign the product to the category
            bool success = CatalogAccess.AssignActivityToLeisure(currentActivityId, leisureId);
            // Display status message
            statusLabel.Text = success ? "Kонтакта беше успешно добавен" : "Добавянето на контакта - неуспешно";
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
        if (leisureListMove.SelectedIndex != -1)
        {
            // Get the category ID that was selected in the DropDownList
            string newLeisureId = leisureListMove.SelectedItem.Value;
            // Move the product to the category
            bool success = CatalogAccess.MoveActivityToLeisure(currentActivityId, currentLeisureId, newLeisureId);
            // If the operation was successful, reload the page, 
            // so the new category will reflect in the query string
            if (!success)
                statusLabel.Text = "Не е възможно преместването на продукта в желаната категория";
            else
                Response.Redirect("AdminActivityDetails.aspx" +
                     "&LeisureID=" + newLeisureId +
                      "&ActivityID=" + currentActivityId);
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
                string location = Server.MapPath("~/ActivityImages/") + fileName;
                // save image to server
                image1FileUpload.SaveAs(location);
                // update database with new product details
                ActivityDetails ad = CatalogAccess.GetActivityDetails(currentActivityId);
                CatalogAccess.UpdateActivity(currentActivityId, ad.Name, ad.Description, fileName, ad.Image, ad.PromoFront.ToString(), ad.PromoLeisure.ToString());
                // reload the page 
                Response.Redirect("AdminActivityDetails.aspx" +
                        "?LeisureID=" + currentLeisureId +
                        "&ActivityID=" + currentActivityId);
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
                string location = Server.MapPath("~/ActivityImages/") + fileName;
                // save image to server
                image2FileUpload.SaveAs(location);
                // update database with new product details
                ActivityDetails ad = CatalogAccess.GetActivityDetails(currentActivityId);
                CatalogAccess.UpdateActivity(currentActivityId, ad.Name, ad.Description, ad.Thumbnail, fileName, ad.PromoFront.ToString(), ad.PromoLeisure.ToString());
                // reload the page 
                Response.Redirect("AdminActivityDetails.aspx" +
                        "?LeisureID=" + currentLeisureId +
                        "&ActivityID=" + currentActivityId);
            }
            catch
            {
                statusLabel.Text = "Качването на голямата снимка - неуспешно";
            }
        }
    }
}