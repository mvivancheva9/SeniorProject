<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Celebrities/News.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Celebrities_Default" %>

<%@ Register src="../../UserControls/NewList.ascx" tagname="NewList" tagprefix="uc1" %>

<%@ Register src="../../UserControls/ExposeList.ascx" tagname="ExposeList" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
    
    <uc2:ExposeList ID="ExposeList1" runat="server" />
   
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:NewList ID="NewList1" runat="server" />
    
</asp:Content>

