<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 182px;
        }
        .auto-style4 {
        width: 136px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </h4>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">

                            <table class="auto-style1" style="width: 500px;">
                                <tr>
                                    <td class="auto-style4">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Имя пользователя</asp:Label>
                                    </td>
                                    <td class="auto-style3">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="Поле имени пользователя заполнять обязательно." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style4">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Пароль</asp:Label>
                                    </td>
                                    <td class="auto-style3">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Поле пароля заполнять обязательно." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td class="auto-style3">
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Запомнить меня</asp:Label>
                            <asp:Button runat="server" Text="Вход" CssClass="btn btn-default" OnClick="Unnamed5_Click" />
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
            </section>
        </div>
</asp:Content>

