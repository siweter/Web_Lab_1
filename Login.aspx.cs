using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Security;
using languages;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie cookie = Request.Cookies["language"];

        if (cookie != null)
        {
            fillLabels(cookie.Value);
        }
        else
        {
            fillLabels("ua");
        }

        

        bool online = false;
        MembershipUser user = Membership.GetUser();

        if (user != null)
        {
            LoginTable.Visible = false;
            UserTable.Visible = true;

            UserLabel.Text += user.UserName;
        }
        else
        {
            UserTable.Visible = false;
            LoginTable.Visible = true;
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        bool authenticated = Membership.ValidateUser(UserName.Text, Password.Text);
        if (authenticated)
        {
            FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
        }    
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect(FormsAuthentication.LoginUrl);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["language"];

        if (cookie != null)
        {
            if (cookie.Value == "en")
            {
                cookie.Value = "ua";
                Response.Cookies.Add(cookie);
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                cookie.Value = "en";
                Response.Cookies.Add(cookie);
                Response.Redirect("~/Login.aspx");
            }
        }
        else
        {
            HttpCookie language = new HttpCookie("language");
            language.Value = "en";
            language.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(language);
            Response.Redirect("~/Login.aspx");
        }    
    }

    public void fillLabels(string lang)
    {
        LoginLabel.Text = Locales.langList[lang]["LoginLabel"];
        PassLabel.Text = Locales.langList[lang]["PassLabel"];
        LoginButton.Text = Locales.langList[lang]["loginButton"];

        MainLink.Text = Locales.langList[lang]["mainLink"];
        AddLink.Text = Locales.langList[lang]["addLink"];
        LangLink.Text = Locales.langList[lang]["langLink"];
        LogoutLink.Text = Locales.langList[lang]["logoutLink"];

        UserLabel.Text = Locales.langList[lang]["userLabel"];
    }
}