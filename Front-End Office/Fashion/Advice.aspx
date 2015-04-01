<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Advice.aspx.cs" Inherits="Front_End_Office_Fashion_Advice" %>



<%@ Register src="../../UserControls/FashionList2.ascx" tagname="FashionList2" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div id="ActivityTitle">
    <asp:Label ID="titleLabel" runat="server" Text="Label"></asp:Label>
    </div>
<div id="ActivityDescr">
    <asp:Label ID="characteristicsLabel" runat="server" Text="Label" ></asp:Label>
</div>
<div id="ActivityImage">
    <asp:Image ID="productImage" runat="server" Width="150px" Height="210px"  />
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <uc1:FashionList2 ID="FashionList21" runat="server" />

</asp:Content>

