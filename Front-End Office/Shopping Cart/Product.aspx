<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="about">
<div id="ProductTitle">
    <asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label><br />
</div>
<div id="Descr">
    <asp:Label ID="characteristicsLabel" runat="server" Text="Label"></asp:Label><br />
    <asp:Label ID="priceLabel" runat="server" Text="Label"></asp:Label><br />
    <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder><br />
    <div id="AddtoShoppingCart">
    <asp:LinkButton ID="AddToCartButton" runat="server" 
     onclick="AddToCartButton_Click">Добави в Количката</asp:LinkButton>
    </div>
    </div>
<div id="ProductImage">
    <asp:Image ID="productImage" runat="server" Width="225px" Height="300px" />
</div>
</div>
    </asp:Content>
