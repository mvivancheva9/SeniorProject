<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminOrders.aspx.cs" Inherits="Back_End_Office_AdminOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">Администрационен Панел
    <br />
    Поръчки </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
Покажи последни поръчки
  <asp:TextBox ID="recentCountTextBox" runat="server" MaxLength="4" Width="40px" Text="20" />
записа
  <asp:Button ID="byRecentGo" runat="server" Text="Виж" CausesValidation="False" 
    onclick="byRecentGo_Click" /><br />
 Покажи всички поръчки направени между
  <asp:TextBox ID="startDateTextBox" runat="server" Width="72px" />
  и
  <asp:TextBox ID="endDateTextBox" runat="server" Width="72px" />
  <asp:Button ID="byDateGo" runat="server" Text="Виж" onclick="byDateGo_Click" />
  <br />
  <asp:Label ID="errorLabel" runat="server" CssClass="AdminError" 
    EnableViewState="False"></asp:Label>
&nbsp;
  <asp:RangeValidator ID="startDateValidator" runat="server" 
    ControlToValidate="startDateTextBox" Display="None" 
    ErrorMessage="Невалидна Начална Дата" MaximumValue="1/1/2025" 
    MinimumValue="1/1/2009" Type="Date"></asp:RangeValidator>
&nbsp;<asp:RangeValidator ID="endDateValidator" runat="server" 
    ControlToValidate="endDateTextBox" Display="None" 
    ErrorMessage="Невалидна Крайна Дата" MaximumValue="1/1/2025" MinimumValue="1/1/1999" 
    Type="Date"></asp:RangeValidator>
&nbsp;<asp:CompareValidator ID="compareDatesValidator" runat="server" 
    ControlToCompare="endDateTextBox" ControlToValidate="startDateTextBox" 
    Display="None" ErrorMessage="Началната Дата трябва да е по-скрошна" 
    Operator="LessThan" Type="Date"></asp:CompareValidator>
  <asp:ValidationSummary ID="validationSummary" runat="server" 
    CssClass="AdminError" HeaderText="Грешки:" />
  <br />
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="OrderID" onselectedindexchanged="grid_SelectedIndexChanged" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="OrderID" HeaderText="Номер на Поръчката" ReadOnly="True" 
        SortExpression="OrderID" />
      <asp:BoundField DataField="DateCreated" HeaderText="Дата на Поръчката" 
        ReadOnly="True" SortExpression="DateCreated" />
      <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Избери" />
      <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink runat="server" ID="link" NavigateUrl='<%# "AdminOrderClient.aspx?OrderID=" + Eval("OrderID")%>' Text="Виж Клиента">
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
</asp:Content>




