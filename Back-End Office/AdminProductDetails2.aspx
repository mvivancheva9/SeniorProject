<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminProductDetails2.aspx.cs" Inherits="Back_End_Office_AdminProductDetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
Администрационен Панел
    <br />
Продукти в:
    <asp:HyperLink ID="collLink" runat="server" />
  </span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <asp:Label CssClass="AdminTitle" ID="productNameLabel" runat="server" />  
  <p>
    <asp:Label ID="statusLabel" CssClass="AdminError" runat="server" />
  </p>
 <table>
 <tr>
 <th>Продуктът принадлежи към колекция::</th>
 <td><asp:Label ID="collectionLabel" runat="server" /></td>
 </tr>
 <tr>
  <th>Премахни Продукта от тази колекция::</th>
   <td> 
    <asp:DropDownList ID="collectionListRemove" runat="server" />  
    <asp:Button ID="removeButton" runat="server" Text="Премахни" OnClick="removeButton_Click" />
    <asp:Button ID="deleteButton" runat="server" Text="Изтрий от Колекцията" OnClick="deleteButton_Click" />
  </td>
  </tr>
 <tr>
 <th>Добави продукта към друга колекция:</th>
 <td><asp:DropDownList ID="collectionListAssign" runat="server" />  
    <asp:Button ID="assignButton" runat="server" Text="Добави" OnClick="assignButton_Click" />
    </td>
  </tr>
  <tr>
  <th>Премести продукта към друга колекция:</th>
  <td><asp:DropDownList ID="collectionListMove" runat="server" />
    <asp:Button ID="moveButton" runat="server" Text="Премести" OnClick="moveButton_Click" />
  </td>
  </tr>
  <tr>
  <th>Малка Снимка:</th>
  <th> Голяма Снимка:</th>
  </tr>
  <tr>
  <td>
    <asp:Label ID="Image1Label" runat="server" />
    <asp:FileUpload ID="image1FileUpload" runat="server" />
    <asp:Button ID="upload1Button" runat="server" Text="Прикачи" 
      onclick="upload1Button_Click" /><br />
    <asp:Image ID="image1" runat="server" Width="150px" Height="200px"/>
  </td>
  <td>
   
    <asp:Label ID="Image2Label" runat="server" />
    <asp:FileUpload ID="image2FileUpload" runat="server" />
    <asp:Button ID="upload2Button" runat="server" Text="Прикачи" 
      onclick="upload2Button_Click" /><br />
    <asp:Image ID="image2" runat="server" Width="150px" Height="200px"/>
  </td>
  </tr>
  </table>
</asp:Content>

