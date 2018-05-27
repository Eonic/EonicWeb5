﻿Imports System
Imports System.Web
Imports System.Xml
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.HttpUtility
Imports System.Web.Configuration
Imports Microsoft.VisualBasic
Imports System.Net
Imports System.IO
Imports Eonic.stdTools

<WebService(Namespace:="http://www.eonic.co.uk/ewcommon/Services")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class Services
    Inherits System.Web.Services.WebService
#Region "Declarations"
    Public moCtx As System.Web.HttpContext = System.Web.HttpContext.Current
    Public moApp As System.Web.HttpApplicationState = moCtx.Application
    Public moRequest As System.Web.HttpRequest = moCtx.Request
    Public moResponse As System.Web.HttpResponse = moCtx.Response
    Public moSession As System.Web.SessionState.HttpSessionState = moCtx.Session
    Public moServer As System.Web.HttpServerUtility = moCtx.Server
    Dim WithEvents oFTP As Eonic.Tools.FTPClient
    Dim oRXML As XmlDocument
    Dim bResult As Boolean = True
    Dim oResponseElmt As XmlElement
    Private mcModuleName As String = "Eonic.services"
    Private myWeb As Eonic.Web
#End Region
#Region "Non Web Methods"

    Sub CreateResponse()
        Try
            oRXML = New XmlDocument
            oResponseElmt = oRXML.CreateElement("Response")
            oRXML.AppendChild(oResponseElmt)
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        End Try
    End Sub

    Sub AddResponse(ByVal cMessage As String)
        Try
            Dim oElmt As XmlElement = oRXML.CreateElement("ResponseMessage")
            If cMessage.StartsWith("<") Then
                oElmt.InnerXml = cMessage
            Else

                oElmt.InnerText = cMessage
            End If
            oResponseElmt.AppendChild(oElmt)
        Catch ex As System.Exception
            bResult = False
            'Do nothing
        End Try
    End Sub

    Function CheckUserIP() As Boolean
        Try
            Dim moConfig As System.Collections.Specialized.NameValueCollection = WebConfigurationManager.GetWebApplicationSection("eonic/web")
            Dim SoapIps As String = moConfig("SoapIps") & ",127.0.0.1,::1,"
            Dim cIP As String = moRequest.UserHostAddress
            If SoapIps.Contains(cIP & ",") Then
                Return True
            Else
                AddResponse("Invalid Host: " & moRequest.UserHostAddress)
                Return False
            End If
        Catch ex As System.Exception
            AddResponse(ex.ToString)
            Return False
        End Try
    End Function

    Private Sub OnError(ByVal sender As Object, ByVal e As Eonic.Tools.Errors.ErrorEventArgs) Handles oFTP.OnError
        AddResponse(e.ToString)

        ' Try to generate an Eonic Error
        returnException(e.ModuleName, e.ProcedureName, e.Exception, , e.AddtionalInformation, gbDebug, "Services: ")
    End Sub


#End Region
#Region "Web Methods"

    <WebMethod(Description:="Sends Email From Website xForm")> _
    Public Function emailer(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientEmail As String, ByRef SubjectLine As String, ByVal ccRecipient As String, ByVal bccRecipient As String, ByVal cSeperator As String) As Object

        Dim sMessage As String

        Dim cProcessInfo As String = "emailer"
        Try

            Dim oMsg As Eonic.Messaging = New Eonic.Messaging

            sMessage = oMsg.emailer(oBodyXML, xsltPath, fromName, fromEmail, recipientEmail, SubjectLine, , , , ccRecipient, bccRecipient, cSeperator)

            Return sMessage

        Catch ex As System.Exception
            Return ex.Message & " - " & ex.GetBaseException.Message
        End Try

    End Function

    <WebMethod(Description:="Sends Email From Website xForm")> _
    Public Function emailerXMLAttach(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientEmail As String, ByRef SubjectLine As String, ByVal ccRecipient As String, ByVal bccRecipient As String, ByVal cSeperator As String, ByVal attachmentFromXSLPath As String, ByVal attachmentFromXSLType As String, ByVal attachmentName As String) As Object

        Dim sMessage As String

        Dim cProcessInfo As String = "emailerXMLAttach"
        Try
            Dim oMsg As Eonic.Messaging = New Eonic.Messaging

            sMessage = oMsg.emailerWithXmlAttachment(oBodyXML, xsltPath, fromName, fromEmail, recipientEmail, SubjectLine, attachmentFromXSLPath, attachmentFromXSLType, attachmentName, , , , ccRecipient, bccRecipient, cSeperator)


            Return sMessage

        Catch ex As System.Exception
            Return ex.Message & " - " & ex.GetBaseException.Message
        End Try

    End Function

    <WebMethod(Description:="Sends Email To Multiple Recipients")> _
    Public Function multiEmailer(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientIds As String, ByRef SubjectLine As String) As Object

        Dim sMessage As String

        Dim cProcessInfo As String = "multiEmailer"
        Try

            Dim oMsg As Eonic.Messaging = New Eonic.Messaging

            sMessage = oMsg.emailerMultiUsers(oBodyXML, xsltPath, fromName, fromEmail, recipientIds, SubjectLine)

            Return sMessage

        Catch ex As Exception
            Return ex.Message & " - " & ex.GetBaseException.Message
        End Try

    End Function

    '    <WebMethod(Description:="Sends Email From Website xForm with Attachement")> _
    'Public Function emailerWithAttachment(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientEmail As String, ByRef SubjectLine As String, ByVal ccRecipient As String, ByVal bccRecipient As String, ByVal cSeperator As String, ByVal Attachment As String, ByVal AttachmentStream As String) As Object

    '        Dim sMessage As String

    '        Dim cProcessInfo As String = "emailer"
    '        Try

    '            Dim oMsg As Eonic.Messaging = New Eonic.Messaging
    '            Dim contentStream As System.IO.Stream = Nothing
    '            Dim encoding As System.Text.Encoding = System.Text.Encoding.UTF8
    '            Dim writer As New System.IO.StreamWriter(contentStream, encoding)
    '            writer.Write(AttachmentStream)

    '            oMsg.addAttachment(contentStream, Attachment)

    '            sMessage = oMsg.emailer(oBodyXML, xsltPath, fromName, fromEmail, recipientEmail, SubjectLine, , , , ccRecipient, bccRecipient, cSeperator)


    '            Return sMessage

    '        Catch ex As System.Exception
    '            Return ex.Message & " - " & ex.GetBaseException.Message
    '        End Try

    '    End Function

    <WebMethod(Description:="Sends Email From Website xForm with Attachment (from physical file)")> _
    Public Function emailerWithAttachment(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientEmail As String, ByRef SubjectLine As String, ByVal ccRecipient As String, ByVal bccRecipient As String, ByVal cSeperator As String, ByVal cAttachmentFilePath As String, ByVal bDeleteAfterSend As Boolean) As Object

        Dim sMessage As String

        Dim cProcessInfo As String = "emailerWithAttachment"
        Try


            Dim oMsg As Eonic.Messaging = New Eonic.Messaging
            oMsg.addAttachment(cAttachmentFilePath, bDeleteAfterSend)
            sMessage = oMsg.emailer(oBodyXML, xsltPath, fromName, fromEmail, recipientEmail, SubjectLine, , , , ccRecipient, bccRecipient, cSeperator)
            oMsg.deleteAttachment(cAttachmentFilePath)


            Return sMessage

        Catch ex As System.Exception
            Return ex.Message & " - " & ex.GetBaseException.Message
        End Try

    End Function


    <WebMethod(Description:="Sends Email From Website xForm with Attachment (from physical file)")> _
    Public Function emailerWithFTPAttachment(ByRef oBodyXML As XmlElement, ByRef xsltPath As String, ByRef fromName As String, ByRef fromEmail As String, ByRef recipientEmail As String, ByRef SubjectLine As String, ByVal ccRecipient As String, ByVal bccRecipient As String, ByVal cSeperator As String, ByVal cAttachmentFilePath As String, ByVal bDeleteAfterSend As Boolean, ByVal FTPServer As String, ByVal FTPUsername As String, ByVal FTPPassword As String, ByVal FTPFolder As String) As Object

        Dim sMessage As String


        Dim cProcessInfo As String = "emailerWithAttachment"
        Try

            Dim oMsg As Eonic.Messaging = New Eonic.Messaging
            'oMsg.addAttachment(cAttachmentFilePath, bDeleteAfterSend)

            'oMsg.deleteAttachment(cAttachmentFilePath)

            Dim FileName As String = cAttachmentFilePath.Substring(cAttachmentFilePath.LastIndexOf("/") + 1)
            FTPFolder = FTPFolder.Trim("/") & "/" & Replace(fromName, " ", "-")

            'Dim miUri As String = "ftp://" & FTPServer & "/" & FTPFolder & "/" & Replace(fromName, " ", "-") & "/" & FileName
            'Dim miRequest As Net.FtpWebRequest = Net.WebRequest.Create(miUri)
            'miRequest.Credentials = New Net.NetworkCredential(FTPUserName, FTPPassword)
            'miRequest.Method = Net.WebRequestMethods.Ftp.UploadFile
            Try
                'Dim bFile() As Byte = System.IO.File.ReadAllBytes(cAttachmentFilePath)
                'Dim miStream As System.IO.Stream = miRequest.GetRequestStream()
                'miStream.Write(bFile, 0, bFile.Length)
                'miStream.Close()
                'miStream.Dispose()

                Dim ftp As New FTPHelper(FTPServer, FTPUsername, FTPPassword)
                Dim UploadClient As New System.Net.WebClient()
                Dim DownloadClient As New System.Net.WebClient()

                ftp.Connect()
                ftp.CreateDirectory("/" & FTPFolder, True)
                ftp.UploadFile(UploadClient, cAttachmentFilePath, FTPFolder & "/" & FileName, False)

                If bDeleteAfterSend Then
                    Dim fsh As Eonic.fsHelper = New fsHelper
                    fsh.DeleteFile(cAttachmentFilePath)
                End If

            Catch ex As Exception
                'Throw New Exception(ex.Message & "FTP Failed")
                oBodyXML.SetAttribute("error", "FTP Failed: " & ex.Message)
            End Try
            sMessage = oMsg.emailer(oBodyXML, xsltPath, fromName, fromEmail, recipientEmail, SubjectLine, , , , ccRecipient, bccRecipient, cSeperator)

            Return sMessage

        Catch ex As System.Exception
            Return ex.Message & " - " & ex.GetBaseException.Message
        End Try

    End Function

    <WebMethod()> _
    Public Function LuceneIndex() As XmlDocument
        Try
            CreateResponse()
            If CheckUserIP() Then

                'Dim myThread As System.Threading.Thread
                'myThread = New System.Threading.Thread(AddressOf Services.LuceneIndexAsync)
                'myThread.Start(HttpContext.Current)
                Dim sResult As String = LuceneIndexAsync(HttpContext.Current)

                Eonic.Tools.Xml.addElement(oResponseElmt, "Message", sResult)
                bResult = True

                'Dim oIndexer As New Eonic.Indexer(New Eonic.Web)
                'oIndexer.DoIndex(0, bResult)
                'Dim cSubResponse As String = oIndexer.cExError
                'If cSubResponse = "" Then
                '    bResult = True
                '    cSubResponse = "Completed Successfully"
                'Else
                '    bResult = False
                'End If
                'AddResponse(cSubResponse)
                'AddResponse(vbCrLf & "Pages: " & oIndexer.nPagesIndexed)
                'AddResponse(vbCrLf & "Documents: " & oIndexer.nDocumentsIndexed)
                'AddResponse(vbCrLf & "Contents: " & oIndexer.nContentsIndexed)

            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function

    Public Shared Function LuceneIndexAsync(ByVal oCtx As HttpContext) As String
        Dim bResult As Boolean
        Dim sResult As String = ""
        Dim myWeb As New Eonic.Web(oCtx)
        myWeb.Open()
        Try

            Dim oIndexer As New Eonic.IndexerAsync(myWeb)

            sResult = oIndexer.DoIndex(0, bResult)

            Dim cSubResponse As String = oIndexer.cExError
            If cSubResponse = "" Then
                bResult = True
            Else
                sResult = "Indexer Error" & cSubResponse
                bResult = False
            End If

            '  sResult = sResult & " Pages: " & oIndexer.nPagesIndexed
            '  sResult = sResult & " Documents: " & oIndexer.nDocumentsIndexed
            '  sResult = sResult & " Contents: " & oIndexer.nContentsIndexed

            myWeb.moDbHelper.logActivity(Web.dbHelper.ActivityType.Search, 0, 0, 0, sResult)
            Return sResult

        Catch ex As System.Exception
            bResult = False
            myWeb.moDbHelper.logActivity(Web.dbHelper.ActivityType.Search, 0, 0, 0, ex.ToString)
        Finally

            myWeb.Close()
            myWeb = Nothing
        End Try
    End Function

    <WebMethod()> _
    Public Function DatabaseUpgrade() As XmlDocument
        Try
            CreateResponse()
            If CheckUserIP() Then
                Dim oSetup As New Eonic.Setup
                bResult = oSetup.UpdateDatabase()
                Dim cSubResponse As String = oSetup.oResponse.OuterXml
                AddResponse(cSubResponse)
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function

    <WebMethod()>
    Public Function Feed(ByVal cURL As String, ByVal cXSLPath As String, ByVal nPageId As Long, ByVal nSaveMode As Integer, ByVal cItemNodeName As String) As XmlDocument
        Try
            CreateResponse()
            If CheckUserIP() Then
                Dim oResElmt As XmlElement = oResponseElmt.OwnerDocument.CreateElement("Response")
                Dim oFeeder As New Eonic.FeedHandler(cURL, cXSLPath, nPageId, nSaveMode, oResElmt, cItemNodeName)
                bResult = oFeeder.ProcessFeeds()
                Dim cSubResponse As String = oResElmt.InnerXml
                AddResponse(cSubResponse)
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML


        moResponse.Flush()

    End Function

    <WebMethod()>
    Public Function SubscriptionProcess() As XmlDocument
        Dim myWeb As New Eonic.Web(HttpContext.Current)
        myWeb.gbCart = False
        myWeb.Open()
        Try
            CreateResponse()
            If CheckUserIP() Then
                Dim oResElmt As XmlElement = oResponseElmt.OwnerDocument.CreateElement("Response")
                Dim oSubscriptions As New Eonic.Web.Cart.Subscriptions(myWeb)
                oResElmt.InnerXml = oSubscriptions.SubcriptionReminders().OuterXml
                If bResult Then AddResponse("Reminders Complete")
                'bResult = oSubscriptions.CheckExpiringSubscriptions()
                'If bResult Then AddResponse("Expiring Subscriptions Complete")
                Dim cSubResponse As String = oResElmt.InnerXml
                AddResponse(cSubResponse)
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function
    <WebMethod()> _
    Public Function FTPUploadPage(ByVal SourceURL As String, ByVal FTPServer As String, ByVal FTPUserName As String, ByVal FTPPassword As String, ByVal FTPFilePath As String, ByVal FTPFileName As String) As XmlDocument
        Try
            CreateResponse()
            If CheckUserIP() Then
                Dim cPageSourceText As String = ""
                Dim oWebRequest As HttpWebRequest
                Dim oWebResponse As HttpWebResponse = Nothing
                Dim oSReader As StreamReader
                'request the page
                oWebRequest = DirectCast(WebRequest.Create(SourceURL), HttpWebRequest)
                oWebRequest.KeepAlive = False
                oWebResponse = DirectCast(oWebRequest.GetResponse(), HttpWebResponse)
                oSReader = New StreamReader(oWebResponse.GetResponseStream())
                cPageSourceText = oSReader.ReadToEnd
                oWebRequest.Abort()
                oWebResponse.Close()
                oWebRequest = Nothing
                oWebResponse = Nothing

                oFTP = New Eonic.Tools.FTPClient(FTPServer, FTPUserName, FTPPassword)

                bResult = oFTP.UploadText(cPageSourceText, FTPFilePath, FTPFileName)
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function

    <WebMethod(Description:="ScheduleMonitorXml")> _
    Public Function UserAlerts() As XmlDocument
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            If CheckUserIP() Then
                Dim oAlerts As New Eonic.Web.Membership.Alerts(myWeb)
                AddHandler oAlerts.OnError, AddressOf OnError

                oResponseElmt.AppendChild(oResponseElmt.OwnerDocument.ImportNode(oAlerts.CurrentAlerts(bResult), True))
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "UserAlerts", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function


    <WebMethod(Description:="ScheduleMonitorXml")> _
    Public Function ScheduleMonitorXml() As XmlDocument
        Dim oDb As New Eonic.Tools.Database
        Try
            myWeb = New Eonic.Web
            myWeb.Open()

            CreateResponse()
            If CheckUserIP() Then

                Dim oMonitor As New Eonic.Monitor(myWeb)
                AddHandler oMonitor.OnError, AddressOf OnError
                oResponseElmt.AppendChild(oResponseElmt.OwnerDocument.ImportNode(oMonitor.GetMonitorSchedulerXml(), True))
                bResult = True

            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "Monitor", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function

    <WebMethod()> _
    Public Function ScheduleMonitor() As XmlDocument
        Dim oDb As New Eonic.Tools.Database
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            If CheckUserIP() Then

                Dim oMonitor As New Eonic.Monitor(myWeb)
                AddHandler oMonitor.OnError, AddressOf OnError
                Eonic.Tools.Xml.addElement(oResponseElmt, "Message", oMonitor.EmailMonitorScheduler())
                bResult = True

            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "Monitor", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
        End Try
        Return oRXML
    End Function


    <WebMethod(Description:="GetPendingContent")> _
    Public Function GetPendingContent() As XmlDocument
        Dim oDb As New Eonic.Tools.Database
        Dim oVConfig As System.Collections.Specialized.NameValueCollection = System.Web.Configuration.WebConfigurationManager.GetWebApplicationSection("eonic/versioncontrol")
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            If CheckUserIP() Then

                If Eonic.Web.gbVersionControl Then

                    Dim oResponse As XmlElement = myWeb.moDbHelper.getPendingContent(True)
                    If oResponse Is Nothing Then
                        AddResponse("There is no content currently awaiting approval")
                    Else
                        ' Email the response
                        Dim oMsg As Eonic.Messaging = New Eonic.Messaging

                        Dim cEmail As String = oVConfig("notificationEmail")
                        Dim cXSLPath As String = IIf(String.IsNullOrEmpty("" & oVConfig("notificationXsl")), "/ewcommon/xsl/Email/pendingcontentNotification.xsl", oVConfig("notificationXsl"))
                        Dim cWebmasterEmail As String = oVConfig("notificationEmailSender")
                        If cWebmasterEmail = "" Then cWebmasterEmail = myWeb.moConfig("SiteAdminEmail")
                        Dim SenderName As String = myWeb.moConfig("SiteName") & " Notification"


                        Dim cMessage As String = oMsg.emailer(oResponse, cXSLPath, SenderName, cWebmasterEmail, cEmail, "", , , , , , )
                        AddResponse(cMessage)
                    End If
                    bResult = True

                Else
                    bResult = False
                    AddResponse("Version Control is not enabled for this site.  Please check the config, and ewcommon application setup")
                End If

            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "GetPendingContent", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
            myWeb.Close()
            myWeb = Nothing
        End Try
        Return oRXML
    End Function

    <WebMethod(Description:="Syndicate content from the website to distributors")> _
    Public Function Syndicate(ByVal distributors As String, ByVal contentTypes As String, ByVal page As Integer, ByVal iterate As Boolean) As XmlDocument
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            If CheckUserIP() Then
                Dim oSyndication As New Eonic.Syndication(myWeb, distributors, contentTypes, page, iterate)
                AddHandler oSyndication.OnError, AddressOf OnError

                oSyndication.Syndicate()

                bResult = oSyndication.IsCompleted

                If Not (oSyndication.IsContentsNodePopulated) Then
                    AddResponse("There was no content found to syndicate")
                Else
                    AddResponse("Total content found for syndication: " & oSyndication.ContentCount)
                End If

                If Not bResult Then
                    AddResponse(oSyndication.Diagnostics)
                End If
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "Syndicate", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
            myWeb.Close()
            myWeb = Nothing
        End Try

        Return oRXML

    End Function

    <WebMethod(Description:="Syndicate content from the website to distributors with distributor specific settings")> _
    Public Function SyndicateExtended(ByVal distributors As String, ByVal contentTypes As String, ByVal page As Integer, ByVal iterate As Boolean, ByVal extendedSettings As XmlElement) As XmlDocument
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            If CheckUserIP() Then
                Dim oSyndication As New Eonic.Syndication(myWeb, distributors, contentTypes, page, iterate, extendedSettings)
                AddHandler oSyndication.OnError, AddressOf OnError

                oSyndication.Syndicate()

                bResult = oSyndication.IsCompleted

                If Not (oSyndication.IsContentsNodePopulated) Then
                    AddResponse("There was no content found to syndicate")
                Else
                    AddResponse("Total content found for syndication: " & oSyndication.ContentCount)
                End If

                If Not bResult Then
                    AddResponse(oSyndication.Diagnostics)
                End If
            End If
        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "SyndicateExtended", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
            myWeb.Close()
            myWeb = Nothing
        End Try
        Return oRXML
    End Function

    <WebMethod(Description:="GetStatus")> _
    Public Function GetStatus() As XmlDocument
        Dim oDb As New Eonic.Tools.Database
        Dim oVConfig As System.Collections.Specialized.NameValueCollection = System.Web.Configuration.WebConfigurationManager.GetWebApplicationSection("eonic/versioncontrol")
        Try
            myWeb = New Eonic.Web
            myWeb.Open()
            CreateResponse()
            Dim moConfig As System.Collections.Specialized.NameValueCollection = WebConfigurationManager.GetWebApplicationSection("eonic/web")
            Dim sSql As String
            Dim oElmt As XmlElement = oRXML.CreateElement("Debug")
            oElmt.InnerText = moConfig("debug")
            oResponseElmt.AppendChild(oElmt)

            ''Start URI
            'oElmt = oRXML.CreateElement("AbsoluteURI")
            'oElmt.InnerText = System.Web.HttpContext.Current.Request.Url.AbsoluteUri
            'oResponseElmt.AppendChild(oElmt)
            ''End URI

            oElmt = oRXML.CreateElement("DBVersion")
            Try
                Dim oDr As System.Data.SqlClient.SqlDataReader
                Dim sResult As String = ""
                sSql = "select * from tblSchemaVersion"
                oDr = myWeb.moDbHelper.getDataReader(sSql)
                If oDr.HasRows Then
                    While oDr.Read
                        sResult = oDr(1) & "." & oDr(2) & "." & oDr(3) & "." & oDr(4)
                    End While
                Else
                    sResult = "nodata"
                End If
                oElmt.InnerText = sResult
            Catch ex As Exception
                If moConfig("VersionNumber") = "" Then
                    oElmt.InnerText = "Pre V4 or no Eonicweb"
                Else
                    oElmt.InnerText = moConfig("VersionNumber")
                End If

            End Try

            oResponseElmt.AppendChild(oElmt)


            'Start DotNetversion
            oElmt = oRXML.CreateElement("DotNetVersion")
            oElmt.InnerText = Environment.Version.ToString()
            oResponseElmt.AppendChild(oElmt)
            'End DotNetversion

            'Start LocalOrCommonBin
            oElmt = oRXML.CreateElement("LocalOrCommonBin")
            If Dir(Server.MapPath("../default.ashx")) <> "" Then
                oElmt.InnerText = "Local"
            Else
                If Dir(Server.MapPath("../ewcommon/default.ashx")) <> "" Then
                    oElmt.InnerText = "Common"
                Else
                    oElmt.InnerText = "Error"
                End If
            End If
            oResponseElmt.AppendChild(oElmt)
            'End LocalOrCommonBin


            'Start DLL Version

            oElmt = oRXML.CreateElement("DLLVersion")

            'Dim sCodeBase As String = myWeb.moRequest.ServerVariables("GENERATOR")
            'oElmt.InnerText = sCodeBase

            'oElmt.InnerText = myWeb.Generator().FullName()

            oElmt.InnerText = Eonic.Web.gcGenerator.ToString()

            'Dim CodeGenerator As Assembly = Me.Generator()
            'gcGenerator = CodeGenerator.FullName()

            oResponseElmt.AppendChild(oElmt)

            'End DLL Version


            'Start LatestDBVersion
            oElmt = oRXML.CreateElement("LatestDBVersion")
            Dim LatestDBVersion As XmlTextReader
            LatestDBVersion = New XmlTextReader(Server.MapPath("../ewcommon/sqlUpdate/DatabaseUpgrade.xml"))
            LatestDBVersion.WhitespaceHandling = WhitespaceHandling.None
            'Disable whitespace so that it doesn't have to read over whitespaces
            LatestDBVersion.Read()
            LatestDBVersion.Read()
            Dim LatestDBversionAttribute As String = LatestDBVersion.GetAttribute("LatestVersion")
            oElmt.InnerText = LatestDBversionAttribute
            oResponseElmt.AppendChild(oElmt)
            'End LatestDBVersion


            'Start EnabledFeatures

            oElmt = oRXML.CreateElement("Membership")
            oElmt.InnerText = moConfig("Membership")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("Cart")
            oElmt.InnerText = moConfig("Cart")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("Quote")
            oElmt.InnerText = moConfig("Quote")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("Report")
            oElmt.InnerText = moConfig("Report")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("Subscriptions")
            oElmt.InnerText = moConfig("Subscriptions")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("MailingList")
            oElmt.InnerText = moConfig("MailingList")
            oResponseElmt.AppendChild(oElmt)

            oElmt = oRXML.CreateElement("Search")
            oElmt.InnerText = moConfig("Search")
            oResponseElmt.AppendChild(oElmt)

            'End Enabledfeatures


        Catch ex As System.Exception
            bResult = False
            AddResponse(ex.ToString)
            returnException(mcModuleName, "GetPendingContent", ex, , , gbDebug)
        Finally
            oResponseElmt.SetAttribute("bResult", bResult)
            myWeb.Close()
            myWeb = Nothing
        End Try
        Return oRXML
    End Function

#End Region
End Class

