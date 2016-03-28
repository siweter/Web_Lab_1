﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

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
    <!--Detailed table-->
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
                <asp:Button ID="EditButton" runat="server" Text="Редагувати" CssClass="button" OnClick="EditButton_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="DeleteButton" runat="server" Text="Видалити" CssClass="button" />
            </td>
        </tr>
    </table>


    <!--EditFormTable-->
    <table ID="EditFormTable" visible="false" align="center" border="1" class="auto-style1" style="width: 50%;" runat="server">
        <tr>
            <td colspan="2" class="auto-style2">
                Подати оголошення</td>
        </tr>
        <tr>
            <td class="auto-style3">
                Заголовок
            </td>
            <td>
                <asp:TextBox ID="TitleTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Тип оголошення</td>
            <td align="left">
                <asp:RadioButtonList ID="TypeRBList" runat="server">
                    <asp:ListItem>Продаж</asp:ListItem>
                    <asp:ListItem>Обмiн</asp:ListItem>
                    <asp:ListItem>Вiдам даром</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Рубрика
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropList" runat="server" DataTextField="category_name" DataValueField="category_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Стан
            </td>
            <td>
                <asp:DropDownList ID="StateDropList" runat="server">
                    <asp:ListItem>Новий</asp:ListItem>
                    <asp:ListItem>Б/y</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Опис
            </td>
            <td>
                <asp:TextBox ID="DescrTextBox" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Доставка та оплата </td>
            <td align="left" class="auto-style5">
                <asp:CheckBoxList ID="DeliveryCBList" runat="server" DataTextField="delivery_type_name" DataValueField="delivery_type_id">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style2">
                Контактні дані
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Місто
            </td>
            <td>
                <asp:DropDownList ID="CityDropList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Ім'я
            </td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                E-mail
            </td>
            <td>
                <asp:TextBox ID="MailTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Телефон
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="PhoneTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Skype
            </td>
            <td>
                <asp:TextBox ID="SkypeTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="auto-style3"><asp:Button ID="clearButton" runat="server" Text="Очистити" /></td>
            <td align="center"><asp:Button ID="sendButton" runat="server" Text="Розмістити" /></td>
        </tr>
    </table>


</asp:Content>

