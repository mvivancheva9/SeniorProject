<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminIPonti.aspx.cs" Inherits="Back_End_Office_AdminIPonti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AboutPontiID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
        <table>
            <tr>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
            
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' />
                </td>
            </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
        <table>
   
        </InsertItemTemplate>
        <ItemTemplate>
      <table style="color:White">
      <tr>
                    <td>
                    
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
              
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' />
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
        DeleteCommand="DELETE FROM [AboutPonti] WHERE [AboutPontiID] = @AboutPontiID" 
        InsertCommand="INSERT INTO [AboutPonti] ([Description]) VALUES (@Description)" 
        SelectCommand="SELECT * FROM [AboutPonti]" 
        UpdateCommand="UPDATE [AboutPonti] SET [Description] = @Description WHERE [AboutPontiID] = @AboutPontiID">
        <DeleteParameters>
            <asp:Parameter Name="AboutPontiID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="AboutPontiID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Back-End Office/AdminBulaggi.aspx">Admin Bulaggi History</asp:HyperLink>
    &nbsp
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Back-End Office/AdminGianniConti.aspx">Admin Gianni Conti</asp:HyperLink>
    
</asp:Content>

