<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adlist.aspx.cs" Inherits="adlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        function openDelWindow(id)
        {
            var url = "Delete.aspx?id=" + id;
            var params = "menubar=no,location=no,resizable=yes,scrollbars=no,status=yes, width=400, height=500";
            var delWindow = window.open(url, "_blank", params, true);
            delWindow.focus();
        }
        function reloadPage()
        {
            location.reload();
        }
    </script>

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
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br />
    <asp:PlaceHolder ID="ButtonsHolder" runat="server"></asp:PlaceHolder>
    <br />
</asp:Content>

