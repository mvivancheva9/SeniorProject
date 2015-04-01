<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryList.ascx.cs" Inherits="UserControls_CategoryList" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList" Width="100%" HeaderStyle-CssClass="CategoryListHeader">
    <HeaderStyle CssClass="CategoryListHeader"></HeaderStyle>
   <HeaderTemplate>
    Вид артикул
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToCategory(Request.QueryString["BrandID"], Eval("CategoryID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Category_Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Category_Description").ToString()) %>'
      CssClass='<%# Eval("CategoryID").ToString() ==
               Request.QueryString["CategoryID"] ?
               "CategorySelected" : "CategoryUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>