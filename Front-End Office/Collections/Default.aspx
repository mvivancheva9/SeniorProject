<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Collections_Default" %>



<%@ Register src="../../UserControls/BrandList2.ascx" tagname="BrandList2" tagprefix="uc1" %>



<%@ Register src="../../UserControls/CollectionList.ascx" tagname="CollectionList" tagprefix="uc2" %>



<%@ Register src="../../UserControls/ProductList2.ascx" tagname="ProductList2" tagprefix="uc3" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
<asp:Label ID="catalogDescriptionLabel" runat="server" Text=""></asp:Label>
<br />
<br />
    <uc3:ProductList2 ID="ProductList21" runat="server" />
    
    
    
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">



    <uc1:BrandList2 ID="BrandList21" runat="server" />
    <uc2:CollectionList ID="CollectionList1" runat="server" />
    <br />




</asp:Content>

