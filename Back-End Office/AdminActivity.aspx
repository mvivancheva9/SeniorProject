<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminActivity.aspx.cs" Inherits="Back_End_Office_AdminActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
   Администрационен Панел
    <br />
    Контакти в:
    <asp:HyperLink ID="leisureLink" runat="server" />
  </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="ActivityID" 
    AutoGenerateColumns="False" Width="100%" 
    onrowcancelingedit="grid_RowCancelingEdit" onrowediting="grid_RowEditing" onrowupdating="grid_RowUpdating" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Заглавие" SortExpression="Name" />
      <asp:TemplateField HeaderText="Описание" SortExpression="Description">
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'>
          </asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("Description") %>' Height="70px" Width="200px" />
        </EditItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Малка Снимка" SortExpression="Thumbnail">
        <EditItemTemplate>
          <asp:TextBox ID="thumbTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Thumbnail") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("Thumbnail") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Голяма Снимка" SortExpression="Image">
        <EditItemTemplate>
          <asp:TextBox ID="imageTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Image") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CheckboxField DataField="PromoLeisure" HeaderText="Leisure Promo" 
        SortExpression="PromoLeisure" />
      <asp:CheckboxField DataField="PromoFront" HeaderText="Category Promo" 
        SortExpression="PromoFront" />
         <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink 
            Runat="server" Text="Избери" 
            NavigateUrl='<%# "AdminActivityDetails.aspx?LeisureID=" + 
            Request.QueryString["LeisureID"] + "&amp;ActivityID=" + 
            Eval("ActivityID") %>'
            ID="HyperLink1">
          </asp:HyperLink>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CommandField ShowEditButton="True" CancelText="Прекъсни" DeleteText="Изтрий" EditText="Промени" InsertText="Вмъкни" SelectText="Избери" UpdateText="Обнови" />
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
  
</asp:Content>

