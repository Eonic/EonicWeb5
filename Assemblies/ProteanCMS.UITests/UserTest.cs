using System;
using System.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Protean.Tools;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium;

namespace ProteanCMS.UITests
{
    [TestClass]
    [TestCategory("UITest")]
    public class UserTest : UITestBase
    {
        [ClassInitialize()]
        public static void ClassInitialize(TestContext testContext)
        {
            var chromeOptions = new ChromeOptions();
            //chromeOptions.AddArguments("headless");
            driver = new ChromeDriver(chromeOptions);

            LogonAsAdmin();
        }

        [ClassCleanup()]
        public static void ClassCleanup()
        {
            driver.Quit();
        }

        [TestMethod]
        public void Verify_Admin_Mode_Entered()
        {
            try
            {
                //Arrange

                //Act
                driver.Navigate().GoToUrl(adminUrl);

                //Assert
                var wait = new WebDriverWait(driver, new TimeSpan(0, 0, 5));
                wait.Until(wt => wt.FindElement(By.Id("adminLayout")));
                //Assert.IsTrue(driver.Title.Contains("Dashboard"), "Verified admin login");
            }
            catch (Exception ex)
            {
                driver.TakeScreenshot(schreenShotsFolderPath, "Verify_Admin_Login");
                throw ex;
            }
        }

        [TestMethod]
        public void ListUsers_Should_Show_User()
        {
            try
            {
                //Arrange
                string requestUrl = $"{baseUrl}?ewCmd=ListUsers";

                //Act                
                driver.Navigate().GoToUrl(requestUrl);

                //Assert
                var titleLabel = driver.FindElement(By.ClassName("panel-title"), 10);
                Assert.IsTrue(driver.Title.Contains("Membership"), "Verified membership screen");
                Assert.IsTrue(titleLabel.Text.Contains("List Users"));
            }
            catch (Exception ex)
            {
                driver.TakeScreenshot(schreenShotsFolderPath, "ListUsers_Should_Show_User");
                throw ex;
            }
        }

        [TestMethod]
        public void CreateUser_When_Email_Address_Empty_Should_Show_Alert()
        {
            string requestUrl = $"{baseUrl}?ewCmd=EditDirItem&DirType=User";

            try
            {
                //Arrange
                driver.Navigate().GoToUrl(requestUrl);

                //Act
                driver.FindElementById("cEmail").SendKeys(string.Empty);
                driver.FindElementByName("ewSubmit").Click();

                //Assert
                Assert.IsTrue(driver.IsAlertPresent(out string alertText));
                Assert.IsTrue(alertText.Contains("You have not entered any information in the field : Email Address"));
            }
            catch (Exception ex)
            {
                driver.TakeScreenshot(schreenShotsFolderPath, "CreateCompany_When_CompanyName_Empty");
                throw ex;
            }
        }
    }
}
