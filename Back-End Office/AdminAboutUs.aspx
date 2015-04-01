<%@ Page Title="За Нас - Настройки" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminAboutUs.aspx.cs" Inherits="Back_End_Office_AdminAboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AboutUsID" 
        DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        
        <EditItemTemplate>
        <table style=" margin-left:50px;">
            <tr>
                
            
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="700" Height="400" Font-Size="Large"/>
                </td>
            </tr>
            <tr>
            <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Обнови" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Прекъсни" />
                </td>
            </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
        <table>
   
        </InsertItemTemplate>
        <ItemTemplate>
      <table style="color:black; margin-left:100px;">
      <tr>
                    
              
                <td>
                    <pre>
                    <asp:Label ID="DescriptionLabel" runat="server" Width="600px" 
                        Text='<%# Eval("Description") %>' Font-Bold="true" />
                        </pre>
                </td>
            </tr>
          <tr>
              <td>
                    
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Промени" />
                </td>
          </tr>
            </table>
        </ItemTemplate>
        <LayoutTemplate>
     <ul class="ItemContainer">
     <li id="itemPlaceholder" runat="server" />
     </ul>

        </LayoutTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [AboutUS] WHERE [AboutUsID] = @AboutUsID" 
        InsertCommand="INSERT INTO [AboutUS] ([Description]) VALUES (@Description)" 
        SelectCommand="SELECT * FROM [AboutUS]" 
        UpdateCommand="UPDATE [AboutUS] SET [Description] = @Description WHERE [AboutUsID] = @AboutUsID">
        <DeleteParameters>
            <asp:Parameter Name="AboutUsID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="AboutUsID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

