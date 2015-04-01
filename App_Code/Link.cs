using System;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// Link factory class
/// </summary>
public class Link
{
    // Builds an absolute URL
    private static string BuildAbsolute(string relativeUri)
    {
        // get current uri
        Uri uri = HttpContext.Current.Request.Url;
        // build absolute path
        string app = HttpContext.Current.Request.ApplicationPath;
        if (!app.EndsWith("/")) app += "/";
        relativeUri = relativeUri.TrimStart('/');
        // return the absolute path
        return HttpUtility.UrlPathEncode(
          String.Format("http://{0}:{1}{2}{3}",
          uri.Host, uri.Port, app, relativeUri));
    }

    // Generate a brand URL
    public static string ToBrand(string brandId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Shopping Cart/Default.aspx?BrandID={0}", brandId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Shopping Cart/Default.aspx?BrandID={0}&Page={1}", brandId, page));
    }

    // Generate a brand URL for the first page
    public static string ToBrand(string brandId)
    {
        return ToBrand(brandId, "1");
    }
    public static string ToBrandImage(string fileName)
    {
        // build product URL
        return BuildAbsolute("/ProductImages/" + fileName);
    }
    public static string ToCategory(string brandId, string categoryId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Shopping Cart/Default.aspx?BrandID={0}&CategoryID={1}", brandId, categoryId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Shopping Cart/Default.aspx?BrandID={0}&CategoryID={1}&Page={2}", brandId, categoryId, page));
    }

    public static string ToCategory(string brandId, string categoryId)
    {
        return ToCategory(brandId, categoryId, "1");
    }

    public static string ToProduct(string productId)
    {
        return BuildAbsolute(String.Format("/Front-End Office/Shopping Cart/Product.aspx?ProductID={0}", productId));
    }
    public static string ToProductImage(string fileName)
    {
        // build product URL
        return BuildAbsolute("/ProductImages/" + fileName);
    }
    public static string ToCollection(string brandId, string collectionId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Collections/Default.aspx?BrandID={0}&CollectionID={1}", brandId, collectionId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Collections/Default.aspx?BrandID={0}&CollectionID={1}&Page={2}", brandId, collectionId, page));
    }

    public static string ToCollection(string brandId, string collectionId)
    {
        return ToCollection(brandId, collectionId, "1");
    }
    // Generate a brand URL
    public static string ToBrand2(string brandId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Collections/Default.aspx?BrandID={0}", brandId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Collections/Default.aspx?BrandID={0}&Page={1}", brandId, page));
    }

    // Generate a brand URL for the first page
    public static string ToBrand2(string brandId)
    {
        return ToBrand2(brandId, "1");
    }
    public static string ToProduct2(string productId)
    {
        return BuildAbsolute(String.Format("/Front-End Office/Collections/Product.aspx?ProductID={0}", productId));
    }
    public static string ToLeisure(string leisureId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Leisure Time/Default.aspx?LeisureID={0}", leisureId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Leisure Time/Default.aspx?LeisureID={0}&Page={1}", leisureId, page));
    }

    // Generate a brand URL for the first page
    public static string ToLeisure(string leisureId)
    {
        return ToLeisure(leisureId, "1");
    }
    public static string ToActivity(string activityId)
    {
        return BuildAbsolute(String.Format("/Front-End Office/Leisure Time/Activity.aspx?ActivityID={0}", activityId));
    }
    public static string ToActivityImage(string fileName)
    {
        // build advice URL
        return BuildAbsolute("/ActivityImages/" + fileName);
    }
    public static string ToFashion(string fashionId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Fashion/Default.aspx?FashionID={0}", fashionId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Fashion/Default.aspx?FashionID={0}&Page={1}", fashionId, page));
    }

    // Generate a fashion URL for the first page
    public static string ToFashion(string fashionId)
    {
        return ToFashion(fashionId, "1");
    }
    public static string ToAdvice(string adviceId)
    {
        return BuildAbsolute(String.Format("/Front-End Office/Fashion/Advice.aspx?AdviceID={0}", adviceId));
    }
    public static string ToAdviceImage(string fileName)
    {
        // build advice URL
        return BuildAbsolute("/ProductImages/" + fileName);
    }

    public static string ToNew(string newId, string page)
    {
        if (page == "1")
            return BuildAbsolute(String.Format("/Front-End Office/Celebrities/Default.aspx?NewID={0}", newId));
        else
            return BuildAbsolute(String.Format("/Front-End Office/Celebrities/Default.aspx?NewID={0}&Page={1}", newId, page));
    }
    // Generate a new URL for the first page
    public static string ToNew(string newId)
    {
        return ToNew(newId, "1");
    }
    public static string ToExpose(string exposeId)
    {
        return BuildAbsolute(String.Format("/Front-End Office/Celebrities/Expose.aspx?exposeID={0}", exposeId));
    }
    public static string ToExposeImage(string fileName)
    {
        // build advice URL
        return BuildAbsolute("/ExposeImages/" + fileName);
    }
}

