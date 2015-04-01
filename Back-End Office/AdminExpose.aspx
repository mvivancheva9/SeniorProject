<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminExpose.aspx.cs" Inherits="Back_End_Office_AdminExpose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
    Администрационен Панел - Новини
    <br />
    Новини в:
    <asp:HyperLink ID="newLink" runat="server" />
  </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="ExposeID" 
    AutoGenerateColumns="False" Width="1000px" 
    onrowcancelingedit="grid_RowCancelingEdit" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Име" SortExpression="Name" />
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
         
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("Thumbnail") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Голяма Снимка" SortExpression="Image">
        <EditItemTemplate>
          
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CheckboxField DataField="PromoNew" HeaderText="Начално Промо" 
        SortExpression="PromoNew" />
      <asp:CheckboxField DataField="PromoFrontNew" HeaderText="Категория Промо" 
        SortExpression="PromoFrontNew" />
       
      <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink 
            Runat="server" Text="Избери" 
            NavigateUrl='<%# "AdminExposeDetails.aspx?NewID=" + 
            Request.QueryString["NewID"] + "&amp;ExposeID=" + 
            Eval("ExposeID") %>'
            ID="HyperLink1">
          </asp:HyperLink>
        </ItemTemplate>
      </asp:TemplateField>
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
  <th>Създайте нова новина към тази категория:</th>
  </tr>
  <tr>
  <th>Име:</th>
  <td><asp:TextBox ID="newName" runat="server" Width="400px" /></td>
 </tr>
  <tr>
  <th>Описание:</th>
  <td><asp:TextBox 
       ID="newDescription" 
       runat="server" 
       Width="400px"
       Height="70px" 
       TextMode="MultiLine" /></td>
  </tr>
  <tr>
  <th>Малка Снимка:</th>
      
  <td><asp:TextBox ID="newThumbnail" runat="server" Width="400px"></asp:TextBox></td>
  </tr>
  <tr>
  <th>Голяма Снимка:</th>
  <td><asp:TextBox ID="newImage" runat="server" Width="400px">1.jpg</asp:TextBox></td>
   </tr>
  <tr>
  <th>Категория Промо</th>
  <td><asp:CheckBox ID="newPromoNew" runat="server" /></td>
  </tr>
  <tr>
  <th>Начално Промо</th>
  <td> <asp:CheckBox ID="newPromoFrontNew" runat="server" /></td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button ID="createProduct" runat="server" Text="Създай Новина" 
    onclick="createExpose_Click" /></td>
  </tr>
  </table>
</asp:Content>

