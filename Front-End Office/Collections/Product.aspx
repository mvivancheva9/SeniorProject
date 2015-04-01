<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Front_End_Office_Collections_Product" %>

<%@ Register src="../../UserControls/BrandList2.ascx" tagname="BrandList2" tagprefix="uc1" %>
<%@ Register src="../../UserControls/CollectionList.ascx" tagname="CollectionList" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
<div id="ProductTitle">
    <asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label><br />
</div>
<div id="Descr">
    <asp:Label ID="characteristicsLabel" runat="server" Text="Label"></asp:Label><br />
    <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder><br />
</div>
<div id="ProductImage">
    <asp:Image ID="productImage" runat="server" Width="260px" Height="300px" />
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <uc1:BrandList2 ID="BrandList21" runat="server" />
    <uc2:CollectionList ID="CollectionList1" runat="server" />

</asp:Content>

