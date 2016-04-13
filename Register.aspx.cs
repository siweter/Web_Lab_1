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

        MembershipUser newUser = Membership.CreateUser(LoginEdit.Text, PassEdit.Text, MailEdit.Text, null, null, true, out createStatus);

        if (createStatus == MembershipCreateStatus.Success)
        {
            adDBDataContext db = new adDBDataContext();

            user userTable = new user();
            userTable.user_id = Guid.Parse(newUser.ProviderUserKey.ToString());
            userTable.mail = MailEdit.Text;

            db.user.InsertOnSubmit(userTable);
            db.SubmitChanges();

            var adQuery = from ad in db.ad
                          select ad;

            foreach (ad item in adQuery)
            {
                if (item.mail == MailEdit.Text)
                {
                    item.user_id = Guid.Parse(newUser.ProviderUserKey.ToString());
                    db.SubmitChanges();
                }
            }

            AuthInfoTable.Visible = true;
            AuthInfoLabel.Text = "Реєстрація пройшла успішно. Ви можете:";
        }
        else
        {
            ErrorLable.Visible = true;
            ErrorLable.Text = createStatus.ToString();
        }
        

    }
}