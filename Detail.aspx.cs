using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Page.PreviousPage.)
        if (Request.QueryString.Count > 0)
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            
            adDBDataContext db = new adDBDataContext();

            var adQuery = from ad in db.ad
                          join category in db.category on ad.category_id equals category.category_id
                          join type in db.type on ad.type_id equals type.type_id
                          join town in db.city on ad.city_id equals town.city_id
                          where ad.ad_id == id
                              select new { title = ad.title, state = ad.state, description = ad.description, category = category.category_name, type = type.type_name, town = town.city_name, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };

            var deliveryQuery = from delivery in db.delivery
                                join deliveryType in db.delivery_type on delivery.delivery_type_id equals deliveryType.delivery_type_id
                                where delivery.ad_id == id
                                select new { id = delivery.ad_id, typeName = deliveryType.delivery_type_name };

            var t = adQuery.First();
            TitleLabel.Text = t.title;
            TypeLabel.Text = t.type;
            CategoryLabel.Text = t.category;
            StateLabel.Text = t.state;
            DescriptionLabel.Text = t.description;
            CityLabel.Text = t.town;
            NameLabel.Text = t.name;
            MailLabel.Text = t.mail;
            PhoneLabel.Text = t.phone;
            SkypeLabel.Text = t.skype;

            foreach (var item in deliveryQuery)
            {
                DeliveryLabel.Text += item.typeName + "<br>";
            }

            //adQuery.GetType().GetProperties().GetValue(0).ToString();
            //TitleLabel.Text = arr.GetValue(0, 0).ToString();


        }

    }
}