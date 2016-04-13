using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Если в строке запроса есть параметры
        if (Request.QueryString.Count > 0 && Request.QueryString.AllKeys.Contains("id"))
        {
            // Id объявления 
            int id = 0;

            // Eсли удалось получить значение Id
            if (Int32.TryParse(Request.QueryString["id"], out id))
            {
                adDBDataContext db = new adDBDataContext();

                // Получение данных объявления
                var adQuery = from ad in db.ad
                              join category in db.category on ad.category_id equals category.category_id
                              join type in db.type on ad.type_id equals type.type_id
                              join town in db.city on ad.city_id equals town.city_id
                              where ad.ad_id == id
                              select new { title = ad.title, state = ad.state, description = ad.description, category = category.category_name, type = type.type_name, town = town.city_name, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };

                // Если результат выполнения запроса не пустой
                if (adQuery.Count() > 0)
                {
                    // Отобразить таблицу с объявлением
                    detailTable.Visible = true;

                    // Запрос к таблице с вариантами оставки
                    var deliveryQuery = from delivery in db.delivery
                                        join deliveryType in db.delivery_type on delivery.delivery_type_id equals deliveryType.delivery_type_id
                                        where delivery.ad_id == id
                                        select new { id = delivery.ad_id, typeName = deliveryType.delivery_type_name };

                    // Заполнение таблицы данными об объявлении
                    var t = adQuery.FirstOrDefault();
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

                    // Задать заголовок страницы
                    Page.Title = t.title;

                    DeliveryLabel.Text = "";

                    foreach (var item in deliveryQuery)
                    {
                        DeliveryLabel.Text += item.typeName + "<br>";
                    }
                }
                // Если запрос ничего не вернул
                else
                {
                    PrintError("Объявление не найдено!");
                }
            }
            // Если не уалось получить значение Id объявления
            else
            {
                PrintError("Неверный номер объявления!");
            }
        }
        // Если в строке запроса нет номера объявления
        else
        {
            PrintError("Не найден номер объявления!");
        }
    }

    public void PrintError(string message)
    {
        ErrorLabel.Visible = true;
        ErrorLabel.Text = message;
    }
}
