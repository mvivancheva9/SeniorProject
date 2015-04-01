<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Celebrities/News.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Front_End_Office_Celebrities_Default2" %>

<%@ Register src="../../UserControls/NewsList2.ascx" tagname="NewList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="about">
     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
   <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="400" height="300" id="tech" align="middle" quality="high"allowFullScreen="true" wmode="transparent" allowScriptAccess="always" >
  <param name="movie" value="news.swf?xml_path=slides.xml" />
  <param name="quality" value="high" />
  <param name="allowFullScreen" value="true" />
  <param name="wmode" value="transparent" />
  <param name="allowScriptAccess" value="always" />
  <param name="_flashcreator" value="http://www.photo-flash-maker.com" />
  <param name="_flashhost" value="http://www.go2album.com" />
  <embed src="news.swf?xml_path=slides.xml" width="400" height="300" quality="high" allowFullScreen="true" wmode="transparent" allowScriptAccess="always" name="tech" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
    <uc1:NewList ID="NewList1" runat="server" />
    </div>
</asp:Content>

