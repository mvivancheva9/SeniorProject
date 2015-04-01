<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeisureList.ascx.cs" Inherits="UserControls_LeisureList" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList" Width="100%" HeaderStyle-CssClass="CategoryListHeader">
    <HeaderStyle CssClass="CategoryListHeader"></HeaderStyle>
   <HeaderTemplate>
    Leisure Activity
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToLeisure(Eval("LeisureID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("LeisureID").ToString() ==
               Request.QueryString["LeisureID"] ?
               "CategorySelected" : "CategoryUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>