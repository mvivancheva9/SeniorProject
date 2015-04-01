<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Front_End_Office_Leisure_Time_Leisure" %>



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
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.facebook.com/vivabags">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Pictures/facebook_logo.png" Width="20px" Height="20px" /> vivabags</asp:HyperLink>
</div>

 </div>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
</asp:Content>

