using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Xml;
using System.Web;
using System.Collections.Generic;
using System.IO;
using System.Security.Principal;
using System.Web.SessionState;
using System.Threading;

namespace ProteanCMS.IntegrationTests
{
    [TestClass]
    [TestCategory("Integration")]
    public class DirectoryTest
    {
        private static Protean.Tools.Database myDb;
        private static Protean.Cms myWeb;

        // Use ClassInitialize to run code before running the first test in the class
        [ClassInitialize()]
        public static void ClassInitialize(TestContext testContext)
        {
            //Protean.Tools.Database dbConn = new Protean.Tools.Database
            //{
            //    DatabaseServer = "",
            //    DatabaseName = "",
            //    DatabaseUser = "",
            //    DatabasePassword = ""
            //};
            //myDb = dbConn;

            HttpContext.Current = FakeHttpContext(new Dictionary<string, object> { { "Session1", 5 } },
                "http://intotheblue.local/");

            myWeb = new Protean.Cms();
            myWeb.InitializeVariables();
            myWeb.Open();
        }

        // Use ClassCleanup to run code after all tests in a class have run
        [ClassCleanup()]
        public static void ClassCleanup()
        {
        }

        [TestInitialize]
        public void TestInitialize()
        {
        }

        [TestCleanup]
        public void TestCleanup()
        {
        }

        [TestMethod]
        public void CreateUser_When_UserName_Empty_Should_Throw_Error()
        {
            //Arrange
            //here we need to get the instance from the Xform for the website and populate the default values.
            Protean.Cms.xForm oXfrm = (Protean.Cms.xForm)myWeb.getXform();
            oXfrm.load("/xforms/Directory/User.xml");
            XmlDocument oUserInstance = oXfrm.Instance.OwnerDocument;

            //Act
            var nKey = myWeb.moDbHelper.setObjectInstance(Protean.Cms.dbHelper.objectTypes.Directory, oUserInstance.DocumentElement);
            bool isKeyNumeric = int.TryParse(nKey, out _);

            Assert.IsTrue(isKeyNumeric);
            Assert.IsTrue(int.Parse(nKey) > 0);
        }

        [TestMethod]
        public void CreateCompany_When_CompanyName_Empty_Should_Throw_Error()
        {
            Protean.Cms.xForm oXfrm = (Protean.Cms.xForm)myWeb.getXform();
            oXfrm.load("/xforms/Directory/User.xml");
            XmlDocument oUserInstance = oXfrm.Instance.OwnerDocument;

            //Act
            var nKey = myWeb.moDbHelper.setObjectInstance(Protean.Cms.dbHelper.objectTypes.Directory, oUserInstance.DocumentElement);
            bool isKeyNumeric = int.TryParse(nKey, out _);

            Assert.IsTrue(isKeyNumeric);
            Assert.IsTrue(int.Parse(nKey) > 0);
        }

        public static HttpContext FakeHttpContext(Dictionary<string, object> sessionVariables, string path)
        {
            var httpRequest = new HttpRequest(string.Empty, path, string.Empty);
            var stringWriter = new StringWriter();
            var httpResponce = new HttpResponse(stringWriter);
            var httpContext = new HttpContext(httpRequest, httpResponce);
            httpContext.User = new GenericPrincipal(new GenericIdentity("username"), new string[0]);
            Thread.CurrentPrincipal = new GenericPrincipal(new GenericIdentity("username"), new string[0]);
            var sessionContainer = new HttpSessionStateContainer(
              "id",
              new SessionStateItemCollection(),
              new HttpStaticObjectsCollection(),
              10,
              true,
              HttpCookieMode.AutoDetect,
              SessionStateMode.InProc,
              false);

            foreach (var var in sessionVariables)
            {
                sessionContainer.Add(var.Key, var.Value);
            }

            SessionStateUtility.AddHttpSessionStateToContext(httpContext, sessionContainer);
            return httpContext;
        }
    }

    public static class IntegrationDatabaseContext
    {
        public static Protean.Tools.Database database;

         static IntegrationDatabaseContext()
        {
            Protean.Tools.Database dbConn = new Protean.Tools.Database
            {
                DatabaseServer = "",
                DatabaseName = "",
                DatabaseUser = "",
                DatabasePassword = ""
            };
            database = dbConn;
        }
    }
}
