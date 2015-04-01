<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_Checkout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="about">
   <asp:Label ID="titleLabel" runat="server" 
    CssClass="CatalogTitle" Text="Потвърдете вашата поръчка" />
  <br /><br />
  <asp:GridView ID="grid" runat="server" Width="90%"
    AutoGenerateColumns="False" DataKeyNames="ProductID" 
    BorderWidth="1px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical" >
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Product_Name" HeaderText="Име"
       ReadOnly="True" SortExpression="Name" />
      <asp:BoundField DataField="Price" DataFormatString="{0:00 лв.}"
       HeaderText="Цена" ReadOnly="True"
        SortExpression="Price" />
      <asp:BoundField DataField="Quantity" HeaderText="Количество"
       ReadOnly="True" SortExpression="Quantity" />
      <asp:BoundField DataField="Subtotal" ReadOnly="True" 
        DataFormatString="{0:00 лв.}" HeaderText="Сума до момента:"
        SortExpression="Subtotal" />
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
  <asp:Label ID="Label2" runat="server" Text="Крайна Сума: " 
    CssClass="ProductDescription" />
  <asp:Label ID="totalAmountLabel" runat="server" Text="Label" 
    CssClass="ProductPrice" />
   <asp:Label ID="InfoLabel" runat="server" />
  <asp:Label ID="Label1" runat="server" />
  <asp:Button ID="placeOrderButton" runat="server" 
    Text="Продължи" OnClick="placeOrderButton_Click" />
    
    </div>
</asp:Content>

