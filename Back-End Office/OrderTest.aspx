<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="OrderTest.aspx.cs" Inherits="Back_End_Office_OrderTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
Order number:
  <asp:TextBox runat="server" ID="orderIDBox" />
  <br />
  <asp:Button runat="server" ID="goButton" Text="Go" onclick="goButton_Click" />
  <br />
  <br />
  <asp:Label runat="server" ID="resultLabel" />
  <br />
  <br />
  <strong>Customer address:</strong>
  <br />
  <asp:Label runat="server" ID="addressLabel" />
  <br />
  <strong>Order details:</strong>
  <br />
  <asp:Label runat="server" ID="orderLabel" />
</asp:Content>


