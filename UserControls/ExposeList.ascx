<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExposeList.ascx.cs" Inherits="UserControls_ExposeList" %>

<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>
<uc1:Pager ID="topPager" runat="server" Visible="false"/>

<asp:DataList ID="list" runat="server" RepeatColumns="1" 
    onitemdatabound="list_ItemDataBound" EnableViewState="False">
<ItemTemplate>
    <div id="ProductTitle">
      <a href="<%# Link.ToExpose(Eval("ExposeID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
      </a>
    </div>
    <a href="<%# Link.ToExpose(Eval("ExposeID").ToString()) %>">
    <div id="ProductImage">
      <img width="75px" height="100px" src='<%# Link.ToExposeImage(Eval("Thumbnail").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
   </div>
    </a>
    <div id="div">
      <a href="<%# Link.ToExpose(Eval("ExposeID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>
      </a>
    </div>
    </div>
  </ItemTemplate>

</asp:DataList>

<uc1:Pager ID="bottomPager" runat="server" Visible="False" />