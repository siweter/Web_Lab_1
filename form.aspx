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
        .auto-style8 {
            width: 125px;
        }
        .auto-style9 {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="FormTable" align="center" border="1" class="FormTable" runat="server">
        <tr>
            <td colspan="2" class="auto-style2">
                <asp:Label ID="AddLabel" runat="server"></asp:Label>
                <asp:HiddenField ID="LangField" runat="server" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="TitleLabel" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TitleTextBox" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="TypeLabel" runat="server"></asp:Label>
            </td>
            <td align="left">
                <asp:RadioButtonList ID="TypeRBList" runat="server" DataSourceID="TypeDataSource" DataTextField="type_name" DataValueField="type_id">
                    <asp:ListItem>Продаж</asp:ListItem>
                    <asp:ListItem>Обмiн</asp:ListItem>
                    <asp:ListItem>Вiдам даром</asp:ListItem>
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="TypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [type] WHERE ([locale] = @locale)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LangField" Name="locale" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;<asp:Label ID="RybrLabel" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="CategoryDropList" runat="server" DataSourceID="CategoryDataSource" DataTextField="category_name" DataValueField="category_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [category] WHERE ([locale] = @locale)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LangField" DefaultValue="ua" Name="locale" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;<asp:Label ID="StateLabel" runat="server"></asp:Label>
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
                &nbsp;<asp:Label ID="DescrLabel" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DescrTextBox" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;<asp:Label ID="DeliveryLabel" runat="server"></asp:Label>
            </td>
            <td align="left" class="auto-style5">
                <asp:CheckBoxList ID="DeliveryCBList" runat="server" DataSourceID="DeliveryDataSource" DataTextField="delivery_type_name" DataValueField="delivery_type_id">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="DeliveryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT * FROM [delivery_type] WHERE ([locale] = @locale)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LangField" DefaultValue="ua" Name="locale" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style2">
                <asp:Label ID="ContactsLabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="CityLabel" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="CityDropList" runat="server" DataSourceID="CityDataSource" DataTextField="city_name" DataValueField="city_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ASPNETServicesConnectionString %>" SelectCommand="SELECT [city_id], [city_name] FROM [city] WHERE ([locale] = @locale)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LangField" Name="locale" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="NameLabel" runat="server"></asp:Label>
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
                <asp:Label ID="PhoneLabel" runat="server"></asp:Label>
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
            <td align="center" class="auto-style3">&nbsp;</td>
            <td align="center"><asp:Button ID="sendButton" runat="server" OnClick="sendButton_Click" /></td>
        </tr>
    </table>

    <table id="LinksTable" align="center" class="FormTable" runat="server" visible="False">
        <tr>
            <td style="color: #10721d; text-align: center;" colspan="2" class="auto-style9"><strong>
                <asp:Label ID="SuccessLabel" runat="server" Text="Label"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="2" ><strong>
                <asp:Label ID="UCanLabel" runat="server" Text="Label"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td style="text-align: center;" class="auto-style8" >
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="ViewLink" runat="server">[ViewLink]</asp:HyperLink><br />
                <asp:HyperLink ID="ListLink" runat="server" NavigateUrl="~/adlist.aspx" >[ListLink]</asp:HyperLink><br />
                <asp:HyperLink ID="AddLink" runat="server" NavigateUrl="~/form.aspx">[AddLink]</asp:HyperLink>
            </td>
        </tr>
    </table>

</asp:Content>

