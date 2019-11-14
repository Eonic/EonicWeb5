using System.Configuration;
using OpenQA.Selenium.Chrome;

namespace ProteanCMS.UITests
{
    public class UITestBase
    {
        public static readonly string baseUrl = ConfigurationManager.AppSettings["BaseUrl"];
        public static readonly string schreenShotsFolderPath = ConfigurationManager.AppSettings["SchreenShotsFolderPath"];
        public static readonly string proteanUser = ConfigurationManager.AppSettings["ProteanUser"];
        public static readonly string proteanPassword = ConfigurationManager.AppSettings["ProteanPassword"];
        public static readonly string adminUrl = $"{baseUrl}?ewCmd=admin";

        public static ChromeDriver driver;

        public static void LogonAsAdmin()
        {
            driver.Navigate().GoToUrl(adminUrl);
            driver.Manage().Window.Maximize();

            //Login to Admin
            driver.FindElementById("cUserName").SendKeys(proteanUser);
            driver.FindElementById("cPassword").SendKeys(proteanPassword);
            driver.FindElementByName("ewSubmit").Click();
        }
    }
}
