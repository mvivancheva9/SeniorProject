using System.Configuration;

public static class SPConfiguration
{
    // Caches the connection string
    private static string dbConnectionString;
    // Caches the data provider name 
    private static string dbProviderName;
    //Store the number of products per page
    private readonly static int productsPerPage;
    //Store the product description lenght
    private readonly static int productDescriptionLength;
    //Store the name of the shop
    private readonly static string siteName;
    //Store the number of activity per page
    private readonly static int activityPerPage;
    //Store the activity description lenght
    private readonly static int activityDescriptionLength;
    //Store the number of advice per page
    private readonly static int advicePerPage;
    //Store the advice description lenght
    private readonly static int adviceDescriptionLength;
    //Store the number of exposes per page
    private readonly static int exposePerPage;
    //Store the expose description lenght
    private readonly static int exposeDescriptionLength;

    static SPConfiguration()
    {
        dbConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        dbProviderName = ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
        productsPerPage = System.Int32.Parse(ConfigurationManager.AppSettings["ProductsPerPage"]);
        productDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["ProductDescriptionLength"]);
        siteName = ConfigurationManager.AppSettings["SiteName"];
        activityPerPage = System.Int32.Parse(ConfigurationManager.AppSettings["ActivityPerPage"]);
        activityDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["ActivityDescriptionLength"]);
        advicePerPage = System.Int32.Parse(ConfigurationManager.AppSettings["AdvicePerPage"]);
        adviceDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["AdviceDescriptionLength"]);
        exposePerPage = System.Int32.Parse(ConfigurationManager.AppSettings["ExposePerPage"]);
        exposeDescriptionLength = System.Int32.Parse(ConfigurationManager.AppSettings["ExposeDescriptionLength"]);
        
    }

    // Returns the connection string for the BalloonShop database
    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }

    // Returns the data provider name
    public static string DbProviderName
    {
        get
        {
            return dbProviderName;
        }
    }


    // Returns the address of the mail server
    public static string MailServer
    {
        get
        {
            return ConfigurationManager.AppSettings["MailServer"];
        }
    }

    // Returns the email username
    public static string MailUsername
    {
        get
        {
            return ConfigurationManager.AppSettings["MailUsername"];
        }
    }

    // Returns the email password
    public static string MailPassword
    {
        get
        {
            return ConfigurationManager.AppSettings["MailPassword"];
        }
    }

    // Returns the email password
    public static string MailFrom
    {
        get
        {
            return ConfigurationManager.AppSettings["MailFrom"];
        }
    }

    // Send error log emails?
    public static bool EnableErrorLogEmail
    {
        get
        {
            return bool.Parse(ConfigurationManager.AppSettings
            ["EnableErrorLogEmail"]);
        }
    }

    // Returns the email address where to send error reports
    public static string ErrorLogEmail
    {
        get
        {
            return ConfigurationManager.AppSettings["ErrorLogEmail"];
        }
    }
    // Returns the maximum number of products to be displayed on a page
    public static int ProductsPerPage
    {
        get
        {
            return productsPerPage;
        }
    }

    // Returns the length of product descriptions in products lists
    public static int ProductDescriptionLength
    {
        get
        {
            return productDescriptionLength;
        }
    }

    // Returns the length of product descriptions in products lists
    public static string SiteName
    {
        get
        {
            return siteName;
        }
    }

    // Returns the maximum number of activity to be displayed on a page
    public static int ActivityPerPage
    {
        get
        {
            return activityPerPage;
        }
    }

    // Returns the length of activity descriptions in products lists
    public static int ActivityDescriptionLength
    {
        get
        {
            return activityDescriptionLength;
        }
    }

    // Returns the maximum number of advices to be displayed on a page
    public static int AdvicePerPage
    {
        get
        {
            return advicePerPage;
        }
    }

    // Returns the length of advice descriptions in fashion lists
    public static int AdviceDescriptionLength
    {
        get
        {
            return adviceDescriptionLength;
        }
    }

    // Returns the maximum number of exposes to be displayed on a page
    public static int ExposePerPage
    {
        get
        {
            return exposePerPage;
        }
    }

    // Returns the length of expose descriptions in fashion lists
    public static int ExposeDescriptionLength
    {
        get
        {
            return exposeDescriptionLength;
        }
    }

    // Returns the number of days for shopping cart expiration
    public static int CartPersistDays
    {
        get
        {
            return 10;
        }
    }

}
