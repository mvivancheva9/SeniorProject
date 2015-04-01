<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Celebrities/News.master" AutoEventWireup="true" CodeFile="Expose.aspx.cs" Inherits="Front_End_Office_Celebrities_Expose" %>

<%@ Register src="../../UserControls/NewList.ascx" tagname="NewList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
<div id="ActivityTitle">
    <asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label>
    </div>
<div id="ActivityDescr">
    <asp:Label ID="characteristicsLabel" runat="server" Text="Label" ></asp:Label>
</div>
<div id="ActivityImage">
    <asp:Image ID="productImage" runat="server" Width="150px" Height="210px"  />
</div>
 </div>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <uc1:NewList ID="NewList1" runat="server" />

</asp:Content>

