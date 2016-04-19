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
                    { "logoutLink", "4. Вийти з аккаунту" }
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
                    { "logoutLink", "4. Logout" }
                }
            }
        };
    }
}

