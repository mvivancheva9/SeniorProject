using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_NewsList2 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // don't reload data during postbacks
        if (!IsPostBack)
        {

            // CatalogAccess.GetLeisure returns a DataTable object containing
            // brand data, which is read in the ItemTemplate of the DataList
            list.DataSource = CatalogAccess.GetNew();
            // Needed to bind the data bound controls to the data source
            list.DataBind();
        }
    }
}