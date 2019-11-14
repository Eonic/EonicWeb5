using System;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;
using System.Collections.ObjectModel;

namespace Protean.Tools
{
    public static class WebDriverExtensions
    {
        public static IWebElement FindElement(this IWebDriver driver, By by, int timeoutInSeconds)
        {
            if (timeoutInSeconds > 0)
            {
                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(timeoutInSeconds));
                return wait.Until(drv => drv.FindElement(by));
            }
            return driver.FindElement(by);
        }

        public static ReadOnlyCollection<IWebElement> FindElements(this IWebDriver driver, By by, int timeoutInSeconds)
        {
            if (timeoutInSeconds > 0)
            {
                var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(timeoutInSeconds));
                return wait.Until(drv => (drv.FindElements(by).Count > 0) ? drv.FindElements(by) : null);
            }
            return driver.FindElements(by);
        }

        public static void TakeScreenshot(this IWebDriver driver, string folderPath, string fileName)
        {
            ITakesScreenshot screenshotDriver = driver as ITakesScreenshot;
            Screenshot screenshot = screenshotDriver.GetScreenshot();
            screenshot.SaveAsFile($"{folderPath}{fileName}.png", ScreenshotImageFormat.Png);
        }

        public static void TakeScreenshot(this IWebDriver driver, string folderPath, 
            string fileName, ScreenshotImageFormat imageFormat)
        {
            ITakesScreenshot screenshotDriver = driver as ITakesScreenshot;
            Screenshot screenshot = screenshotDriver.GetScreenshot();
            screenshot.SaveAsFile($"{folderPath}{fileName}.{imageFormat.ToString()}", imageFormat);
        }

        public static IAlert WaitGetAlert(this IWebDriver driver, int waitTimeInSeconds = 5)
        {
            IAlert alert = null;

            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(waitTimeInSeconds));

            try
            {
                alert = wait.Until(d =>
                {
                    try
                    {
                        // Attempt to switch to an alert
                        return driver.SwitchTo().Alert();
                    }
                    catch (NoAlertPresentException)
                    {
                        // Alert not present yet
                        return null;
                    }
                });
            }
            catch (WebDriverTimeoutException) { alert = null; }

            return alert;
        }

        public static bool IsAlertPresent(this IWebDriver driver, out string alertText)
        {
            alertText = string.Empty;
            try
            {
                var alert = driver.SwitchTo().Alert();
                alertText = alert.Text;
                return true;
            }
            catch (NoAlertPresentException ex)
            {
                return false;
            }
        }
    }
}
