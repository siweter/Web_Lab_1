using System.Collections.Generic;

namespace languages // поправишь
{
    public class Locales
    {
        public static Dictionary<string, Dictionary<string, string>> langList = new Dictionary<string, Dictionary<string, string>>()
        {
            {
                "ua", new Dictionary<string, string>()
                {
                    // Список объявлений
                    { "notAuthLabel", "Для редагування та видалення своїх оголошень необхідно авторизуватися на сайті: " },
                    { "authLabel", "Вітаємо вас на сайті! Ви авторизовані як " },
                    { "adlistPageTitle", "Список оголошень" },


                    // Страница авторизации
                    { "LoginLabel", "Логін" },
                    { "PassLabel", "Пароль" },
                    { "loginButton", "Вхід" },

                    { "userLabel", "Вітаємо вас на сайті! Ви авторизовані як " },
                    { "mainLink", "1. Перейти на головну" },
                    { "addLink", "2. Додати нове оголошення" },
                    { "langLink", "3. Змінити мову на англійську" },
                    { "logoutLink", "4. Вийти з аккаунту" },


                    // Форма ввода
                    { "AddLabel", "Подати оголошення" },
                    { "TitleLabel", "Заголовок" },
                    { "TypeLabel", "Тип оголошення" },
                    { "RybrLabel", "Категорія" },
                    { "StateLabel", "Стан" },
                    { "DescrLabel", "Опис" },
                    { "DeliveryLabel", "Доставка та оплата" },
                    { "ContactsLabel", "Контактні дані" },
                    { "CityLabel", "Місто" },
                    { "NameLabel", "Ім'я" },
                    { "PhoneLabel", "Телефон" },
                    { "sendButton", "Додати" },
                    { "SuccessLabel", "Вітаємо! Ваше оголошення успішно розміщено!" },
                    { "UCanLabel", "Ви можете: " },
                    { "ViewLink", "1. Подивитися це оголошення" },
                    { "ListLink", "2. Подивитися список оголошень" },
                    { "AddLink", "3. Додати нове оголошення" }
                }
            },
            {
                "en", new Dictionary<string, string>()
                {
                    // Список объявлений
                    { "notAuthLabel", "To edit and delete your ads need to login: " },
                    { "authLabel", "Welcome to the website! You are logged in as " },
                    { "adlistPageTitle", "List of ads" },


                    // Страница авторизации
                    { "LoginLabel", "Login" },
                    { "PassLabel", "Password" },
                    { "loginButton", "Enter" },

                    { "userLabel", "Welcome to the website! You are logged in as " },
                    { "mainLink", "1. Go to Home page" },
                    { "addLink", "2. Add new ad" },
                    { "langLink", "3. Change to Ukrainian" },
                    { "logoutLink", "4. Logout" },


                    // Форма ввода
                    { "AddLabel", "Post your ad" },
                    { "TitleLabel", "Title" },
                    { "TypeLabel", "Ad Type" },
                    { "RybrLabel", "Category" },
                    { "StateLabel", "State" },
                    { "DescrLabel", "Description" },
                    { "DeliveryLabel", "Delivery and payment" },
                    { "ContactsLabel", "Contacts" },
                    { "CityLabel", "City" },
                    { "NameLabel", "Name" },
                    { "PhoneLabel", "Phone" },
                    { "sendButton", "Add" },
                    { "SuccessLabel", "Congratulations! Your ad placed successfully!" },
                    { "UCanLabel", "Now you can: " },
                    { "ViewLink", "1. View this ad" },
                    { "ListLink", "2. See list of ads" },
                    { "AddLink", "3. Add new ad" }
                }
            }
        };
    }
}

