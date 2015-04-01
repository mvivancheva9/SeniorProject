<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdviceList.ascx.cs" Inherits="UserControls_AdviceList" %>

<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>
<uc1:Pager ID="topPager" runat="server" />

<asp:DataList ID="list" runat="server" RepeatColumns="1" 
    onitemdatabound="list_ItemDataBound" EnableViewState="False">
<ItemTemplate>
    <div id="ProductTitle">
      <a href="<%# Link.ToAdvice(Eval("AdviceID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
      </a>
    </div>
    <a href="<%# Link.ToAdvice(Eval("AdviceID").ToString()) %>">
    <div id="ProductImage">
      <img width="75px" height="100px" src='<%# Link.ToProductImage(Eval("Thumbnail").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
   </div>
    </a>
    <div id="div">
      <a href="<%# Link.ToActivity(Eval("AdviceID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Description").ToString()) %>
      </a>
    </div>
    </div>
  </ItemTemplate>

</asp:DataList>

