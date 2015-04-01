<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminProducts.aspx.cs" Inherits="Back_End_Office_AdminProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
    Административен Панел
    <br />
    Продукти в:
    <asp:HyperLink ID="catLink" runat="server" />
  </span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="ProductID" 
    AutoGenerateColumns="False" Width="1000px" 
    onrowcancelingedit="grid_RowCancelingEdit" onrowediting="grid_RowEditing" 
    onrowupdating="grid_RowUpdating" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:ImageField DataImageUrlField="Thumbnail" 
        DataImageUrlFormatString="~/ProductImages/{0}" HeaderText="Снимка" 
        ReadOnly="True" ControlStyle-Width="75px" ControlStyle-Height="100px" ItemStyle-Height="110px" ItemStyle-Width="75px">
<ControlStyle Height="100px" Width="75px"></ControlStyle>

<ItemStyle Height="110px" Width="75px"></ItemStyle>
      </asp:ImageField>
      <asp:TemplateField HeaderText="Име" SortExpression="Name">
        <EditItemTemplate>
          <asp:TextBox ID="nameTextBox" runat="server" Width="97%" 
                       CssClass="GridEditingRow" Text='<%# Bind("Product_Name") %>'>
          </asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Описание" 
        SortExpression="Description">
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" 
             Text='<%# Bind("Product_Characteristics") %>' Height="100px" Width="97%"
             CssClass="GridEditingRow" TextMode="MultiLine" />
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product_Characteristics") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Цена" SortExpression="Price">
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" 
               Text='<%# String.Format("{0:0.00}", Eval("Price")) %>'>
          </asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox ID="priceTextBox" runat="server" Width="45px" 
                 Text='<%# String.Format("{0:0.00}", Eval("Price")) %>'>
          </asp:TextBox>
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
      <asp:CheckboxField DataField="PromoBrand" HeaderText="Компания Промо" 
        SortExpression="PromoBrand" />
      <asp:CheckboxField DataField="PromoFront" HeaderText="Категория Промо" 
        SortExpression="PromoFront" />
      <asp:TemplateField>
        <ItemTemplate>
          <asp:HyperLink 
            Runat="server" Text="Избери" 
            NavigateUrl='<%# "AdminProductDetails.aspx?BrandID=" + 
            Request.QueryString["BrandID"] + "&amp;CategoryID=" + 
            Request.QueryString["CategoryID"] + "&amp;ProductID=" + 
            Eval("ProductID") %>'
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

  <table>
  <tr>
  <td>&nbsp</td>
  <th>Създай нов продукт към тази категория:</th>
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
  <th>Цена:</th>
  <td><asp:TextBox ID="newPrice" runat="server" Width="400px">0.00</asp:TextBox></td>
 </tr>
  <tr>
  <th>Малка Снимка:</th>
  <td><asp:TextBox ID="newThumbnail" runat="server" Width="400px">1.jpg</asp:TextBox></td>
  </tr>
  <tr>
  <th>Голяма Снимка:</th>
  <td><asp:TextBox ID="newImage" runat="server" Width="400px">1.jpg</asp:TextBox></td>
  </tr>
  <tr>
  <th>Компания Промо</th>
  <td><asp:CheckBox ID="newPromoBrand" runat="server" /></td>
  </tr>
  <tr>
  <th>Начално Промо</th>
  <td> <asp:CheckBox ID="newPromoFront" runat="server" /></td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button ID="createProduct" runat="server" Text="Създай Продукт" 
    onclick="createProduct_Click" /></td>
  </tr>
  </table>
</asp:Content>


