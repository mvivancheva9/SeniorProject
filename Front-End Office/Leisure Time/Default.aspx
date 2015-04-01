<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_Leisure_Time_Default" %>


<%@ Register src="../../UserControls/ActivityList.ascx" tagname="ActivityList" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
<div id="contact">
<uc1:ActivityList ID="ActivityList1" runat="server" />
<br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.facebook.com/vivabags">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Pictures/facebook_logo.png" Width="20px" Height="20px" /> vivabags</asp:HyperLink>
</div>
<div id="map">
 <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.bg/maps?f=q&amp;source=s_q&amp;hl=bg&amp;geocode=&amp;q=SKY+CITY+MALL,+%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%E2%80%9E%D0%9A%D0%BE%D1%81%D1%82%D0%B0+%D0%9B%D1%83%D0%BB%D1%87%D0%B5%D0%B2%E2%80%9C,+%D0%A1%D0%BE%D1%84%D0%B8%D1%8F&amp;aq=0&amp;oq=Sky+&amp;sll=42.654413,23.364904&amp;sspn=0.613062,1.251068&amp;ie=UTF8&amp;hq=SKY+CITY+MALL,&amp;hnear=%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%E2%80%9E%D0%9A%D0%BE%D1%81%D1%82%D0%B0+%D0%9B%D1%83%D0%BB%D1%87%D0%B5%D0%B2%E2%80%9C,+%D0%A1%D0%BE%D1%84%D0%B8%D1%8F&amp;t=m&amp;ll=42.67988,23.367364&amp;spn=0.006295,0.006295&amp;output=embed"></iframe><br /><small><a href="http://maps.google.bg/maps?f=q&amp;source=embed&amp;hl=bg&amp;geocode=&amp;q=SKY+CITY+MALL,+%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%E2%80%9E%D0%9A%D0%BE%D1%81%D1%82%D0%B0+%D0%9B%D1%83%D0%BB%D1%87%D0%B5%D0%B2%E2%80%9C,+%D0%A1%D0%BE%D1%84%D0%B8%D1%8F&amp;aq=0&amp;oq=Sky+&amp;sll=42.654413,23.364904&amp;sspn=0.613062,1.251068&amp;ie=UTF8&amp;hq=SKY+CITY+MALL,&amp;hnear=%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%E2%80%9E%D0%9A%D0%BE%D1%81%D1%82%D0%B0+%D0%9B%D1%83%D0%BB%D1%87%D0%B5%D0%B2%E2%80%9C,+%D0%A1%D0%BE%D1%84%D0%B8%D1%8F&amp;t=m&amp;ll=42.67988,23.367364&amp;spn=0.006295,0.006295" style="color:#0000FF;text-align:left">Вижте по-голяма карта</a></small>
  </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
    
   
</asp:Content>

