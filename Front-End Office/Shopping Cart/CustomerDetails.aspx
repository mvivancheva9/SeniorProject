<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="CustomerDetails.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_CustomerDetails" %>


<%@ Register src="../../UserControls/CustomerDetailsEdit.ascx" tagname="CustomerDetailsEdit" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
    <h1>
    <span class="CatalogTitle">Edit Your Details</span>
      </h1>
    <uc1:CustomerDetailsEdit ID="CustomerDetailsEdit1" runat="server" />

</asp:Content>

