<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/Shopping Cart/Shopping.master" AutoEventWireup="true" CodeFile="OrderPlaced.aspx.cs" Inherits="Front_End_Office_Shopping_Cart_OrderPlaced" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
<p>Благодаря Ви за вашата поръчка!
</p>
Натиснете <b>Продължи</b> за да въведете допълнителна информация за доставка
  <asp:TextBox ID="recentCountTextBox" runat="server" MaxLength="1" Width="40px" Text="1" Visible="False" />
   <asp:Button ID="byRecentGo" runat="server" Text="Продължи" CausesValidation="False" 
    onclick="byRecentGo_Click" Width="100px" />
   <br />
   <br />
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="OrderID" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="OrderID" HeaderText="Клиентски Номер" ReadOnly="True" 
        SortExpression="OrderID" />
        <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink runat="server" ID="link" NavigateUrl='<%# "CustomerInfo.aspx?OrderID=" + Eval("OrderID")%>' Text="Въведете Информация">
          </asp:HyperLink>
        </ItemTemplate>
      </asp:TemplateField>
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
  </div>
  </asp:Content>

