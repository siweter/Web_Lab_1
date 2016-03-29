using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sendButton_Click(object sender, EventArgs e)
    {
        adDBDataContext db = new adDBDataContext();

        ad adTable = new ad();

        adTable.category_id = CategoryDropList.SelectedIndex;
        adTable.city_id = int.Parse(CityDropList.SelectedValue);
        adTable.type_id = int.Parse(TypeRBList.SelectedValue);
        adTable.title = TitleTextBox.Text;
        adTable.state = StateDropList.SelectedValue;
        adTable.description = DescrTextBox.Text;
        adTable.name = NameTextBox.Text;
        adTable.mail = MailTextBox.Text;
        adTable.phone = PhoneTextBox.Text;
        adTable.skype = SkypeTextBox.Text;

        db.ad.InsertOnSubmit(adTable);
        db.SubmitChanges();
                  
                
        foreach (ListItem item in DeliveryCBList.Items)
        {
            if (item.Selected)
            {
                delivery deliveryTable = new delivery();
                deliveryTable.ad_id = adTable.ad_id;
                deliveryTable.delivery_type_id = int.Parse(item.Value);
                db.delivery.InsertOnSubmit(deliveryTable);
                db.SubmitChanges();
            }
            
        }

        int id = adTable.ad_id;

        
    }
}