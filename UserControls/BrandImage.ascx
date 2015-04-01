<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrandImage.ascx.cs" Inherits="UserControls_BrandImage" %>


    <asp:DataList ID="list" runat="server" Width="650px" RepeatDirection="Horizontal" CssClass="DataList1" >

    <ItemTemplate>
    
        <a href="<%# Link.ToBrand2(Eval("BrandID").ToString()) %>" >
    <div id="ProductImage">
      <img width="75px" height="100px" src='<%# Link.ToBrandImage(Eval("Image").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Brand_Name").ToString())%>' />
   </div>
    </a>
    <div id="ProductTitle">
      <a href="<%# Link.ToBrand2(Eval("BrandID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Brand_Name").ToString()) %>
      </a>
    </div>
    </ItemTemplate>
</asp:DataList>