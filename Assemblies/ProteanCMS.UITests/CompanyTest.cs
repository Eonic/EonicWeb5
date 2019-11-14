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
    public class CompanyTest : UITestBase
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
        //[Ignore]
        public void ListCompanies_Should_Show_Companies()
        {
            try
            {
                //Arrange
                string requestUrl = $"{baseUrl}?ewCmd=ListCompanies";

                //Act                
                driver.Navigate().GoToUrl(requestUrl);

                //Assert
                var titleLabel = driver.FindElement(By.ClassName("panel-title"), 10);
                Assert.IsTrue(driver.Title.Contains("Membership"), "Verified membership screen");
                Assert.IsTrue(titleLabel.Text.Contains("List Companies"));
            }
            catch (Exception ex)
            {
                driver.TakeScreenshot(schreenShotsFolderPath, "ListCompanies_Should_Show_Companies");
                throw ex;
            }
        }

        [TestMethod]
        public void CreateCompany_When_CompanyName_Empty_Should_Show_Alert()
        {
            string requestUrl = $"{baseUrl}?ewCmd=EditDirItem&DirType=Company";

            try
            {
                //Arrange
                driver.Navigate().GoToUrl(requestUrl);

                //Act
                driver.FindElementById("cDirName").SendKeys(string.Empty);
                driver.FindElementByName("ewSubmit").Click();

                //Assert
                Assert.IsTrue(driver.IsAlertPresent(out string alertText));
                Assert.IsTrue(alertText.Contains($"You have not entered any information in the field : Company Name"));
            }
            catch (Exception ex)
            {
                driver.TakeScreenshot(schreenShotsFolderPath, "CreateCompany_When_CompanyName_Empty");
                throw ex;
            }
        }
    }
}
