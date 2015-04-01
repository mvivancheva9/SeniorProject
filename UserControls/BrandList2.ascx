<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrandList2.ascx.cs" Inherits="UserControls_BrandList2" %>
<asp:DataList ID="list" runat="server" Width="100%" CssClass="BrandList">
  <HeaderStyle CssClass="BrandListHead" />
  <HeaderTemplate>
    Компания
  </HeaderTemplate>  

    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" 
                       NavigateUrl='<%# Link.ToBrand2(Eval("BrandID").ToString())%>'
                       Text='<%# HttpUtility.HtmlEncode(Eval("Brand_Name").ToString()) %>'
                       ToolTip='<%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>'
                       CssClass='<%# Eval("BrandID").ToString() == Request.QueryString["BrandID"] ? "BrandSelected" : "BrandUnselected" %>'>
        </asp:HyperLink>
        
    </ItemTemplate>
</asp:DataList>