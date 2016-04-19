using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using languages;

public partial class adlist : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["language"];

        if (cookie != null)
        {
            //fillLabels(cookie.Value);
        }
        else
        {
            //fillLabels("ua");
        }


        bool online = false;
        // Получить текущего пользователя
        MembershipUser user = Membership.GetUser();

        
        // Если пользователь получен... 
        if (user != null)
        {
            // ...и авторизирован
            if (user.IsOnline)
            {
                online = true;
                authTable.Attributes.Add("class", "authTable");
                if (cookie != null)
                {
                    AuthLabel.Text = Locales.langList[cookie.Value]["userLabel"];
                }
                else
                {
                    AuthLabel.Text = Locales.langList["ua"]["userLabel"];
                }
                AuthLink.Text = user.UserName;
                //Вывести приветствие
                //Скрыть ссылку авторизации
                //Написать все доступные права
                //UserInfLabel.Text = "Вітаємо, <a href=\"login.aspx\">" +  + "</a>";
                //LoginLink.Visible = false;
                //PermissionsLabel.Text = ", редагування та видалення оголошень.";
            }
        }
        else
        {
            if (cookie != null)
            {
                AuthLabel.Text = Locales.langList[cookie.Value]["notAuthLabel"];
            }
            else
            {
                AuthLabel.Text = Locales.langList["ua"]["notAuthLabel"];
            }
        }

        adDBDataContext db = new adDBDataContext();

        // Получение списка объявлений
        var adQuery = from ad in db.ad
                       join category in db.category on ad.category_id equals category.category_id
                       join type in db.type on ad.type_id equals type.type_id
                       join town in db.city on ad.city_id equals town.city_id
                       select new { title = ad.title, state = ad.state, category = category.category_name, type = type.type_name, town = town.city_name, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype };

        // Получение вариантов доставки для объявлений
        var deliveryQuery = from delivery in db.delivery
                            join deliveryType in db.delivery_type on delivery.delivery_type_id equals deliveryType.delivery_type_id
                            select new { id = delivery.ad_id, typeName = deliveryType.delivery_type_name };

        // Кол-во полученных записей
        // Кол-во страниц
        int elements = adQuery.Count();
        int pages = 0;

        // Вычисление кол-ва страниц
        if (elements > 10)
        {
            if (elements % 10 == 0)
            {
                pages = elements / 10;
            }
            else
            {
                pages = elements / 10 + 1;
            }

            // Кнопки-номера страниц
            Table pageButtonsTable = new Table();
            pageButtonsTable.Attributes.Add("align", "center");
            pageButtonsTable.Attributes.Add("id", "pageBT");
            TableRow pageRow = new TableRow();

            for (int i = 1; i <= pages; i++)
            {
                TableCell pageCell = new TableCell();
                LinkButton pageButton = new LinkButton();
                pageButton.Text = i.ToString();
                pageButton.PostBackUrl = "~/adlist.aspx?page=" + i;
                pageCell.Controls.Add(pageButton);
                pageRow.Controls.Add(pageCell);
            }
            pageButtonsTable.Controls.Add(pageRow);
            ButtonsHolder.Controls.Add(pageButtonsTable);
        }


        if (Request.QueryString.Count > 0 && Request.QueryString.AllKeys.Contains("page"))
        {
            // Номер страницы 
            int page = 0;

            // Eсли удалось получить номер страницы
            if (Int32.TryParse(Request.QueryString["page"], out page))
            {
                buildTable(page, online);
            }
            else
            {
                buildTable(1, online);
            }
        }
        else
        {
            buildTable(1, online);
        }
    }


    public void buildTable(int page, bool online)
    {
        adDBDataContext db = new adDBDataContext();

        // Получение списка объявлений
        var adQuery = (from ad in db.ad
                      join category in db.category on ad.category_id equals category.category_id
                      join type in db.type on ad.type_id equals type.type_id
                      join town in db.city on ad.city_id equals town.city_id
                      select new { title = ad.title, state = ad.state, category = category.category_name, type = type.type_name, town = town.city_name, id = ad.ad_id, name = ad.name, mail = ad.mail, phone = ad.phone, skype = ad.skype, user_id = ad.user_id}).Skip((page - 1)*10).Take(10);

        // Получение вариантов доставки для объявлений
        var deliveryQuery = from delivery in db.delivery
                            join deliveryType in db.delivery_type on delivery.delivery_type_id equals deliveryType.delivery_type_id
                            select new { id = delivery.ad_id, typeName = deliveryType.delivery_type_name };

        // Названия заголовков таблицы
        string[] headers = { "Назва", "Стан", "Категорія", "Тип", "Місто", "Доставка", "Ім'я", "E-mail", "Телефон", "Skype" };


        // Создание таблицы объявлений
        // Присваивание ID и втрибутов
        Table adList = new Table();
        adList.Attributes.Add("id", "adList");
        adList.Attributes.Add("border", "0");
        adList.Attributes.Add("align", "center");
        adList.Attributes.Add("cellspacing", "0");

        // Создание шапки таблицы
        TableRow header = new TableRow();
        for (int i = 0; i < headers.Length; i++)
        {
            // Заполнение ее заголовками
            TableHeaderCell cell = new TableHeaderCell();
            cell.Text = headers[i];
            header.Controls.Add(cell);
        }

        // Если пользователь авторизован
        if (online == true)
        {
            // Добавить заголовок "Видалення" 
            TableHeaderCell deleteCell = new TableHeaderCell();
            deleteCell.Text = "Видалення";
            header.Controls.Add(deleteCell);

        }
        adList.Controls.Add(header);



        foreach (var item in adQuery)
        {
            TableRow row = new TableRow();
            if (online && item.user_id.Equals(Membership.GetUser().ProviderUserKey))
            {
                row.Attributes.Add("class", "userRow");
            }
            else
            {
                row.Attributes.Add("class", "Row");
            }

            foreach (var it in item.GetType().GetProperties())
            {
                if (it.Name == "user_id")
                {
                    continue;
                }
                // Заполнение названия объявления
                if (it.Name == "title")
                {
                    // Ячейка с заголовком
                    TableCell titleCell = new TableCell();


                    // Если заголовок длиннее 20 символов
                    string title = it.GetValue(item).ToString();
                    if (title.Length > 15)
                    {
                        // Обрезать строку до 17 символов
                        // Добавить троеточие
                        title.Remove(11, title.Length - 11);
                        title += "...";
                    }

                    // Ссылка на объявление
                    HyperLink adLink = new HyperLink();
                    adLink.Text = title;
                    adLink.NavigateUrl = "../Detail.aspx?id=" + item.id;
                    titleCell.Controls.Add(adLink);
                    row.Controls.Add(titleCell);
                }

                else if (it.Name == "id")
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
                else
                {
                    TableCell cell = new TableCell();
                    cell.Text = it.GetValue(item).ToString();
                    row.Controls.Add(cell);
                }


            }

            // Если пользователь онлайн
            if (online)
            {
                // Добавить кнопки удаления
                TableCell linkCell = new TableCell();
                if (online && item.user_id.Equals(Membership.GetUser().ProviderUserKey))
                {
                    string button = "<input id=\"Button1\" type=\"button\" value=\"Видалити\" onclick=\"openDelWindow(" + item.id + ")\" />";
                    linkCell.Text = button;
                }
                else
                {
                    linkCell.Text = "Недоступно";
                }
                row.Controls.Add(linkCell);
            }


            adList.Controls.Add(row);
        }

        //PlaceHolder PlaceHolder1 = new PlaceHolder();
        PlaceHolder1.Controls.Add(adList);
    }
}



