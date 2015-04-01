using System;
using System.Web;
using System.Web.Security;
using SecurityLib;


/// <summary>
/// A wrapper around profile information, including
/// credit card encryption functionality.
/// </summary>
public class ProfileWrapper
{
    private string address1;
    private string address2;
    private string city;
    private string region;
    private string postalCode;
    private string country;
    private string shippingRegion;
    private string mobPhone;
    private string email;
   
    public string Address1
    {
        get
        {
            return address1;
        }
        set
        {
            address1 = value;
        }
    }
    public string Address2
    {
        get
        {
            return address2;
        }
        set
        {
            address2 = value;
        }
    }
    public string City
    {
        get
        {
            return city;
        }
        set
        {
            city = value;
        }
    }
    public string Region
    {
        get
        {
            return region;
        }
        set
        {
            region = value;
        }
    }
    public string PostalCode
    {
        get
        {
            return postalCode;
        }
        set
        {
            postalCode = value;
        }
    }
    public string Country
    {
        get
        {
            return country;
        }
        set
        {
            country = value;
        }
    }
    public string ShippingRegion
    {
        get
        {
            return shippingRegion;
        }
        set
        {
            shippingRegion = value;
        }
    }
    public string MobPhone
    {
        get
        {
            return mobPhone;
        }
        set
        {
            mobPhone = value;
        }
    }
    public string Email
    {
        get
        {
            return email;
        }
        set
        {
            email = value;
        }
    }
    
    public ProfileWrapper()
    {
        ProfileCommon profile =
        HttpContext.Current.Profile as ProfileCommon;
        address1 = profile.Address1;
        address2 = profile.Address2;
        city = profile.City;
        region = profile.Region;
        postalCode = profile.PostalCode;
        country = profile.Country;
        shippingRegion =
          (profile.ShippingRegion == null
          || profile.ShippingRegion == ""
          ? "1" : profile.ShippingRegion);
        mobPhone = profile.MobPhone;
        email = Membership.GetUser(profile.UserName).Email;

        }

    public void UpdateProfile()
    {
        ProfileCommon profile =
         HttpContext.Current.Profile as ProfileCommon;
        profile.Address1 = address1;
        profile.Address2 = address2;
        profile.City = city;
        profile.Region = region;
        profile.PostalCode = postalCode;
        profile.Country = country;
        profile.ShippingRegion = shippingRegion;
        profile.MobPhone = mobPhone;
        MembershipUser user = Membership.GetUser(profile.UserName);
        user.Email = email;
        Membership.UpdateUser(user); 
    }
}