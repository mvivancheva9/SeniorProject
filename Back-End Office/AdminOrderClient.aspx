<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminOrderClient.aspx.cs" Inherits="Back_End_Office_AdminOrderClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
<p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="CustomerID" 
    AutoGenerateColumns="False" Width="100%" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:TemplateField HeaderText="Име на Клиента" SortExpression="Name">
       
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Адрес на Доставка" 
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
      <asp:TemplateField HeaderText="Е-майл" SortExpression="Email">
        
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
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
</asp:Content>

