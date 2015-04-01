<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_CustomerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
    <asp:GridView ID="grid" runat="server" DataKeyNames="CustomerID" 
    AutoGenerateColumns="False" Width="100%">
    <Columns>
      <asp:TemplateField HeaderText="Име:" SortExpression="Name">
      
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Адрес:" 
        SortExpression="Address">
        
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Телефон:" SortExpression="PhoneNumber">
        
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Е-майл:" SortExpression="Email">
        
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      
     
    </Columns>
  </asp:GridView>

  <table>
  <tr>
  <td>&nbsp</td>
  <th>Моля, въведете информация за доставка</th>
  </tr>
  <tr>
  <th>Име:</th>
  <td><asp:TextBox ID="newName" runat="server" Width="400px" /></td>
  <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
          ErrorMessage="RequiredFieldValidator" ControlToValidate="newName"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
  <th>Адрес:</th>
  <td><asp:TextBox 
       ID="newAddress" 
       runat="server" 
       Width="400px"
       Height="70px" 
       TextMode="MultiLine" /></td>
       <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ControlToValidate="newAddress" ErrorMessage="RequiredField"></asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
  <th>Телефон:</th>
  <td><asp:TextBox ID="newPhone" runat="server" Width="400px"></asp:TextBox></td>
  <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
          ControlToValidate="newPhone" ErrorMessage="RequiredField"></asp:RequiredFieldValidator>
      
      </td>
  </tr>
  <tr>
  <th>Е-майл:</th>
  <td><asp:TextBox ID="newEmail" runat="server" Width="400px"></asp:TextBox></td>
  <td>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
          ControlToValidate="newEmail" ErrorMessage="RequiredField"></asp:RequiredFieldValidator>
      
      </td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button ID="createProduct" runat="server" Text="Добавете Информация" 
    onclick="createProduct_Click" /></td>
  </tr>
  
  <tr>
  <td>&nbsp</td>
  <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
          ControlToValidate="newPhone" ErrorMessage="*Please Enter only numbers" 
          ValidationExpression="^\d+$"></asp:RegularExpressionValidator></td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
          ControlToValidate="newEmail" ErrorMessage="*Please Enter Valid E-mail Address" 
          ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
  </tr>

  </table>
  </div>
</asp:Content>
