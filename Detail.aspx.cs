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
        // Если в строке запроса есть параметры
        if (Request.QueryString.Count > 0 && Request.QueryString.AllKeys.Contains("id"))
        {
            int id = Int32.Parse(Request.QueryString["id"]);

            // Отобразить таблицу с объявлением
            detailTable.Visible = true;

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

            foreach (var item in deliveryQuery)
            {
                DeliveryLabel.Text += item.typeName + "<br>";
            }
        }
        else
        {
            ErorLabel.Visible = true;
            ErorLabel.Text = "Оголошення не знайдене!";
        }

    }

    // Событие при клике на кнопку редактирования
    protected void EditButton_Click(object sender, EventArgs e)
    {
        // Скрытие объявления и показ таблицы редактирования
        detailTable.Visible = false;
        EditFormTable.Visible = true;

        adDBDataContext db = new adDBDataContext();

        // Запросы к информационным таблицам
        var typeQuery = from type in db.type
                        select type;

        var categoryQuery = from category in db.category
                            select category;

        var townQuery = from town in db.city
                        select town;

        var deliveryTypeQuery = from deliveryType in db.delivery_type
                                select deliveryType;

        // Привязка данных к выпадающим спискам и кнопкам
        TypeRBList.DataSource = typeQuery;
        TypeRBList.DataBind();

        CategoryDropList.DataSource = categoryQuery;
        CategoryDropList.DataBind();

        DeliveryCBList.DataSource = deliveryTypeQuery;
        DeliveryCBList.DataBind();

        CityDropList.DataSource = townQuery;
        CityDropList.DataBind();

        // Проверка на наличие параметров в строкее запроса
        if (Request.QueryString.Count > 0)
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            //Int32.TryParse("ee");

            // Запрос к основной таблице
            //var adQuery = from ad in db.ad
            //              join category in db.category on ad.category_id equals category.category_id
            //              join type in db.type on ad.type_id equals type.type_id
            //              join town in db.city on ad.city_id equals town.city_id
            //              where ad.ad_id == id
            //              select new { title = ad.title, state = ad.state, description = ad.description, categoryId = category.category_id, typeId = type.type_id, townId = town.city_id, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };

            var adQuery = from ad in db.ad
                          where ad.ad_id == id
                          //select new { title = ad.title, state = ad.state, description = ad.description, categoryId = ad.category_id, typeId = ad.type_id, townId = ad.city_id, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };
                          select ad;

            // Запрос к таблице с вариантами доставки
            var deliveryQuery = from delivery in db.delivery
                                where delivery.ad_id == id
                                select delivery;

            // Заполнение полей данными из БД
            var adQ = adQuery.FirstOrDefault();

            // Заголовок объвления 
            // Тип 
            // Рубрика
            // Состояние
            // Описание 
            // Доставка и оплата
            TitleTextBox.Text = adQ.title;
            TypeRBList.SelectedValue = adQ.type_id.ToString();
            CategoryDropList.SelectedValue = adQ.category_id.ToString();
            StateDropList.SelectedValue = adQ.state;
            DescrTextBox.Text = adQ.description;

            // Заполнение списка чекбоксов
            foreach (ListItem item in DeliveryCBList.Items)
            {
                foreach (var variant in deliveryQuery)
                {
                    if (item.Value == variant.delivery_type_id.ToString())
                        item.Selected = true;
                }
            }
            
            // Город
            // Телефон
            // e-mail
            // Телефон
            CityDropList.SelectedValue = adQ.city_id.ToString();
            NameTextBox.Text = adQ.name;
            MailTextBox.Text = adQ.mail;
            PhoneTextBox.Text = adQ.phone;
        }
    }
}