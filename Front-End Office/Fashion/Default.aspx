<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Fashion/Fashion.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Fashion_Default" %>

<%@ Register src="../../UserControls/FashionList.ascx" tagname="FashionList" tagprefix="uc1" %>

<%@ Register src="../../UserControls/AdviceList.ascx" tagname="AdviceList" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:FashionList ID="FashionList1" runat="server" />
    <br />
    <div id="about">
    <uc2:AdviceList ID="AdviceList1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
<br />
<object width="100%" height="400px"><param name="movie" value="mybanner1020_2012.swf"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="mybanner1020_2012.swf" type="application/x-shockwave-flash" width="100%" height="400px" allowscriptaccess="always"></embed></object>
</asp:Content>

