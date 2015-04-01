<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminBrand.aspx.cs" Inherits="Back_End_Office_AdminBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
 
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="BrandID" Width="100%" 
    AutoGenerateColumns="False" onrowcancelingedit="grid_RowCancelingEdit" 
    onrowdeleting="grid_RowDeleting" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
    <asp:ImageField DataImageUrlField="Image" 
        DataImageUrlFormatString="~/ProductImages/{0}" HeaderText="Снимка" 
        ReadOnly="True" ControlStyle-Width="75px" ControlStyle-Height="100px" ItemStyle-Height="110px" ItemStyle-Width="75px">
<ControlStyle Height="100px" Width="75px"></ControlStyle>

<ItemStyle Height="110px" Width="75px"></ItemStyle>
      </asp:ImageField>
     <asp:TemplateField HeaderText="Име" SortExpression="Name">
        <EditItemTemplate>
          <asp:TextBox ID="nameTextBox" runat="server" Width="97%" 
                       CssClass="GridEditingRow" Text='<%# Bind("Brand_Name") %>'>
          </asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Brand_Name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Описание" 
        SortExpression="Description">
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' Height="70px" TextMode="MultiLine" 
            Width="400px"></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
        </ItemTemplate>

      </asp:TemplateField>
      <asp:TemplateField HeaderText="Снимка" SortExpression="Image">
        <EditItemTemplate>
          
          <asp:TextBox ID="imageTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Image") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
       
      <asp:HyperLinkField DataNavigateUrlFields="BrandID" 
        DataNavigateUrlFormatString="AdminCategories.aspx?BrandID={0}" 
        HeaderText="Виж Категории" Text="Виж Категории" />
      <asp:CommandField ShowEditButton="True" EditText="Промени" CancelText="Прекъсни" DeleteText="Изтрий" InsertText="Вмъкни" UpdateText="Обнови" />
      <asp:ButtonField CommandName="Delete" Text="Изтрий" />
    </Columns>

      <FooterStyle BackColor="#CCCC99" />
      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
      <RowStyle BackColor="#F7F7DE" />
      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#FBFBF2" />
      <SortedAscendingHeaderStyle BackColor="#848384" />
      <SortedDescendingCellStyle BackColor="#EAEAD3" />
      <SortedDescendingHeaderStyle BackColor="#575357" />
  </asp:GridView>
  <br />
  <table>
  <tr>
  <td>&nbsp</td>
  <th>Добави нова фирма:</th>
  </tr>
  <tr>
  <th>Снимка:</th>
  <td><asp:TextBox ID="newImage" runat="server" Width="400px">1.jpg</asp:TextBox></td>

  </tr>
  <tr>
  <th>Име:</th>
  <td><asp:TextBox ID="newName" runat="server" Width="400px" /></td>
  <td>
      
      </td>
  </tr>
  <tr>
  <th>Описание:</th>
  <td><asp:TextBox ID="newDescription" runat="server" Width="400px" Height="70px" TextMode="MultiLine" /></td>
 <td>&nbsp;</td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button 
       ID="createDepartment" 
       Text="Добави" 
       runat="server" 
       onclick="createDepartment_Click" /></td>
  </tr>
  </table>
</asp:Content>


