using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Security;
using Web_Lab_1;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MembershipCreateStatus createStatus;
        Membership.CreateUser(LoginEdit.Text, PassEdit.Text, MailEdit.Text, null, null, true, out createStatus);

        if (createStatus == MembershipCreateStatus.Success)
        {
            adDBDataContext db = new adDBDataContext();

            user userTable = new user();
        }
        else
        {
            ErrorLable.Visible = true;
            ErrorLable.Text = createStatus.ToString();
        }

        

    }
}