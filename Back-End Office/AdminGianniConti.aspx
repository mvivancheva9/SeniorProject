<%@ Page Title="" Language="C#" MasterPageFile="~/Back-End Office/BackEnd.master" AutoEventWireup="true" CodeFile="AdminGianniConti.aspx.cs" Inherits="Back_End_Office_AdminGianniConti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AboutGCID" 
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
        DeleteCommand="DELETE FROM [AboutGC] WHERE [AboutGCID] = @AboutGCID" 
        InsertCommand="INSERT INTO [AboutGC] ([Description]) VALUES (@Description)" 
        SelectCommand="SELECT * FROM [AboutGC]" 
        UpdateCommand="UPDATE [AboutGC] SET [Description] = @Description WHERE [AboutGCID] = @AboutGCID">
        <DeleteParameters>
            <asp:Parameter Name="AboutGCID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="AboutGCID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Back-End Office/AdminBulaggi.aspx">Admin Bulaggi History</asp:HyperLink>
    &nbsp
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Back-End Office/AdminIPonti.aspx">Admin IPonti</asp:HyperLink>

</asp:Content>

