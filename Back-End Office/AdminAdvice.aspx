<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminAdvice.aspx.cs" Inherits="Back_End_Office_AdminAdvice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
  <span class="AdminTitle">
    VivaBags Admin
    Advice in 
    <asp:HyperLink ID="fashionLink" runat="server" />
  </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
  <p>
    <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
  </p>
  <asp:GridView ID="grid" runat="server" DataKeyNames="AdviceID" 
    AutoGenerateColumns="False" Width="100%" 
    onrowcancelingedit="grid_RowCancelingEdit" onrowdeleting="grid_RowDeleting" 
    onrowediting="grid_RowEditing" onrowupdating="grid_RowUpdating" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
      <AlternatingRowStyle BackColor="White" />
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
      <asp:TemplateField HeaderText="Description" SortExpression="Description">
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'>
          </asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
          <asp:TextBox ID="descriptionTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("Description") %>' Height="70px" Width="200px" />
        </EditItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Thumb File" SortExpression="Thumbnail">
        <EditItemTemplate>
          <asp:TextBox ID="thumbTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Thumbnail") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("Thumbnail") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Image File" SortExpression="Image">
        <EditItemTemplate>
          <asp:TextBox ID="imageTextBox" Width="80px" runat="server" 
                   Text='<%# Bind("Image") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:CheckboxField DataField="PromoFashion" HeaderText="Fashion Promo" 
        SortExpression="PromoFashion" />
      <asp:CheckboxField DataField="PromoFront" HeaderText="Category Promo" 
        SortExpression="PromoFront" />
        
      <asp:CommandField ShowEditButton="True" />
      <asp:ButtonField CommandName="Delete" Text="Delete" />
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
  <th>Create a new advice and assign it to this fashion:</th>
  </tr>
  <tr>
  <th>Name:</th>
  <td><asp:TextBox ID="newName" runat="server" Width="400px" /></td>
   </tr>
  <tr>
  <th>Description:</th>
  <td><asp:TextBox 
       ID="newDescription" 
       runat="server" 
       Width="400px"
       Height="70px" 
       TextMode="MultiLine" /></td>
  </tr>
  <tr>
  <th>Thumbnail file:</th>
  <td><asp:TextBox ID="newThumbnail" runat="server" Width="400px">1.jpg</asp:TextBox></td>
 </tr>
  <tr>
  <th>Image file:</th>
  <td><asp:TextBox ID="newImage" runat="server" Width="400px">1.jpg</asp:TextBox></td>
  </tr>
  <tr>
  <th>Fashion Promo</th>
  <td><asp:CheckBox ID="newPromoFashion" runat="server" /></td>
  </tr>
  <tr>
  <th>Front Promo</th>
  <td> <asp:CheckBox ID="newPromoFront" runat="server" /></td>
  </tr>
  <tr>
  <td>&nbsp</td>
  <td><asp:Button ID="createAdvice" runat="server" Text="Create Advice" 
    onclick="createAdvice_Click" /></td>
  </tr>
  </table>
</asp:Content>

