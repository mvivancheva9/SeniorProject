<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminNews.aspx.cs" Inherits="Back_End_Office_AdminNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
   Администрационен Панел
    <br />
    Видове Новини
  </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="NewID" Width="100%" 
    AutoGenerateColumns="False" onrowcancelingedit="grid_RowCancelingEdit" 
    onrowdeleting="grid_RowDeleting" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Категория Новина" 
        SortExpression="Name" />
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
      <asp:HyperLinkField DataNavigateUrlFields="NewID" 
        DataNavigateUrlFormatString="AdminExpose.aspx?NewID={0}" 
        HeaderText="Виж Новини" Text="Виж Новини" />
      <asp:CommandField ShowEditButton="True" CancelText="Прекъсни" DeleteText="Изтрий" EditText="Промени" InsertText="Вмъкни" SelectText="Избери" UpdateText="Обнови" />
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
  <th>Създай нова категория новини:</th>
  </tr>
  <tr>
  <th>Име на категорията:</th>
  <td><asp:TextBox ID="newName" runat="server" Width="400px" /></td>
  </tr>
  <tr>
  <th>Описание:</th>
  <td><asp:TextBox ID="newDescription" runat="server" Width="400px" Height="70px" TextMode="MultiLine" /></td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button 
       ID="createNew" 
       Text="Създай" 
       runat="server" 
       onclick="createNew_Click" /></td>
  </tr>
  </table>
</asp:Content>

