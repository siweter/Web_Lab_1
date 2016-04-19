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
    <table align="center" id="authTable" class="notAuthTable" runat="server">
        <tr>
            <td>
                <asp:Label ID="AuthLabel" runat="server" Text=""></asp:Label>
                <asp:HyperLink ID="AuthLink" runat="server" NavigateUrl="~/Login.aspx">Авторизація</asp:HyperLink>
            </td>
        </tr>
    </table><br />
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder><br />
    <asp:PlaceHolder ID="ButtonsHolder" runat="server"></asp:PlaceHolder>
</asp:Content>

