<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartSummary.ascx.cs" Inherits="UserControls_CartSummary" %>
<table class="CartSummary" border="0" cellpadding="0" cellspacing="1" width="100%">
  <tr>
    <td>
      <b>
        <asp:Label ID="cartSummaryLabel" runat="server" /></b><br />
      <asp:HyperLink ID="viewCartLink" runat="server" NavigateUrl="~/Front-End Office/Shopping Cart/ShoppingCart.aspx"
        CssClass="CartLink" Text="Виж Количка" />
      <asp:DataList ID="list" runat="server">
        <ItemTemplate>
          <%# Eval("Quantity") %>
          x
          <%# Eval("Product_Name") %>
        </ItemTemplate>
      </asp:DataList>
      Тотал: <span class="ProductPrice">
        <asp:Label ID="totalAmountLabel" runat="server" />
      </span>
    </td>
  </tr>
</table>
