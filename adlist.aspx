<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adlist.aspx.cs" Inherits="adlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <div style="text-align: center; margin: 0 auto;">
            <asp:Label ID="CountLabel" runat="server"></asp:Label>&nbsp;&nbsp; Ви можете:
            <asp:HyperLink ID="AddLink" runat="server" NavigateUrl="~/form.aspx">Додати нове оголошення.</asp:HyperLink><br />
        </div>
    </asp:PlaceHolder>
    </asp:Content>

