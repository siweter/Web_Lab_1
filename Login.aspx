<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Авторизация на сайте</title>
    <style type="text/css">
        .edit {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="UserTable" align="center" border="1" runat="server" visible="false">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="UserLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; padding-left: 10px;">
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/adlist.aspx">1. Перейти на головну</asp:HyperLink><br />
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/form.aspx">2. Додати нове оголошення</asp:HyperLink><br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">3. Вийти з аккаунту</asp:LinkButton>
            </td>
        </tr>
    </table>
    <table id="LoginTable" style="width: 350px;" align="center" border="1" runat="server" visible="false">
        <tr>
            <td style="width: 130px">
                Имя пользователя
            </td>
            <td>
                <asp:TextBox runat="server" ID="UserName" CssClass="edit" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="Поле имени пользователя заполнять обязательно." Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Пароль
            </td>
            <td>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="edit" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Поле пароля заполнять обязательно." Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style4" colspan="2">
                <asp:Button runat="server" Text="Вход" OnClick="LoginButton_Click" Width="100px" />
            </td>
        </tr>
    </table>
</asp:Content>

