using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detail : System.Web.UI.Page
{
    // Действие при загрузке страницы
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
            SkypeTextBox.Text = adQ.skype;
        }
    }

    public void PrintError(string message)
    {
        ErrorLabel.Visible = true;
        ErrorLabel.Text = message;
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        DeleteButton.Visible = false;
        EditButton.Visible = false;
        DeleteDialog.Visible = true;
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        DeleteDialog.Visible = false;
        DeleteButton.Visible = true;
        EditButton.Visible = true;
    }

    protected void ConfirmButton_Click(object sender, EventArgs e)
    {
        // Id объявления 
        int id = 0;
        PrintError("okay");
        // Eсли удалось получить значение Id
        if (Int32.TryParse(Request.QueryString["id"], out id))
        {

            adDBDataContext db = new adDBDataContext();

            var adQuery = from ad in db.ad
                          where ad.ad_id == id
                          //select new { title = ad.title, state = ad.state, description = ad.description, categoryId = ad.category_id, typeId = ad.type_id, townId = ad.city_id, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };
                          select ad;

            // Запрос к таблице с вариантами доставки
            var deliveryQuery = from delivery in db.delivery
                                where delivery.ad_id == id
                                select delivery;

            foreach (var variant in deliveryQuery)
            {
                db.delivery.DeleteOnSubmit(variant);
            }
            db.SubmitChanges();

            foreach (var ad in adQuery)
            {
                db.ad.DeleteOnSubmit(ad);
            }
            db.SubmitChanges();

            

            Response.Redirect("adlist.aspx");
        }
    }

    protected void sendButton_Click(object sender, EventArgs e)
    {
        // Id объявления 
        int id = 0;
        PrintError("okay");
        // Eсли удалось получить значение Id
        if (Int32.TryParse(Request.QueryString["id"], out id))
        {
            
            adDBDataContext db = new adDBDataContext();

            var adQuery = from ad in db.ad
                          where ad.ad_id == id
                          //select new { title = ad.title, state = ad.state, description = ad.description, categoryId = ad.category_id, typeId = ad.type_id, townId = ad.city_id, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };
                          select ad;

            // Запрос к таблице с вариантами доставки
            var deliveryQuery = from delivery in db.delivery
                                where delivery.ad_id == id
                                select delivery;

            var adQ = adQuery.FirstOrDefault();



            adQ.category_id = int.Parse(CategoryDropList.SelectedValue);
            adQ.city_id = int.Parse(CityDropList.SelectedValue);
            adQ.type_id = int.Parse(TypeRBList.SelectedValue);
            adQ.title = TitleTextBox.Text;
            adQ.state = StateDropList.SelectedValue;
            adQ.description = DescrTextBox.Text;
            adQ.name = NameTextBox.Text;
            adQ.mail = MailTextBox.Text;
            adQ.phone = PhoneTextBox.Text;
            adQ.skype = SkypeTextBox.Text;

            db.SubmitChanges();

            foreach (var variant in deliveryQuery)
            {
                db.delivery.DeleteOnSubmit(variant);
            }
            db.SubmitChanges();

            foreach (ListItem item in DeliveryCBList.Items)
            {
                if (item.Selected)
                {
                    delivery deliveryTable = new delivery();
                    deliveryTable.ad_id = adQ.ad_id;
                    deliveryTable.delivery_type_id = int.Parse(item.Value);
                    db.delivery.InsertOnSubmit(deliveryTable);
                    db.SubmitChanges();
                }

            }
            Response.Redirect("Detail.aspx?id=" + id);

        }
    }
}