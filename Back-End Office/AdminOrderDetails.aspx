<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminOrderDetails.aspx.cs" Inherits="Back_End_Office_AdminOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">Администрационен Панел
    <br />
    Детайли на поръчката </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
  <h2>
    <asp:Label ID="orderIdLabel" runat="server" CssClass="AdminTitle" Text="Order #000" />
  </h2>
  
  
  <p>
   Поръчката съдържа следните артикули:
  </p>
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
        BackColor="White" Width="100%" BorderColor="#DEDFDE" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="ProductID" HeaderText="Номер на Артикула" ReadOnly="True" SortExpression="ProductID" />
      <asp:BoundField DataField="Product_Name" HeaderText="Име на Артикула" ReadOnly="True" SortExpression="ProductName" />
      <asp:BoundField DataField="Quantity" HeaderText="Количество" ReadOnly="True" SortExpression="Quantity" />
      <asp:BoundField DataField="UnitCost" HeaderText="Ед. Цена" ReadOnly="True" SortExpression="UnitCost" />
      <asp:BoundField DataField="Subtotal" HeaderText="Сума" ReadOnly="True" SortExpression="Subtotal" />
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
  
  
</asp:Content>


