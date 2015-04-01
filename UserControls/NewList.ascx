<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewList.ascx.cs" Inherits="UserControls_New" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList" Width="100%" HeaderStyle-CssClass="CategoryListHeader">
    <HeaderStyle CssClass="CategoryListHeader"></HeaderStyle>
   <HeaderTemplate>
    Новини
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToNew(Eval("NewID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("NewID").ToString() ==
               Request.QueryString["NewID"] ?
               "CategorySelected" : "CategoryUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>