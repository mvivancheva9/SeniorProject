<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_Default" %>

<%@ Register src="../../UserControls/ProductList.ascx" tagname="ProductList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="about">
     
 <uc1:ProductList ID="ProductList1" runat="server" />
&nbsp;
 </div>
   


</asp:Content>


