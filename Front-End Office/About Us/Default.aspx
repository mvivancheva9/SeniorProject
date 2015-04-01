<%@ Page Title="За Нас" Language="C#" MasterPageFile="~/Front-End Office/About Us/About.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Front_End_Office_About_Us_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
 <div id="about">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
        <EditItemTemplate>
        
        </EditItemTemplate>
   
        <InsertItemTemplate>
      
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <pre>
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' CssClass="abouttext" />
</pre>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    &nbsp</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
      </asp:ListView>
      </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Description] FROM [AboutUS]"></asp:SqlDataSource>
   
</asp:Content>

