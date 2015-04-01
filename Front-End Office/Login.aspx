<%@ Page Title="" Language="C#" MasterPageFile="~/Front-End Office/FrontEnd.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Front_End_Office_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="about">
    <asp:Panel ID="searchPanel" runat="server" DefaultButton="loginControl$LoginButton">
      <asp:Login ID="loginControl" runat="server" FailureText="Вход неуспешен.Моля, опитайте отново." LoginButtonText="Вход" PasswordLabelText="Парола:" RememberMeText="Запомни ме следващия път" TitleText="Вход" UserNameLabelText="Потребителско име:">
          <LayoutTemplate>
              <table border="0" cellpadding="1" cellspacing="0" 
                  style="border-collapse:collapse; color:black; font-size:larger">
                  <tr>
                      <td>
                          <table border="0" cellpadding="0">
                              <tr>
                                  <td align="center" colspan="2">
                                      Вход</td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Потребителско име:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                          ControlToValidate="UserName" ErrorMessage="Потребителското име е задължително." 
                                          ToolTip="Потребителското име е задължително." ValidationGroup="loginControl">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right">
                                      <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Парола:</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                          ControlToValidate="Password" ErrorMessage="Паролата е задължителна." 
                                          ToolTip="Паролата е задължителна." ValidationGroup="loginControl">*</asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2">
                                      <asp:CheckBox ID="RememberMe" runat="server" Text="Запомни ме следващия път." />
                                  </td>
                              </tr>
                              <tr>
                                  <td align="center" colspan="2" style="color:Red;">
                                      <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                  </td>
                              </tr>
                              <tr>
                                  <td align="right" colspan="2">
                                      <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Вход" 
                                          ValidationGroup="loginControl" />
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </table>
          </LayoutTemplate>
      </asp:Login>
    </asp:Panel> 
    </div> 
</asp:Content>


