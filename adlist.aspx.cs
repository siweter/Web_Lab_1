using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        adDBDataContext db = new adDBDataContext();

        var adQuery = from ad in db.ad
                      join category in db.category on ad.category_id equals category.category_id
                      join type in db.type on ad.type_id equals type.type_id
                      join town in db.city on ad.city_id equals town.city_id 
                      select new { title = ad.title, state = ad.state, category = category.category_name, type = type.type_name, town = town.city_name, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };

        var deliveryQuery = from delivery in db.delivery
                            join deliveryType in db.delivery_type on delivery.delivery_type_id equals deliveryType.delivery_type_id
                            select new { id = delivery.ad_id, typeName = deliveryType.delivery_type_name };

        string[] headers = { "Назва", "Стан", "Категорія", "Тип оголошення", "Місто", "Доставка", "Ім'я", "E-mail", "Телефон", "Skype" };

        CountLabel.Text = "Оголошень на сайті: " + adQuery.Count();

        Table adList = new Table();
        adList.ID = "adList";
        adList.Attributes.Add("border", "1");

        TableRow header = new TableRow();
        for (int i = 0; i <= 5; i++)
        {
            TableCell cell = new TableCell();
            cell.Attributes.Add("rowspan", "2");
            cell.Text = headers[i];
            header.Controls.Add(cell);
        }
        TableCell contacts = new TableCell();
        contacts.Text = "Контакти";
        contacts.HorizontalAlign = HorizontalAlign.Center;
        contacts.Attributes.Add("colspan", "4");
        header.Controls.Add(contacts);
        TableCell linkHeader = new TableCell();
        linkHeader.Attributes.Add("rowspan", "2");
        linkHeader.Text = "Детальніше";
        header.Controls.Add(linkHeader);
        adList.Controls.Add(header);

        TableRow header2 = new TableRow();
        for (int i = 6; i < headers.Length; i++)
        {
            TableCell cell = new TableCell();
            cell.Text = headers[i];
            header2.Controls.Add(cell);
        }
        adList.Controls.Add(header2);

        foreach (var item in adQuery)
        {
            TableRow row = new TableRow();
            foreach (var it in item.GetType().GetProperties())
            {
                if (it.Name == "id")
                {
                    TableCell deliveryCell = new TableCell();
                    //deliveryCell.Text = it.GetValue(item).ToString();
                    //row.Controls.Add(deliveryCell);

                    foreach (var i in deliveryQuery)
                    {
                       if (i.id == item.id)
                        {
                            deliveryCell.Text += i.typeName + "<br>";
                        }
                    }
                    row.Controls.Add(deliveryCell);
                    continue;
                }

                TableCell cell = new TableCell();
                cell.Text = it.GetValue(item).ToString();
                row.Controls.Add(cell);
            }

            TableCell linkCell = new TableCell();
            HyperLink link = new HyperLink();
            link.Text = "Перейти";
            //link.NavigateUrl = "../Detail.aspx?id={0}", item.id;
            link.NavigateUrl = "../Detail.aspx?id=" + item.id;
            linkCell.Controls.Add(link);
            row.Controls.Add(linkCell);

            adList.Controls.Add(row);
        }

        //PlaceHolder PlaceHolder1 = new PlaceHolder();
        PlaceHolder1.Controls.Add(adList);
        






    }
}