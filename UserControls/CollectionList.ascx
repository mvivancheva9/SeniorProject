<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CollectionList.ascx.cs" Inherits="UserControls_Collection" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList" Width="100%" HeaderStyle-CssClass="CategoryListHeader">
    <HeaderStyle CssClass="CategoryListHeader"></HeaderStyle>
   <HeaderTemplate>
    Колекция
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToCollection(Request.QueryString["BrandID"], Eval("CollectionID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("CollectionID").ToString() ==
               Request.QueryString["CollectionID"] ?
               "CategorySelected" : "CategoryUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>