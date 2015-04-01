<%@ Page Title="Начало" Language="C#" MasterPageFile="~/Front-End Office/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Default" %>


<%@ Register src="../UserControls/BrandImage.ascx" tagname="BrandImage" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="flash">
    
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="600" height="380" id="tech" align="middle" quality="high"allowFullScreen="true" wmode="transparent" allowScriptAccess="always" >
  <param name="movie" value="bullagi collection.swf?xml_path=slides.xml" />
  <param name="quality" value="high" />
  <param name="allowFullScreen" value="true" />
  <param name="wmode" value="transparent" />
  <param name="allowScriptAccess" value="always" />
  <param name="_flashcreator" value="http://www.photo-flash-maker.com" />
  <param name="_flashhost" value="http://www.go2album.com" />
  <embed src="bullagi collection.swf?xml_path=slides.xml" width="600" height="380" quality="high" allowFullScreen="true" wmode="transparent" allowScriptAccess="always" name="tech" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
</div>
     <uc1:BrandImage ID="BrandImage1" runat="server" />
</asp:Content>

