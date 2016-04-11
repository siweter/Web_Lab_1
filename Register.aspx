<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .edit {
            width: 100%;
        }
        .button {
            margin: 0px 10px 0px 10px;  
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 30%" align="center" border="1">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="ErrorLable" runat="server" Visible="False"></asp:Label><br />
                Вже є аккаунт? <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Авторизуйтеся</asp:HyperLink>&nbsp;на сайті.
            </td>
        </tr>
        <tr>
            <td style="width: 100px;">Логін</td>
            <td>
                <asp:TextBox ID="LoginEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Пароль</td>
            <td>
                <asp:TextBox ID="PassEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                І&#39;мя</td>
            <td>
                <asp:TextBox ID="NameEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                E-mail</td>
            <td>
                <asp:TextBox ID="MailEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Телефон</td>
            <td>
                <asp:TextBox ID="PhoneEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Skype</td>
            <td>
                <asp:TextBox ID="SkypeEdit" runat="server" class="edit"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" Text="Очистити" Width="90px" class="button" />
                <asp:Button ID="RegButton" runat="server" OnClick="Button1_Click" Text="Реєстрація" Width="90px" class="button" />
            </td>
        </tr>
    </table>
</asp:Content>

