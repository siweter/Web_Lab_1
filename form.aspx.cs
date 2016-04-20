using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using languages;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["language"];
        

        if (cookie != null)
        {
            LangField.Value = cookie.Value;
            fillLabels(cookie.Value);
        }
        else
        {
            LangField.Value = "ua";
            fillLabels("ua");
        }
    }
   
    protected void sendButton_Click(object sender, EventArgs e)
    {
        adDBDataContext db = new adDBDataContext();

        ad adTable = new ad();

        adTable.category_id = int.Parse(CategoryDropList.SelectedValue);
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

        FormTable.Visible = false;
        LinksTable.Visible = true;

        ViewLink.NavigateUrl = "Detail.aspx?id=" + id;
    }


    public void fillLabels(string lang)
    {
        AddLabel.Text = Locales.langList[lang]["AddLabel"];

        TitleLabel.Text = Locales.langList[lang]["TitleLabel"];
        TypeLabel.Text = Locales.langList[lang]["TypeLabel"];
        RybrLabel.Text = Locales.langList[lang]["RybrLabel"];
        StateLabel.Text = Locales.langList[lang]["StateLabel"];
        DescrLabel.Text = Locales.langList[lang]["DescrLabel"];
        DeliveryLabel.Text = Locales.langList[lang]["DeliveryLabel"];

        ContactsLabel.Text = Locales.langList[lang]["ContactsLabel"];

        CityLabel.Text = Locales.langList[lang]["CityLabel"];
        NameLabel.Text = Locales.langList[lang]["NameLabel"];
        PhoneLabel.Text = Locales.langList[lang]["PhoneLabel"];

        sendButton.Text = Locales.langList[lang]["sendButton"];

        SuccessLabel.Text = Locales.langList[lang]["SuccessLabel"];
        UCanLabel.Text = Locales.langList[lang]["UCanLabel"];

        ViewLink.Text = Locales.langList[lang]["ViewLink"];
        ListLink.Text = Locales.langList[lang]["ListLink"];
        AddLink.Text = Locales.langList[lang]["AddLink"];
    }
}