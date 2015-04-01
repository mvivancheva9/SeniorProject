<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsList2.ascx.cs" Inherits="UserControls_NewsList2" %>
<asp:DataList ID="list" runat="server" CssClass="CategoryList2" Width="100%" HeaderStyle-CssClass="CategoryListHeader2" RepeatDirection="Horizontal">
    <HeaderStyle CssClass="CategoryListHeader2"></HeaderStyle>
   <HeaderTemplate>
    Новини
  </HeaderTemplate>
  <HeaderStyle CssClass="CategoryListHeader2" />
  <ItemTemplate>
  <div style=" text-align: center">
    <asp:HyperLink  ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToNew(Eval("NewID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("NewID").ToString() ==
               Request.QueryString["NewID"] ?
               "CategorySelected2" : "CategoryUnselected2" %>'>>
    </asp:HyperLink>
    </div> 
    </ItemTemplate>
</asp:DataList>