<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_ShoppingCart" %>

<%@ Register src="../../UserControls/UserInfo.ascx" tagname="UserInfo" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="about">
<p>
    <asp:Label ID="titleLabel" runat="server" Text="Вашата Количка" CssClass="CatalogTitle" />
  </p>
  <p>
    <asp:Label ID="statusLabel" runat="server" />
  </p>
  <uc1:UserInfo ID="UserInfo1" runat="server" />
&nbsp;<asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
    Width="90%" BorderWidth="1px" OnRowDeleting="grid_RowDeleting" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Product_Name" HeaderText="Име" ReadOnly="True" SortExpression="Name">
        <ControlStyle Width="100%" />
      </asp:BoundField>
      <asp:BoundField DataField="Price" DataFormatString="{0:00 лв.}" HeaderText="Цена" ReadOnly="True"
        SortExpression="Price" />
      <asp:BoundField DataField="Attributes" HeaderText="Опции" ReadOnly="True" />
      <asp:TemplateField HeaderText="Количество">
        <ItemTemplate>
          <asp:TextBox ID="editQuantity" runat="server" CssClass="GridEditingRow" Width="24px"
            MaxLength="2" Text='<%#Eval("Quantity")%>' />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="Subtotal" DataFormatString="{0:00 лв.}" HeaderText="Сума до момента"
        ReadOnly="True" SortExpression="Subtotal" />
      <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Изтрий"></asp:ButtonField>
    
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
  <p align="right" style="margin-right: 30px">
    <span>Тотал: </span>
    <asp:Label ID="totalAmountLabel" runat="server" Text="Label" />
  </p>
  <p>
  
  </p>
  <p align="right">
    <asp:Button ID="updateButton" runat="server" Text="Обнови" 
      onclick="updateButton_Click" />
      <asp:Button ID="checkoutButton" runat="server" 
      Text="Продължи" onclick="checkoutButton_Click" />  
      
  </p>
  </div>
</asp:Content>



