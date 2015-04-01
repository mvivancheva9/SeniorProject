<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList2.ascx.cs" Inherits="UserControls_ProductList2" %>
<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>

<asp:DataList ID="list" runat="server" RepeatColumns="5" 
    onitemdatabound="list_ItemDataBound" EnableViewState="False">
<ItemTemplate>
<div id="product">
    <div id="ProductTitle">
      <a href="<%# Link.ToProduct2(Eval("ProductID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Product_Name").ToString()) %>
      </a>
    </div>
    <a href="<%# Link.ToProduct2(Eval("ProductID").ToString()) %>">
    <div id="ProductImage">
      <img width="75px" height="100px" src='<%# Link.ToProductImage(Eval("Thumbnail").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Product_Name").ToString())%>' />
   </div>
    </a>
    </div>
 
  </ItemTemplate>

</asp:DataList>
<br />
<uc1:Pager ID="topPager" runat="server" Visible="false"/>