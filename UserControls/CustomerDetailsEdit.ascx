<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerDetailsEdit.ascx.cs" Inherits="UserControls_CustomersDetailsEditascx" %>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProfileWrapper"
  SelectMethod="GetData" TypeName="ProfileDataSource" UpdateMethod="UpdateData">
</asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
  
    SelectCommand="SELECT [ShippingRegionID], [ShippingRegion] FROM [ShippingRegion]" />
<asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">
<EditItemTemplate>
      <table class="UserDetailsTable">
      <tr>
        <td>
          Address line 1:
        </td>
        <td width="350px">
          <asp:TextBox Width="340px" ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Address line 2:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' />
        </td>
      </tr>
      <tr>
        <td>
          City:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Region:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Zip / Postal Code:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Country:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Shipping Region:
        </td>
        <td>
          <asp:DropDownList Width="350px" ID="ShippingRegionDropDown" runat="server" SelectedValue='<%# Bind("ShippingRegion") %>'
            DataSourceID="SqlDataSource1" DataTextField="ShippingRegion" DataValueField="ShippingRegionID">
          </asp:DropDownList>
        </td>
      </tr>
      
      <tr>
        <td>
          Mobile Phone no:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="MobPhoneTextBox" runat="server" Text='<%# Bind("MobPhone") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Email:
        </td>
        <td>
          <asp:TextBox Width="340px" ID="EmailBox" runat="server" Text='<%# Bind("Email") %>' />
        </td>
      </tr>
      <tr>
        <td>
          <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Update" />&nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False"
              CommandName="Cancel" Text="Cancel" />
        </td>
      </tr>
    </table>
    </EditItemTemplate>
  <ItemTemplate>
    <table class="UserDetailsTable">
      <tr>
        <td>
          Address line 1:
        </td>
        <td width="350px">
          <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Address line 2:
        </td>
        <td>
          <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' />
        </td>
      </tr>
      <tr>
        <td>
          City:
        </td>
        <td>
          <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Region:
        </td>
        <td>
          <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Zip / Postal Code:
        </td>
        <td>
          <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>'>
          </asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          Country:
        </td>
        <td>
          <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Shipping Region:
        </td>
        <td>
          <asp:DropDownList Width="350px" ID="ShippingRegionDropDown" runat="server" SelectedValue='<%# Bind("ShippingRegion") %>'
            DataSourceID="SqlDataSource1" DataTextField="ShippingRegion" DataValueField="ShippingRegionID"
            Enabled="false">
          </asp:DropDownList>
        </td>
      </tr>
      
      <tr>
        <td>
          Mobile Phone no:
        </td>
        <td>
          <asp:Label ID="MobPhoneLabel" runat="server" Text='<%# Bind("MobPhone") %>' />
        </td>
      </tr>
      <tr>
        <td>
          Email:
        </td>
        <td>
          <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
        </td>
      </tr>
      
      <tr>
        <td>
          <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit" />
        </td>
      </tr>
    </table>
  </ItemTemplate>
</asp:FormView>
