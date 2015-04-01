<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminExposeDetails.aspx.cs" Inherits="Back_End_Office_AdminExposeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
Администрационен Панел
    <br />
   Продукти в:
    <asp:HyperLink ID="newLink" runat="server" />
  </span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <asp:Label CssClass="AdminTitle" ID="exposeNameLabel" runat="server" />  
  <p>
    <asp:Label ID="statusLabel" CssClass="AdminError" runat="server" />
  </p>
  <table>
  <tr>
  <th>Продуктът принадлежи към тези категории:</th>
  <td><asp:Label ID="newLabel" runat="server" /></td>
  </tr>
  <tr>
  <th>Премахни продукта от тази категория:</th>
   <td> 
    <asp:DropDownList ID="newListRemove" runat="server" />  
    <asp:Button ID="removeButton" runat="server" Text="Премахни" OnClick="removeButton_Click" />
    <asp:Button ID="deleteButton" runat="server" Text="Изтрий от Каталога" OnClick="deleteButton_Click" />
  </td>
  </tr>
  <tr>
  <th>Добави продукта към тази категория:</th>
  <td><asp:DropDownList ID="newListAssign" runat="server" />  
    <asp:Button ID="assignButton" runat="server" Text="Добави" OnClick="assignButton_Click" />
    </td>
  </tr>
  <tr>
  <th>Премести продукта към тази категория:</th>
  <td><asp:DropDownList ID="newListMove" runat="server" />
    <asp:Button ID="moveButton" runat="server" Text="Премести" OnClick="moveButton_Click" />
  </td>
  </tr>
  <tr>
  <th>Малка Снимка:</th>
  <th>Голяма Снимка:</th>
  </tr>
  <tr>
  <td><asp:Label ID="Image1Label" runat="server" />
    <asp:FileUpload ID="image1FileUpload" runat="server" />
    <asp:Button ID="upload1Button" runat="server" Text="Прикачи" 
      onclick="upload1Button_Click" /><br />
    <asp:Image ID="image1" runat="server" Width="150px" Height="200px" />
    </td>
    <td><asp:Label ID="Image2Label" runat="server" />
    <asp:FileUpload ID="image2FileUpload" runat="server" />
    <asp:Button ID="upload2Button" runat="server" Text="Прикачи" 
      onclick="upload2Button_Click" /><br />
    <asp:Image ID="image2" runat="server" Width="150px" Height="200px" /></td>
  </tr>
    
  </table>
</asp:Content>