<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .button {
        }
        .auto-style2 {
            width: 175px;
        }
        .auto-style3 {
            width: 269px;
        }
        .auto-style4 {
            width: 179px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table id="detailTable" align="center" border="1" class="auto-style1" style="width: 50%;" runat="server">
        <tr>
            <td class="auto-style3" colspan="2" style="text-align: center;">
                <strong>
                <asp:Label ID="TitleLabel" runat="server" Text="Заголовок"></asp:Label>
                    </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Тип оголошення</td>
            <td align="left">
                <asp:Label ID="TypeLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Рубрика
            </td>
            <td>
                <asp:Label ID="CategoryLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Стан
            </td>
            <td>
                <asp:Label ID="StateLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Опис
            </td>
            <td>
                <asp:Label ID="DescriptionLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Доставка та оплата </td>
            <td align="left" class="auto-style5">
                <asp:Label ID="DeliveryLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style2" style="text-align: center">
                <strong>Контактні дані
            </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Місто
            </td>
            <td>
                <asp:Label ID="CityLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Ім'я
            </td>
            <td>
                <asp:Label ID="NameLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                E-mail
            </td>
            <td>
                <asp:Label ID="MailLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Телефон
            </td>
            <td class="auto-style7">
                <asp:Label ID="PhoneLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Skype
            </td>
            <td>
                <asp:Label ID="SkypeLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="clearButton" runat="server" Text="Очистити" CssClass="button" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="sendButton" runat="server" Text="Розмістити" CssClass="button" />
            </td>
        </tr>
    </table>
</asp:Content>

