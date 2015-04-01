<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FashionList2.ascx.cs" Inherits="UserControls_FashionList2" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList" Width="100%" HeaderStyle-CssClass="CategoryListHeader">
    <HeaderStyle CssClass="CategoryListHeader"></HeaderStyle>
   <HeaderTemplate>
    Fashion Today
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToFashion(Eval("FashionID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("FashionID").ToString() ==
               Request.QueryString["FashionID"] ?
               "CategorySelected" : "CategoryUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>