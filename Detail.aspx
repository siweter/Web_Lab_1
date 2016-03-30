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
        .auto-style5 {
            width: 241px;
        }
        .auto-style6 {
            width: 183px;
        }
        .auto-style7 {
            width: 270px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 50%; text-align: center; margin: 0 auto;"><strong><asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Visible="False"></asp:Label></strong></div>
    <!--Detailed table-->
   <table id="detailTable" align="center" border="1" class="auto-style1" style="width: 50%;" runat="server" visible="False">
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
                <asp:Button ID="EditButton" runat="server" Text="Редагувати" CssClass="button" OnClick="EditButton_Click" Width="90px" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="DeleteButton" runat="server" Text="Видалити" CssClass="button" OnClick="DeleteButton_Click" Width="90px" />
                
                <table id="DeleteDialog" class="auto-style1" runat="server" visible="False">
                    <tr>
                        <td colspan="2" style="color: #960B0B; text-align: center;"><strong>Ви дійсно бажаєте видалити це оголошення?</strong></td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right: 10px; width: 50%;">
                            <asp:Button ID="ConfirmButton" runat="server" Text="Так" Width="60px" OnClick="ConfirmButton_Click" />
                        </td>
                        <td align="left" style="padding-left: 10px;">
                            <asp:Button ID="CancelButton" runat="server" Text="Ні" Width="60px" OnClick="CancelButton_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>


    <!--EditFormTable-->
    <table ID="EditFormTable" visible="false" align="center" border="1" class="auto-style1" style="width: 50%;" runat="server">
        <tr>
            <td colspan="2" class="auto-style2" style="text-align: center;">
                <strong>Редагування оголошення</strong></td>
        </tr>
        <tr>
            <td class="auto-style6">
                Заголовок
            </td>
            <td>
                <asp:TextBox ID="TitleTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Тип оголошення</td>
            <td align="left">
                <asp:RadioButtonList ID="TypeRBList" runat="server" DataTextField="type_name" DataValueField="type_id">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Рубрика
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropList" runat="server" DataTextField="category_name" DataValueField="category_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
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
            <td class="auto-style6">
                Опис
            </td>
            <td>
                <asp:TextBox ID="DescrTextBox" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Доставка та оплата </td>
            <td align="left" class="auto-style5">
                <asp:CheckBoxList ID="DeliveryCBList" runat="server" DataTextField="delivery_type_name" DataValueField="delivery_type_id">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style2" style="text-align: center;">
                <strong>Контактні дані
            </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Місто
            </td>
            <td>
                <asp:DropDownList ID="CityDropList" runat="server" DataTextField="city_name" DataValueField="city_id">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                Ім'я
            </td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
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
            <td class="auto-style6">
                Skype
            </td>
            <td>
                <asp:TextBox ID="SkypeTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="auto-style6"><asp:Button ID="clearButton" runat="server" Text="Очистити" /></td>
            <td align="center"><asp:Button ID="sendButton" runat="server" Text="Зберегти" OnClick="sendButton_Click" /></td>
        </tr>
    </table>


</asp:Content>

