<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            font-size: 16px;
            font-weight: bold;
        }
        .auto-style3 {
            width: 171px;
        }
        .auto-style4 {
            width: 171px;
            height: 25px;
        }
        .auto-style5 {
            height: 25px;
        }
        .auto-style6 {
            width: 171px;
            height: 27px;
        }
        .auto-style7 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="1" class="auto-style1">
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
                <asp:RadioButtonList ID="TypeRBList" runat="server" DataSourceID="TypeDataSource" DataTextField="type_name" DataValueField="type_id">
                    <asp:ListItem>Продаж</asp:ListItem>
                    <asp:ListItem>Обмiн</asp:ListItem>
                    <asp:ListItem>Вiдам даром</asp:ListItem>
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="TypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [type]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                Рубрика
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropList" runat="server" DataSourceID="CategoryDataSource" DataTextField="category_name" DataValueField="category_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
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
                <asp:CheckBoxList ID="DeliveryCBList" runat="server" DataSourceID="DeliveryDataSource" DataTextField="delivery_type_name" DataValueField="delivery_type_id">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="DeliveryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [delivery_type]"></asp:SqlDataSource>
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
                <asp:DropDownList ID="CityDropList" runat="server" DataSourceID="CityDataSource" DataTextField="city_name" DataValueField="city_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT [city_id], [city_name] FROM [city]"></asp:SqlDataSource>
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
            <td align="center"><asp:Button ID="sendButton" runat="server" Text="Розмістити" OnClick="sendButton_Click" /></td>
        </tr>
    </table>
</asp:Content>

