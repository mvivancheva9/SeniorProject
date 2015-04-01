<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList.ascx.cs" Inherits="UserControls_ProductList" %>

<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>

<uc1:Pager ID="topPager" runat="server" Visible="false"/>

<asp:DataList ID="list" runat="server" RepeatColumns="5" 
    onitemdatabound="list_ItemDataBound" EnableViewState="False">
<ItemTemplate>
<div id="product">
    <div id="ProductTitle">
      <a href="<%# Link.ToProduct(Eval("ProductID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Product_Name").ToString()) %>
      </a>
    </div>
    <a href="<%# Link.ToProduct(Eval("ProductID").ToString()) %>">
    <div id="ProductImage">
      <img width="75px" height="100px" src='<%# Link.ToProductImage(Eval("Thumbnail").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Product_Name").ToString())%>' />
   </div>
    </a>
    <div id="Price"> &nbsp
      Цена:
      <%# Eval("Price", "{0:0.00 лв.}")%>
 <br />
 <div id="Attribute">
    <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder>
    </div>
    </div>
    </div>
  </ItemTemplate>

</asp:DataList>
<uc1:Pager ID="bottomPager" runat="server" Visible="false" />
