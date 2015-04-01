using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;

/// <summary>
/// Wraps order data
/// </summary>
public struct OrderInfo
{
    public int OrderID;
    public decimal TotalAmount;
    public string DateCreated;
    public string DateShipped;
    public string Comments;
    public string CustomerName;
    public string ShippingAddress;
    public string CustomerEmail;
}

/// <summary>
/// Wraps category details data
/// </summary>
public struct ClientDetails
{
    public int OrderId;
    public string Name;
    public string Address;
    public int PhoneNumber;
    public string Email;
}

/// <summary>
/// Summary description for OrdersAccess
/// </summary>
public class OrdersAccess
{
    public OrdersAccess()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    // Retrieve the recent orders
    public static DataTable GetByRecent(int count)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "OrdersGetByRecent";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@Count";
        param.Value = count;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // return the result table
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        return table;
    }

    // Get category details
    public static ClientDetails GetClientDetails(string customerId)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "CatalogGetClientDetails";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CustomerID";
        param.Value = customerId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // execute the stored procedure
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        // wrap retrieved data into a CategoryDetails object
        ClientDetails details = new ClientDetails();
        if (table.Rows.Count > 0)
        {
            details.OrderId = Int32.Parse(table.Rows[0]["OrderID"].ToString());
            details.Name = table.Rows[0]["Name"].ToString();
            details.Address = table.Rows[0]["Address"].ToString();
            details.PhoneNumber = Int32.Parse(table.Rows[0]["PhoneNumber"].ToString());
            details.Email = table.Rows[0]["Email"].ToString();
        }
        // return order details
        return details;
    }

    // retrieve the list of client in an order
    public static DataTable GetClientInOrder(string orderId)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "CatalogGetClientInOrder";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@OrderID";
        param.Value = orderId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // execute the stored procedure
        return GenericDataAccess.ExecuteSelectCommand(comm);
    }

    // Create a new Client
    public static bool CreateClient(string orderId,
     string name, string address, string phonenumber, string email)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "CatalogCreateClient";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@OrderID";
        param.Value = orderId;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Name";
        param.Value = name;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Address";
        param.Value = address;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@PhoneNumber";
        param.Value = phonenumber;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Email";
        param.Value = email;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // result will represent the number of changed rows
        int result = -1;
        try
        {
            // execute the stored procedure
            result = GenericDataAccess.ExecuteNonQuery(comm);
        }
        catch
        {
            // any errors are logged in GenericDataAccess, we ignore them here
        }
        // result will be 1 in case of success 
        return (result != -1);
    }

    // Update client details
    public static bool UpdateClient(string id, string name, string address, string phonenumber, string email)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "CatalogUpdateClient";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@CustomerId";
        param.Value = id;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Name";
        param.Value = name;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Address";
        param.Value = address;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@PhoneNumber";
        param.Value = phonenumber;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Email";
        param.Value = email;
        param.DbType = DbType.String;
        param.Size = 50;
        comm.Parameters.Add(param);
        // result will represent the number of changed rows
        int result = -1;
        try
        {
            // execute the stored procedure
            result = GenericDataAccess.ExecuteNonQuery(comm);
        }
        catch
        {
            // any errors are logged in GenericDataAccess, we ignore them here
        }
        // result will be 1 in case of success 
        return (result != -1);
    }

    // Retrieve orders that have been placed in a specified period of time
    public static DataTable GetByDate(string startDate, string endDate)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "OrdersGetByDate";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@StartDate";
        param.Value = startDate;
        param.DbType = DbType.Date;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@EndDate";
        param.Value = endDate;
        param.DbType = DbType.Date;
        comm.Parameters.Add(param);
        // return the result table
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        return table;
    }

    // Retrieve orders that need to be shipped/completed
    public static DataTable GetVerifiedUncompleted()
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();

        // set the stored procedure name
        comm.CommandText = "OrdersGetVerifiedUncompleted";
        // return the result table
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        return table;
    }

    // Retrieve order information
    public static OrderInfo GetInfo(string orderID)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "OrderGetInfo";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@OrderID";
        param.Value = orderID;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);

        // obtain the results
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        DataRow orderRow = table.Rows[0];
        // save the results into an OrderInfo object
        OrderInfo orderInfo;
        orderInfo.OrderID = Int32.Parse(orderRow["OrderID"].ToString());
        orderInfo.TotalAmount = Decimal.Parse(orderRow["TotalAmount"].ToString());
        orderInfo.DateCreated = orderRow["DateCreated"].ToString();
        orderInfo.DateShipped = orderRow["DateShipped"].ToString();
        orderInfo.Comments = orderRow["Comments"].ToString();
        orderInfo.CustomerName = orderRow["CustomerName"].ToString();
        orderInfo.ShippingAddress = orderRow["ShippingAddress"].ToString();
        orderInfo.CustomerEmail = orderRow["CustomerEmail"].ToString();
        // return the OrderInfo object
        return orderInfo;
    }

    // Retrieve the order details (the products that are part of that order)
    public static DataTable GetDetails(string orderID)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "OrderGetDetails";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@OrderID";
        param.Value = orderID;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // return the results
        DataTable table = GenericDataAccess.ExecuteSelectCommand(comm);
        return table;
    }

    // Update an order
    public static void Update(OrderInfo orderInfo)
    {
        // get a configured DbCommand object
        DbCommand comm = GenericDataAccess.CreateCommand();
        // set the stored procedure name
        comm.CommandText = "OrderUpdate";
        // create a new parameter
        DbParameter param = comm.CreateParameter();
        param.ParameterName = "@OrderID";
        param.Value = orderInfo.OrderID;
        param.DbType = DbType.Int32;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@DateCreated";
        param.Value = orderInfo.DateCreated;
        param.DbType = DbType.DateTime;
        comm.Parameters.Add(param);
        // The DateShipped parameter is sent only if data is available
        if (orderInfo.DateShipped.Trim() != "")
        {
            param = comm.CreateParameter();
            param.ParameterName = "@DateShipped";
            param.Value = orderInfo.DateShipped;
            param.DbType = DbType.DateTime;
            comm.Parameters.Add(param);
        }
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@Comments";
        param.Value = orderInfo.Comments;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@CustomerName";
        param.Value = orderInfo.CustomerName;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@ShippingAddress";
        param.Value = orderInfo.ShippingAddress;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);
        // create a new parameter
        param = comm.CreateParameter();
        param.ParameterName = "@CustomerEmail";
        param.Value = orderInfo.CustomerEmail;
        param.DbType = DbType.String;
        comm.Parameters.Add(param);
        // return the results
        GenericDataAccess.ExecuteNonQuery(comm);
    }
}
