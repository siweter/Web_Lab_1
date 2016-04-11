using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Web_Lab_1;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Unnamed5_Click(object sender, EventArgs e)
    {

        bool authenticated = Membership.ValidateUser(UserName.Text, Password.Text);
        if (authenticated)
            FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);

           }  }