<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FashionList.ascx.cs" Inherits="UserControls_FashionList" %>
<asp:DataList ID="list" runat="server" CssClass="FashionList" Width="90%" HeaderStyle-CssClass="FashionListHeader">
    <HeaderStyle CssClass="FashionListHeader"></HeaderStyle>
   <HeaderTemplate>
    Fashion Activity
  </HeaderTemplate>
  <HeaderStyle CssClass="FashionListHeader" />
  <ItemTemplate>
    <asp:HyperLink ID="HyperLink1" Runat="server"
      NavigateUrl='<%# Link.ToFashion(Eval("FashionID").ToString()) %>'
      Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>'
      ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
      CssClass='<%# Eval("FashionID").ToString() ==
               Request.QueryString["FashionID"] ?
               "FashionSelected" : "FashionUnselected" %>'>>
    </asp:HyperLink>
    </ItemTemplate>
</asp:DataList>