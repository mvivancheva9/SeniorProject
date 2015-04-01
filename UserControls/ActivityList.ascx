<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActivityList.ascx.cs" Inherits="UserControls_Activity" %>

<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>
<uc1:Pager ID="topPager" runat="server" Visible="false" />

<asp:DataList ID="list" runat="server" RepeatColumns="1" 
    onitemdatabound="list_ItemDataBound" EnableViewState="False">
<ItemTemplate>
    <div id="ProductTitle">
      <a href="<%# Link.ToActivity(Eval("ActivityID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Name").ToString()) %>
      </a>
    </div>
    <a href="<%# Link.ToActivity(Eval("ActivityID").ToString()) %>">
    <div id="ProductImage">
      <img width="140px" height="185px" src='<%# Link.ToProductImage(Eval("Thumbnail").ToString()) %>' alt='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
   </div>
    </a>
     
    </div>
  </ItemTemplate>

</asp:DataList>