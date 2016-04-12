<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adlist.aspx.cs" Inherits="adlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style1">
        <tr>
            <td style="text-align: center;"> 
                <asp:Label ID="CountLabel" runat="server">Оголошень на сайті</asp:Label> 
                <asp:Label ID="UserInfLabel" runat="server">Ви не авторизовані. Пройдіть</asp:Label>
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">авторизацію</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                Вам доступно:
                <asp:HyperLink ID="AddLink" runat="server" NavigateUrl="~/form.aspx">Додавання</asp:HyperLink>
                <asp:Label ID="PermissionsLabel" runat="server">нових оголошень.</asp:Label> 
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</asp:Content>

