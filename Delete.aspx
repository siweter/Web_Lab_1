<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        window.onload = function () {
            var table = document.getElementById("detailTable");
            alert(table.width + "  " + table.height);
            window.resizeTo(table);
            window.opener.location.reload();
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="detailTable" border="1" class="auto-style1" style="width: 50%;" runat="server" visible="False">
        <tr>
            <td class="auto-style3" colspan="2" style="text-align: center;">
                <strong><asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Visible="False"></asp:Label></strong>
            </td>
        </tr>
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
            <td align="center" colspan="2">
                
                <table id="DeleteDialog" class="auto-style1" runat="server">
                    <tr>
                        <td colspan="2" style="color: #960B0B; text-align: center;"><strong>Ви дійсно бажаєте видалити це оголошення?</strong></td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right: 10px; width: 50%;">
                            <input style="width: 60px" id="YesButton" type="button" value="Так" onclick="buttonClick()" /></td>
                        <td align="left" style="padding-left: 10px;">
                            <input style="width: 60px" id="NoButton" type="button" value="Ні" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
