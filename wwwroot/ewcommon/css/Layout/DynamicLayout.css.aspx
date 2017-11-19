﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DynamicLayout.css.aspx.vb" Inherits="css_Layout_DynamicLayout" %>
<%  
    Response.Cache.SetExpires(DateTime.Now.AddDays(1))
    Response.ContentType = "text/css"
    
    Dim fullWidth As Integer = IIf(CInt("0" & Request("fullWidth")) = 0, 984, CInt(Request("fullWidth")))
    Dim NavWidth As Integer = IIf(CInt("0" & Request("NavWidth")) = 0, 220, CInt(Request("NavWidth")))
    Dim fwGrv() As String = getGoldenArray(fullWidth)
    
    'TS changed how this works to look for empty string so we can pass through 0 value.
    Dim colPad As Integer = IIf(Request("colPad") = "", fwGrv(8), CInt(Request("colPad")))
    Dim boxPad As Integer = IIf(Request("boxPad") = "", fwGrv(9), CInt(Request("boxPad")))
    Dim mansonaryAspect As Double = IIf(CDbl("0" & Request("mansonaryAspect")) = 0, 1, CDbl(Request("mansonaryAspect")))
    
    
    Dim pageWidth As Integer = fullWidth - (NavWidth + colPad)
    Dim pwGrv() As String = getGoldenArray(pageWidth)
    Dim i As Long
    Dim colPadHalf As Integer = rd(colPad / 2)
    
    'Common used column widths =========================================
    'pageWidth column widths
    Dim pw50column As Integer = rd((pageWidth - colPad) / 2)
    Dim pw50columnLast As Integer = pageWidth - (pw50column + colPad)
    
    Dim pw25columnFirst As Integer = rd((pw50column - colPad) / 2)
    Dim pw25columnFirstLast As Integer = pw50column - (pw25columnFirst + colPad)
    Dim pw25columnLast As Integer = rd((pw50columnLast - colPad) / 2)
    Dim pw25columnLastLast As Integer = pw50columnLast - (pw25columnLast + colPad)
    
    Dim pw66column As Integer = rd(pwGrv(1) - colPadHalf)
    Dim pw33column As Integer = rd(pwGrv(2) - colPadHalf)
    
    Dim pw3column As Integer = rd((pageWidth - (colPad * 2)) / 3)
    Dim pw3columnLast As Integer = pageWidth - ((pw3column + colPad) * 2)
    
    Dim pw75column As Integer = rd(((pageWidth - colPad) / 4) * 3)
    Dim pw25column As Integer = rd(pageWidth - colPad - pw75column)
    
    Dim pw4column As Integer = rd((pageWidth - (colPad * 3)) / 4)
    Dim pw4columnLast As Integer = pageWidth - ((pw4column + colPad) * 3)
    
    'fullWidth column widths
    Dim fw50column As Integer = rd((fullWidth - colPad) / 2)
    Dim fw50columnLast As Integer = fullWidth - (fw50column + colPad)
    
    Dim fw25columnFirst As Integer = rd((fw50column - colPad) / 2)
    Dim fw25columnFirstLast As Integer = fw50column - (fw25columnFirst + colPad)
    Dim fw25columnLast As Integer = rd((fw50columnLast - colPad) / 2)
    Dim fw25columnLastLast As Integer = fw50columnLast - (fw25columnLast + colPad)
    
    Dim fw66column As Integer = rd(fwGrv(1) - colPadHalf)
    Dim fw33column As Integer = rd(fwGrv(2) - colPadHalf)
    
    Dim fw3column As Integer = rd((fullWidth - (colPad * 2)) / 3)
    Dim fw3columnLast As Integer = fullWidth - ((fw3column + colPad) * 2)
    
    Dim fw75column As Integer = rd(((fullWidth - colPad) / 4) * 3)
    Dim fw25column As Integer = rd(fullWidth - colPad - fw75column)
    
    Dim fw4column As Integer = rd((fullWidth - (colPad * 3)) / 4)
    Dim fw4columnLast As Integer = fullWidth - ((fw4column + colPad) * 3)
    
    Dim fw6column As Integer = rd((fullWidth + boxPad) / 6)
    Dim fw6columnLast As Integer = fullWidth - ((fw6column + colPad) * 2)
    
%>
/*  
    Automated column calculations for eonicweb
    © Eonicweb Ltd 2011 - Authors: Will Hancock, Trevor Spink 
*/

/* full Width Golden Ratio Values
<%  For i = 0 To UBound(fwGrv)
        Response.Write(i & "-" & fwGrv(i) & " / ")
    Next
%>*/
/* page Width Golden Ratio Values
<%  For i = 0 To UBound(pwGrv)
        Response.Write(i & "-" & pwGrv(i) & " / ")
    Next
%>*/

/*Start --- Fixes for non bootstrap sites*/

.Site *,.Site *:before,.Site *:after {
-webkit-box-sizing: content-box;
-moz-box-sizing: content-box;
box-sizing: content-box;
}

/*Start --- End for non bootstrap sites*/




.rowMargin{margin-right:<%=colPad%>px;}
div.module,
.box{margin-bottom:<%=colPad%>px}
.box div.module{margin-bottom:0px}
#subMenu{width:<%=NavWidth%>px;}
#mainLayout{float:left;width:<%=pageWidth%>px;margin-left:<%=colPad%>px; box-sizing: content-box !important;}
div.fullwidth{width: <%=fullWidth%>px !important; margin-left: 0 !important; box-sizing: content-box !important;}

/*
.cartFull .step{float:left;width:<%=(pageWidth / 6)%>px;}
div.fullwidth .cartFull .step{width:<%=(fullWidth / 6)%>px;}
*/

.cols2 .listItem{width:<%=pageWidth - rd(rd((pageWidth - colPad) / 2) + colPad)%>px;}
.cols2 .rowMargin{width:<%=rd((pageWidth - colPad) / 2)%>px;}

.cols3 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.cols3 .rowMargin{width:<%=rd((pageWidth - (colPad * 2)) / 3)-1%>px;}

.cols4 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 3)) / 4) + colPad) * 3)-1%>px;}
.cols4 .rowMargin{width:<%=rd((pageWidth - (colPad * 3)) / 4) - 1%>px;}

.cols5 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.cols5 .rowMargin{width:<%=rd((pageWidth - (colPad * 4)) / 5) - 1%>px;}

.box .cols2 .listItem{width:<%=(pageWidth - (boxPad * 2)) - rd(((pageWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.box .cols2 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - colPad) / 2)%>px;}

.box .cols3 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.box .cols3 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.box .cols4 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.box .cols4 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.box .cols5 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.box .cols5 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 50% Columns */
.template_2_Columns .column1 {float:left;width:<%=pw50column%>px;margin-right:<%=rd(colPad)%>px;}
.template_2_Columns .column2 {float:left;width:<%=pw50columnLast%>px}

.template_2_Columns .column1 .cols2  .listItem,
.template_3_Columns_50_25_25 .column1 .cols2 .listItem{width:<%=pw50column - rd(((pw50column - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column3 .cols2 .listItem,
.template_2_Columns .column2 .cols2 .listItem{width:<%=pw50columnLast - rd(((pw50columnLast - colPad) / 2) + colPad)%>px;}
.template_2_Columns .column1 .cols2 .rowMargin,
.template_3_Columns_50_25_25 .column1 .cols2 .rowMargin{width: <%=rd((pw50column - colPad) / 2)%>px;}
.template_3_Columns_25_25_50 .column3 .cols2 .rowMargin,
.template_2_Columns .column2 .cols2 .rowMargin{width: <%=rd((pw50columnLast - colPad) / 2)%>px;}

.template_2_Columns .column1 .box .cols2 .listItem,
.template_3_Columns_50_25_25 .column1 .box .cols2 .listItem{width:<%=(pw50column - (boxPad * 2)) - rd(((pw50column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols2 .listItem,
.template_2_Columns .column2 .box .cols2 .listItem{width:<%=(pw50columnLast - (boxPad * 2)) - rd(((pw50columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns .column1 .box .cols2 .rowMargin,
.template_3_Columns_50_25_25 .column1 .box .cols2 .rowMargin{width: <%=rd((pw50column - (boxPad * 2) - colPad) / 2)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols2 .rowMargin,
.template_2_Columns .column2 .box .cols2 .rowMargin{width: <%=rd((pw50columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns .column1 .cols3 .listItem,
.template_3_Columns_50_25_25 .column1 .cols3 .listItem{width: <%=pw50column - ((rd((pw50column - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template_3_Columns_25_25_50 .column3 .cols3 .listItem,
.template_2_Columns .column2 .cols3 .listItem{width: <%=pw50columnLast - ((rd((pw50columnLast - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template_2_Columns .column1 .cols3 .rowMargin,
.template_3_Columns_50_25_25 .column1 .cols3 .rowMargin{width: <%=rd((pw50column - (colPad * 2)) / 3)%>px;}
.template_3_Columns_25_25_50 .column3 .cols3 .rowMargin,
.template_2_Columns .column2 .cols3 .rowMargin{width:<%=rd((pw50columnLast - (colPad * 2)) / 3)%>px;}

.template_2_Columns .column1 .box .cols3 .listItem,
.template_3_Columns_50_25_25 .column1 .box .cols3 .listItem{width: <%=pw50column - (boxPad * 2) - ((rd((pw50column - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols3 .listItem,
.template_2_Columns .column2 .box .cols3 .listItem{width: <%=pw50columnLast - (boxPad * 2) - ((rd((pw50columnLast - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template_2_Columns .column1 .box .cols3 .rowMargin,
.template_3_Columns_50_25_25 .column1 .box .cols3 .rowMargin{width: <%=rd((pw50column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols3 .rowMargin,
.template_2_Columns .column2 .box .cols3 .rowMargin{width:<%=rd((pw50columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns .column1 .cols4 .listItem,
.template_3_Columns_50_25_25 .column1 .cols4 .listItem{width: <%=pw50column - ((rd((pw50column - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template_3_Columns_25_25_50 .column3 .cols4 .listItem,
.template_2_Columns .column2 .cols4 .listItem{width: <%=pw50columnLast - ((rd((pw50columnLast - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template_2_Columns .column1 .cols4 .rowMargin,
.template_3_Columns_50_25_25 .column1 .cols4 .rowMargin{width: <%=rd((pw50column - (colPad * 3)) / 4)%>px;}
.template_3_Columns_25_25_50 .column3 .cols4 .rowMargin,
.template_2_Columns .column2 .cols4 .rowMargin{width:<%=rd((pw50columnLast - (colPad * 3)) / 4)%>px;}

.template_2_Columns .column1 .box .cols4 .listItem,
.template_3_Columns_50_25_25 .column1 .box .cols4 .listItem{width: <%=pw50column - (boxPad * 2) - ((rd((pw50column - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols4 .listItem,
.template_2_Columns .column2 .box .cols4 .listItem{width: <%=pw50columnLast - (boxPad * 2) - ((rd((pw50columnLast - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template_2_Columns .column1 .box .cols4 .rowMargin,
.template_3_Columns_50_25_25 .column1 .box .cols4 .rowMargin{width: <%=rd((pw50column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols4 .rowMargin,
.template_2_Columns .column2 .box .cols4 .rowMargin{width:<%=rd((pw50columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns .column1 .cols5 .listItem,
.template_3_Columns_50_25_25 .column1 .cols5 .listItem{width: <%=pw50column - ((rd((pw50column - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template_3_Columns_25_25_50 .column3 .cols5 .listItem,
.template_2_Columns .column2 .cols5 .listItem{width: <%=pw50columnLast - ((rd((pw50columnLast - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template_2_Columns .column1 .cols5 .rowMargin,
.template_3_Columns_50_25_25 .column1 .cols5 .rowMargin{width: <%=rd((pw50column - (colPad * 4)) / 5)%>px;}
.template_3_Columns_25_25_50 .column3 .cols5 .rowMargin,
.template_2_Columns .column2 .cols5 .rowMargin{width:<%=rd((pw50columnLast - (colPad * 4)) / 5)%>px;}

.template_2_Columns .column1 .box .cols5 .listItem,
.template_3_Columns_50_25_25 .column1 .box .cols5 .listItem{width: <%=pw50column - (boxPad * 2) - ((rd((pw50column - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols5 .listItem,
.template_2_Columns .column2 .box .cols5 .listItem{width: <%=pw50columnLast - (boxPad * 2) - ((rd((pw50columnLast - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template_2_Columns .column1 .box .cols5 .rowMargin,
.template_3_Columns_50_25_25 .column1 .box .cols5 .rowMargin{width: <%=rd((pw50column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}
.template_3_Columns_25_25_50 .column3 .box .cols5 .rowMargin,
.template_2_Columns .column2 .box .cols5 .rowMargin{width:<%=rd((pw50columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 66% columns */
.template_2_Columns_66_33 .column1{float: left;width: <%=pw66column%>px;margin-right: <%=rd(colPad)%>px;}
.template_2_Columns_66_33 .column2{float: left;width: <%=pw33column%>px;}

.template_2_Columns_66_33 .column1 .cols2 .listItem{width:<%=pw66column - rd(((pw66column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_66_33 .column1 .cols2 .rowMargin{width:<%=rd((pw66column - colPad) / 2)%>px;}
.template_2_Columns_66_33 .column1 .box .cols2 .listItem{width:<%=pw66column - (boxPad * 2) - rd(((pw66column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_66_33 .column1 .box .cols2 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_33_66 .column2 .cols2 .listItem{width:<%=pw66column - rd(((pw66column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_33_66 .column2 .cols2 .rowMargin{width:<%=rd((pw66column - colPad) / 2)%>px;}
.template_2_Columns_33_66 .column2 .box .cols2 .listItem{width:<%=pw66column - (boxPad * 2) - rd(((pw66column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_33_66 .column2 .box .cols2 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_66_33 .column1 .cols3 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_66_33 .column1 .cols3 .rowMargin{width:<%=rd((pw66column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_66_33 .column1 .box .cols3 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_66_33 .column1 .box .cols3 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_33_66 .column2 .cols3 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_33_66 .column2 .cols3 .rowMargin{width:<%=rd((pw66column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_33_66 .column2 .box .cols3 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_33_66 .column2 .box .cols3 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_66_33 .column1 .cols4 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_66_33 .column1 .cols4 .rowMargin{width:<%=rd((pw66column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_66_33 .column1 .box .cols4 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_66_33 .column1 .box .cols4 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_33_66 .column2 .cols4 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_33_66 .column2 .cols4 .rowMargin{width:<%=rd((pw66column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_33_66 .column2 .box .cols4 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_33_66 .column2 .box .cols4 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_66_33 .column1 .cols5 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_66_33 .column1 .cols5 .rowMargin{width:<%=rd((pw66column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_66_33 .column1 .box .cols5 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_66_33 .column1 .box .cols5 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_33_66 .column2 .cols5 .listItem{width:<%=pw66column - ((rd((pw66column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_33_66 .column2 .cols5 .rowMargin{width:<%=rd((pw66column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_33_66 .column2 .box .cols5 .listItem{width:<%=pw66column - (boxPad * 2) - ((rd((pw66column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_33_66 .column2 .box .cols5 .rowMargin{width:<%=rd((pw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

/* 33% columns */
.template_2_Columns_33_66 .column1{float: left;width: <%=pw33column%>px;margin-right: <%=rd(colPad)%>px;}
.template_2_Columns_33_66 .column2{float: left;width: <%=pw66column%>px;}

.template_2_Columns_33_66 .column1 .cols2 .listItem{width:<%=pw33column - rd(((pw33column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_33_66 .column1 .cols2 .rowMargin{width:<%=rd((pw33column - colPad) / 2)%>px;}
.template_2_Columns_33_66 .column1 .box .cols2 .listItem{width:<%=pw33column - (boxPad * 2) - rd(((pw33column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_33_66 .column1 .box .cols2 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_66_33 .column2 .cols2 .listItem{width:<%=pw33column - rd(((pw33column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_66_33 .column2 .cols2 .rowMargin{width:<%=rd((pw33column - colPad) / 2)%>px;}
.template_2_Columns_66_33 .column2 .box .cols2 .listItem{width:<%=pw33column - (boxPad * 2) - rd(((pw33column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_66_33 .column2 .box .cols2 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_33_66 .column1 .cols3 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_33_66 .column1 .cols3 .rowMargin{width:<%=rd((pw33column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_33_66 .column1 .box .cols3 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_33_66 .column1 .box .cols3 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_66_33 .column2 .cols3 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_66_33 .column2 .cols3 .rowMargin{width:<%=rd((pw33column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_66_33 .column2 .box .cols3 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_66_33 .column2 .box .cols3 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_33_66 .column1 .cols4 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_33_66 .column1 .cols4 .rowMargin{width:<%=rd((pw33column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_33_66 .column1 .box .cols4 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_33_66 .column1 .box .cols4 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_66_33 .column2 .cols4 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_66_33 .column2 .cols4 .rowMargin{width:<%=rd((pw33column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_66_33 .column2 .box .cols4 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_66_33 .column2 .box .cols4 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_33_66 .column1 .cols5 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 4)) / 5) * 4) + (colPad * 3))%>px;}
.template_2_Columns_33_66 .column1 .cols5 .rowMargin{width:<%=rd((pw33column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_33_66 .column1 .box .cols5 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_33_66 .column1 .box .cols5 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

.template_2_Columns_66_33 .column2 .cols5 .listItem{width:<%=pw33column - ((rd((pw33column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_66_33 .column2 .cols5 .rowMargin{width:<%=rd((pw33column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_66_33 .column2 .box .cols5 .listItem{width:<%=pw33column - (boxPad * 2) - ((rd((pw33column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_66_33 .column2 .box .cols5 .rowMargin{width:<%=rd((pw33column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 3 column widths (true 33%)*/
.template_3_Columns .column1{float: left;width:<%=pw3column%>px;margin-right: <%=colPad%>px;}
.template_3_Columns .column2{float: left;width:<%=pw3column%>px;margin-right: <%=colPad%>px;}
.template_3_Columns .column3{float: left;width:<%=pw3columnLast%>px;}

.template_3_Columns .cols2 .listItem{width:<%=pw3column - rd(((pw3column - colPad) / 2) + colPad)%>px;}
.template_3_Columns .cols2 .rowMargin{width:<%=rd((pw3column - colPad) / 2)%>px;}
.template_3_Columns .box .cols2 .listItem{width:<%=pw3column - (boxPad * 2) - rd(((pw3column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns .box .cols2 .rowMargin{width:<%=rd((pw3column - (boxPad * 2) - colPad) / 2)%>px;}
.template_3_Columns .column3 .cols2 .listItem{width:<%=pw3columnLast - rd(((pw3columnLast - colPad) / 2) + colPad)%>px;}
.template_3_Columns .column3 .cols2 .rowMargin{width:<%=rd((pw3columnLast - colPad) / 2)%>px;}
.template_3_Columns .column3 .box .cols2 .listItem{width:<%=pw3columnLast - (boxPad * 2) - rd(((pw3columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns .column3 .box .cols2 .rowMargin{width:<%=rd((pw3columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.template_3_Columns .cols3 .listItem{width:<%=pw3column - ((rd((pw3column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_3_Columns .cols3 .rowMargin{width:<%=rd((pw3column - (colPad * 2)) / 3)%>px;}
.template_3_Columns .box .cols3 .listItem{width:<%=pw3column - (boxPad * 2) - ((rd((pw3column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_3_Columns .box .cols3 .rowMargin{width:<%=rd((pw3column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}
.template_3_Columns .column3 .cols3 .listItem{width:<%=pw3columnLast - ((rd((pw3columnLast - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_3_Columns .column3 .cols3 .rowMargin{width:<%=rd((pw3columnLast - (colPad * 2)) / 3)%>px;}
.template_3_Columns .column3 .box .cols3 .listItem{width:<%=pw3columnLast - (boxPad * 2) - ((rd((pw3columnLast - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_3_Columns .column3 .box .cols3 .rowMargin{width:<%=rd((pw3columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_3_Columns .cols4 .listItem{width:<%=pw3column - ((rd((pw3column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_3_Columns .cols4 .rowMargin{width:<%=rd((pw3column - (colPad * 3)) / 4)%>px;}
.template_3_Columns .box .cols4 .listItem{width:<%=pw3column - (boxPad * 2) - ((rd((pw3column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_3_Columns .box .cols4 .rowMargin{width:<%=rd((pw3column - (boxPad * 2) - (colPad * 3)) / 3)%>px;}
.template_3_Columns .column3 .cols4 .listItem{width:<%=pw3columnLast - ((rd((pw3columnLast - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_3_Columns .column3 .cols4 .rowMargin{width:<%=rd((pw3columnLast - (colPad * 3)) / 4)%>px;}
.template_3_Columns .column3 .box .cols4 .listItem{width:<%=pw3columnLast - (boxPad * 2) - ((rd((pw3columnLast - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_3_Columns .column3 .box .cols4 .rowMargin{width:<%=rd((pw3columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_3_Columns .cols5 .listItem{width:<%=pw3column - ((rd((pw3column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_3_Columns .cols5 .rowMargin{width:<%=rd((pw3column - (colPad * 4)) / 5)%>px;}
.template_3_Columns .box .cols5 .listItem{width:<%=pw3column - (boxPad * 2) - ((rd((pw3column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_3_Columns .box .cols5 .rowMargin{width:<%=rd((pw3column - (boxPad * 2) - (colPad * 4)) / 3)%>px;}
.template_3_Columns .column3 .cols5 .listItem{width:<%=pw3columnLast - ((rd((pw3columnLast - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_3_Columns .column3 .cols5 .rowMargin{width:<%=rd((pw3columnLast - (colPad * 4)) / 5)%>px;}
.template_3_Columns .column3 .box .cols5 .listItem{width:<%=pw3columnLast - (boxPad * 2) - ((rd((pw3columnLast - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_3_Columns .column3 .box .cols5 .rowMargin{width:<%=rd((pw3columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 25% column widths */
.template_3_Columns_50_25_25 .column1{float:left;width:<%=pw50column%>px;margin-right:<%=colPad%>px;}
.template_3_Columns_50_25_25 .column2{float:left;width:<%=pw25columnLast%>px;margin-right:<%=colPad%>px;}
.template_3_Columns_50_25_25 .column3{float:left;width:<%=pw25columnLastLast%>px;}

.template_3_Columns_25_25_50 .column1{float: left;width: <%=pw25columnFirst%>px;margin-right:<%=colPad%>px;}
.template_3_Columns_25_25_50 .column2{float: left;width: <%=pw25columnFirstLast%>px;margin-right:<%=colPad%>px;}
.template_3_Columns_25_25_50 .column3{float: left;width: <%=pw50columnLast%>px}

.template_3_Columns_25_25_50 .column1 .cols2 .listItem{width:<%=pw25columnFirst - rd(((pw25columnFirst - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column2 .cols2 .listItem{width:<%=pw25columnFirstLast - rd(((pw25columnFirstLast - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column1 .cols2 .rowMargin{width:<%=rd((pw25columnFirst - colPad) / 2)%>px;}
.template_3_Columns_25_25_50 .column2 .cols2 .rowMargin{width:<%=rd((pw25columnFirstLast - colPad) / 2)%>px;}

.template_3_Columns_25_25_50 .column1 .box .cols2 .listItem{width:<%=pw25columnFirst - (boxPad * 2) - (rd((pw25columnFirst - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column2 .box .cols2 .listItem{width:<%=pw25columnFirstLast - (boxPad * 2) - (rd((pw25columnFirstLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns_25_25_50 .column1 .box .cols2 .rowMargin{width:<%=rd((pw25columnFirst - (boxPad * 2) - colPad) / 2)%>px;}
.template_3_Columns_25_25_50 .column2 .box .cols2 .rowMargin{width:<%=rd((pw25columnFirstLast - (boxPad * 2) - colPad) / 2)%>px;}

.template_3_Columns_50_25_25 .column2 .cols2 .listItem{width:<%=pw25columnLast - rd(((pw25columnLast - colPad) / 2) + colPad)%>px;}
.template_3_Columns_50_25_25 .column3 .cols2 .listItem{width:<%=pw25columnLastLast - rd(((pw25columnLastLast - colPad) / 2) + colPad)%>px;}
.template_3_Columns_50_25_25 .column2 .cols2 .rowMargin{width:<%=rd((pw25columnLast - colPad) / 2)%>px;}
.template_3_Columns_50_25_25 .column3 .cols2 .rowMargin{width:<%=rd((pw25columnLastLast - colPad) / 2)%>px;}

.template_3_Columns_50_25_25 .column2 .box .cols2 .listItem{width:<%=pw25columnLast - (boxPad * 2) - (rd((pw25columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns_50_25_25 .column3 .box .cols2 .listItem{width:<%=pw25columnLastLast - (boxPad * 2) - (rd((pw25columnLastLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_3_Columns_50_25_25 .column2 .box .cols2 .rowMargin{width:<%=rd((pw25columnLast - (boxPad * 2) - colPad) / 2)%>px;}
.template_3_Columns_50_25_25 .column3 .box .cols2 .rowMargin{width:<%=rd((pw25columnLastLast - (boxPad * 2) - colPad) / 2)%>px;}

/* 75% / 25% column widths */
.template_2_Columns_75_25 .column1{float: left;width: <%=pw75column%>px;margin-right: <%=rd(colPad)%>px;}
.template_2_Columns_75_25 .column2{float: left;width: <%=pw25column%>px;}

.template_2_Columns_75_25 .column1 .cols2 .listItem{width:<%=pw75column - rd(((pw75column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_75_25 .column1 .cols2 .rowMargin{width:<%=rd((pw75column - colPad) / 2)%>px;}
.template_2_Columns_75_25 .column1 .box .cols2 .listItem{width:<%=pw75column - (boxPad * 2) - rd(((pw75column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_75_25 .column1 .box .cols2 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_75_25 .column2 .cols2 .listItem{width:<%=pw25column - rd(((pw25column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_75_25 .column2 .cols2 .rowMargin{width:<%=rd((pw25column - colPad) / 2)%>px;}
.template_2_Columns_75_25 .column2 .box .cols2 .listItem{width:<%=pw25column - (boxPad * 2) - rd(((pw25column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_75_25 .column2 .box .cols2 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_75_25 .column1 .cols3 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_75_25 .column1 .cols3 .rowMargin{width:<%=rd((pw75column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_75_25 .column1 .box .cols3 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_75_25 .column1 .box .cols3 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_75_25 .column2 .cols3 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_75_25 .column2 .cols3 .rowMargin{width:<%=rd((pw25column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_75_25 .column2 .box .cols3 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_75_25 .column2 .box .cols3 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_75_25 .column1 .cols4 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_75_25 .column1 .cols4 .rowMargin{width:<%=rd((pw75column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_75_25 .column1 .box .cols4 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_75_25 .column1 .box .cols4 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_75_25 .column2 .cols4 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_75_25 .column2 .cols4 .rowMargin{width:<%=rd((pw25column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_75_25 .column2 .box .cols4 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_75_25 .column2 .box .cols4 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_75_25 .column1 .cols5 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_75_25 .column1 .cols5 .rowMargin{width:<%=rd((pw75column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_75_25 .column1 .box .cols5 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_75_25 .column1 .box .cols5 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_75_25 .column2 .cols5 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_75_25 .column2 .cols5 .rowMargin{width:<%=rd((pw25column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_75_25 .column2 .box .cols5 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_75_25 .column2 .box .cols5 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 25% / 75% column widths */
.template_2_Columns_25_75 .column1{float: left;width: <%=pw25column%>px;margin-right: <%=rd(colPad)%>px;}
.template_2_Columns_25_75 .column2{float: left;width: <%=pw75column%>px;}

.template_2_Columns_25_75 .column1 .cols2 .listItem{width:<%=pw25column - rd(((fw25column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_25_75 .column1 .cols2 .rowMargin{width:<%=rd((pw25column - colPad) / 2)%>px;}
.template_2_Columns_25_75 .column1 .box .cols2 .listItem{width:<%=pw25column - (boxPad * 2) - rd(((pw25column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_25_75 .column1 .box .cols2 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_25_75 .column2 .cols2 .listItem{width:<%=pw75column - rd(((pw75column - colPad) / 2) + colPad)%>px;}
.template_2_Columns_25_75 .column2 .cols2 .rowMargin{width:<%=rd((pw75column - colPad) / 2)%>px;}
.template_2_Columns_25_75 .column2 .box .cols2 .listItem{width:<%=pw75column - (boxPad * 2) - rd(((pw75column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_2_Columns_25_75 .column2 .box .cols2 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - colPad) / 2)%>px;}

.template_2_Columns_25_75 .column1 .cols3 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_25_75 .column1 .cols3 .rowMargin{width:<%=rd((pw25column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_25_75 .column1 .box .cols3 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_25_75 .column1 .box .cols3 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_25_75 .column2 .cols3 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_25_75 .column2 .cols3 .rowMargin{width:<%=rd((pw75column - (colPad * 2)) / 3)%>px;}
.template_2_Columns_25_75 .column2 .box .cols3 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_2_Columns_25_75 .column2 .box .cols3 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_2_Columns_25_75 .column1 .cols4 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_25_75 .column1 .cols4 .rowMargin{width:<%=rd((pw25column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_25_75 .column1 .box .cols4 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_25_75 .column1 .box .cols4 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_25_75 .column2 .cols4 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_25_75 .column2 .cols4 .rowMargin{width:<%=rd((pw75column - (colPad * 3)) / 4)%>px;}
.template_2_Columns_25_75 .column2 .box .cols4 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_2_Columns_25_75 .column2 .box .cols4 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_25_75 .column1 .cols5 .listItem{width:<%=pw25column - ((rd((pw25column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_25_75 .column1 .cols5 .rowMargin{width:<%=rd((pw25column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_25_75 .column1 .box .cols5 .listItem{width:<%=pw25column - (boxPad * 2) - ((rd((pw25column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_25_75 .column1 .box .cols5 .rowMargin{width:<%=rd((pw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_2_Columns_25_75 .column2 .cols5 .listItem{width:<%=pw75column - ((rd((pw75column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_25_75 .column2 .cols5 .rowMargin{width:<%=rd((pw75column - (colPad * 4)) / 5)%>px;}
.template_2_Columns_25_75 .column2 .box .cols5 .listItem{width:<%=pw75column - (boxPad * 2) - ((rd((pw75column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_2_Columns_25_75 .column2 .box .cols5 .rowMargin{width:<%=rd((pw75column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 4 column widths*/
.template_4_Columns .column1{float: left;width:<%=pw4column%>px;margin-right: <%=colPad%>px;}
.template_4_Columns .column2{float: left;width:<%=pw4column%>px;margin-right: <%=colPad%>px;}
.template_4_Columns .column3{float: left;width:<%=pw4column%>px;margin-right: <%=colPad%>px;}
.template_4_Columns .column4{float: left;width:<%=pw4columnLast%>px;}

.template_4_Columns .cols2 .listItem{width:<%=pw4column - rd(((pw4column - colPad) / 2) + colPad)%>px;}
.template_4_Columns .cols2 .rowMargin{width:<%=rd((pw4column - colPad) / 2)%>px;}
.template_4_Columns .box .cols2 .listItem{width:<%=pw4column - (boxPad * 2) - rd(((pw4column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_4_Columns .box .cols2 .rowMargin{width:<%=rd((pw4column - (boxPad * 2) - colPad) / 2)%>px;}
.template_4_Columns .column4 .cols2 .listItem{width:<%=pw4columnLast - rd(((pw4columnLast - colPad) / 2) + colPad)%>px;}
.template_4_Columns .column4 .cols2 .rowMargin{width:<%=rd((pw4columnLast - colPad) / 2)%>px;}
.template_4_Columns .column4 .box .cols2 .listItem{width:<%=pw4columnLast - (boxPad * 2) - rd(((pw4columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template_4_Columns .column4 .box .cols2 .rowMargin{width:<%=rd((pw4columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.template_4_Columns .cols3 .listItem{width:<%=pw4column - ((rd((pw4column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_4_Columns .cols3 .rowMargin{width:<%=rd((pw4column - (colPad * 2)) / 3)%>px;}
.template_4_Columns .box .cols3 .listItem{width:<%=pw4column - (boxPad * 2) - ((rd((pw4column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_4_Columns .box .cols3 .rowMargin{width:<%=rd((pw4column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}
.template_4_Columns .column4 .cols3 .listItem{width:<%=pw4columnLast - ((rd((pw4columnLast - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_4_Columns .column4 .cols3 .rowMargin{width:<%=rd((pw4columnLast - (colPad * 2)) / 3)%>px;}
.template_4_Columns .column4 .box .cols3 .listItem{width:<%=pw4columnLast - (boxPad * 2) - ((rd((pw4columnLast - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.template_4_Columns .column4 .box .cols3 .rowMargin{width:<%=rd((pw4columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template_4_Columns .cols4 .listItem{width:<%=pw4column - ((rd((pw4column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_4_Columns .cols4 .rowMargin{width:<%=rd((pw4column - (colPad * 3)) / 4)%>px;}
.template_4_Columns .box .cols4 .listItem{width:<%=pw4column - (boxPad * 2) - ((rd((pw4column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_4_Columns .box .cols4 .rowMargin{width:<%=rd((pw4column - (boxPad * 2) - (colPad * 3)) / 3)%>px;}
.template_4_Columns .column4 .cols4 .listItem{width:<%=pw4columnLast - ((rd((pw4columnLast - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_4_Columns .column4 .cols4 .rowMargin{width:<%=rd((pw4columnLast - (colPad * 3)) / 4)%>px;}
.template_4_Columns .column4 .box .cols4 .listItem{width:<%=pw4columnLast - (boxPad * 2) - ((rd((pw4columnLast - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.template_4_Columns .column4 .box .cols4 .rowMargin{width:<%=rd((pw4columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template_4_Columns .cols5 .listItem{width:<%=pw4column - ((rd((pw4column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_4_Columns .cols5 .rowMargin{width:<%=rd((pw4column - (colPad * 4)) / 5)%>px;}
.template_4_Columns .box .cols5 .listItem{width:<%=pw4column - (boxPad * 2) - ((rd((pw4column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_4_Columns .box .cols5 .rowMargin{width:<%=rd((pw4column - (boxPad * 2) - (colPad * 4)) / 3)%>px;}
.template_4_Columns .column4 .cols5 .listItem{width:<%=pw4columnLast - ((rd((pw4columnLast - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_4_Columns .column4 .cols5 .rowMargin{width:<%=rd((pw4columnLast - (colPad * 4)) / 5)%>px;}
.template_4_Columns .column4 .box .cols5 .listItem{width:<%=pw4columnLast - (boxPad * 2) - ((rd((pw4columnLast - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.template_4_Columns .column4 .box .cols5 .rowMargin{width:<%=rd((pw4columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* HEADER AND FOOTER ELEMENTS */

.template #header .cols2 .listItem{width:<%=pageWidth - rd(((pageWidth - colPad) / 2) + colPad)%>px;}

.template #header .cols2 .box{width:<%=pageWidth - rd((pageWidth / 2)) - colPad %>px;}
.template #header .cols2 .rowMargin{width:<%=rd((pageWidth - (colPad *2)) / 2)%>px;}

.template #header .cols3 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template #header .cols3 .rowMargin{width:<%=rd((pageWidth - (colPad * 2)) / 3)%>px;}

.template #header .cols4 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template #header .cols4 .rowMargin{width:<%=rd((pageWidth - (colPad * 3)) / 4)%>px;}

.template #header .cols5 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template #header .cols5 .rowMargin{width:<%=rd((pageWidth - (colPad * 4)) / 5)%>px;}

.template #header .box .cols2 .listItem{width:<%=(pageWidth - (boxPad * 2)) - rd(((pageWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template #header .box .cols2 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - colPad) / 2)%>px;}

.template #header .box .cols3 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template #header .box .cols3 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template #header .box .cols4 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template #header .box .cols4 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template #header .box .cols5 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template #header .box .cols5 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

.template #footer .cols2 .listItem{width:<%=pageWidth - rd(((pageWidth - colPad) / 2) + colPad)%>px;}
.template #footer .cols2 .rowMargin{width:<%=rd((pageWidth - colPad) / 2)%>px;}

.template #footer .cols3 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template #footer .cols3 .rowMargin{width:<%=rd((pageWidth - (colPad * 2)) / 3)%>px;}

.template #footer .cols4 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template #footer .cols4 .rowMargin{width:<%=rd((pageWidth - (colPad * 3)) / 4)%>px;}

.template #footer .cols5 .listItem{width:<%=pageWidth - ((rd((pageWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template #footer .cols5 .rowMargin{width:<%=rd((pageWidth - (colPad * 4)) / 5)%>px;}

.template #footer .box .cols2 .listItem{width:<%=(pageWidth - (boxPad * 2)) - rd(((pageWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.template #footer .box .cols2 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - colPad) / 2)%>px;}

.template #footer .box .cols3 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.template #footer .box .cols3 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.template #footer .box .cols4 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.template #footer .box .cols4 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.template #footer .box .cols5 .listItem{width:<%=pageWidth - (boxPad * 2) - ((rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.template #footer .box .cols5 .rowMargin{width:<%=rd((pageWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* FORM ELEMENT WIDTH CALCULATIONS */

.template_4_Columns input.textbox,
.template_4_Columns textarea.textarea,
.template_4_Columns select
{width: <%=rd(((pageWidth / 4) - (boxPad * 4) - 3))%>px}

.template_4_Columns .box input.textbox,
.template_4_Columns .box textarea.textarea,
.template_4_Columns .box select
{width: <%=rd(((pageWidth / 4) - (boxPad * 5) - 3))%>px}

.template_3_Columns_50_25_25 .column2 input.textbox,
.template_3_Columns_50_25_25 .column2 textarea.textarea,
.template_3_Columns_50_25_25 .column2 select,
.template_3_Columns_50_25_25 .column3 input.textbox,
.template_3_Columns_50_25_25 .column3 textarea.textarea,
.template_3_Columns_50_25_25 .column3 select
{width: <%=rd(((pageWidth / 4) - (boxPad * 3) - 3))%>px}

.template_3_Columns_50_25_25 .column2 .box input.textbox,
.template_3_Columns_50_25_25 .column2 .box textarea.textarea,
.template_3_Columns_50_25_25 .column2 .box select,
.template_3_Columns_50_25_25 .column3 .box input.textbox,
.template_3_Columns_50_25_25 .column3 .box textarea.textarea,
.template_3_Columns_50_25_25 .column3 .box select
{width: <%=rd(((pageWidth / 4) - (boxPad * 5) - 3))%>px}

.template_3_Columns input.textbox,
.template_3_Columns textarea.textarea,
.template_3_Columns select
{width: <%=rd(((pageWidth / 3) - (boxPad * 3) - 3))%>px}

.template_3_Columns .box input.textbox,
.template_3_Columns .box textarea.textarea,
.template_3_Columns .box select
{width: <%=rd(((pageWidth / 3) - (boxPad * 5) - 3))%>px}

.template_3_Columns_50_25_25 .column1 input.textbox,
.template_3_Columns_50_25_25 .column1 textarea.textarea,
.template_3_Columns_25_25_50 .column3 input.textbox,
.template_3_Columns_25_25_50 .column3 textarea.textarea,
.template_2_Columns .column1 input.textbox,
.template_2_Columns .column1 textarea.textarea,
.template_2_Columns .column2 input.textbox,
.template_2_Columns .column2 textarea.textarea
{width: <%=rd(((pw50column) - (boxPad * 2) - 10))%>px}

.template_3_Columns_50_25_25 .column1 .box input.textbox,
.template_3_Columns_50_25_25 .column1 .box textarea.textarea,
.template_3_Columns_25_25_50 .column3 .box input.textbox,
.template_3_Columns_25_25_50 .column3 .box textarea.textarea,
.template_2_Columns .column1 .box input.textbox,
.template_2_Columns .column1 .box textarea.textarea,
.template_2_Columns .column2 .box input.textbox,
.template_2_Columns .column2 .box textarea.textarea
{width: <%=rd(((pw50column) - (boxPad * 4) - 10))%>px}

.template_2_Columns_66_33 .column1 input.textbox,
.template_2_Columns_66_33 .column1 textarea.textarea,
.template_2_Columns_33_66 .column2 input.textbox,
.template_2_Columns_33_66 .column2 textarea.textarea
{width:<%=rd(pwGrv(1) - (boxPad * 2) - 3)%>px}

.template_2_Columns_66_33 .column1 .box input.textbox,
.template_2_Columns_66_33 .column1 .box textarea.textarea,
.template_2_Columns_33_66 .column2 .box input.textbox,
.template_2_Columns_33_66 .column2 .box textarea.textarea
{width:<%=rd(pwGrv(1) - (boxPad * 5) - 3)%>px}

.template_2_Columns_66_33 .column2 input.textbox,
.template_2_Columns_66_33 .column2 textarea.textarea,
.template_2_Columns_33_66 .column1 input.textbox,
.template_2_Columns_33_66 .column1 textarea.textarea
{width:<%=rd(pwGrv(2) - (boxPad * 2) - 3)%>px}

.template_2_Columns_66_33 .column2 .box input.textbox,
.template_2_Columns_66_33 .column2 .box textarea.textarea,
.template_2_Columns_33_66 .column1 .box input.textbox,
.template_2_Columns_33_66 .column1 .box textarea.textarea
{width:<%=rd(pwGrv(2) - (boxPad * 4) - 3)%>px}

.template_2_Columns_75_25 .column1 input.textbox,
.template_2_Columns_75_25 .column1 textarea.textarea,
.template_2_Columns_25_75 .column2 input.textbox,
.template_2_Columns_25_75 .column2 textarea.textarea
{width:<%=rd(pw75column - (boxPad * 2))%>px}

.template_2_Columns_75_25 .column1 .box input.textbox,
.template_2_Columns_75_25 .column1 .box textarea.textarea,
.template_2_Columns_25_75 .column2 .box input.textbox,
.template_2_Columns_25_75 .column2 .box textarea.textarea
{width:<%=rd(pw75column - (boxPad * 4))%>px}

.template_2_Columns_75_25 .column2 input.textbox,
.template_2_Columns_75_25 .column2 textarea.textarea,
.template_2_Columns_25_75 .column1 input.textbox,
.template_2_Columns_25_75 .column1 textarea.textarea
{width:<%=rd(pw25column - (boxPad * 2))%>px}

.template_2_Columns_75_25 .column2 .box input.textbox,
.template_2_Columns_75_25 .column2 .box textarea.textarea,
.template_2_Columns_25_75 .column1 .box input.textbox,
.template_2_Columns_25_75 .column1 .box textarea.textarea
{width:<%=rd(pw25column - (boxPad * 4))%>px}


#header .ewXform fieldset.inline li,
#footer .ewXform fieldset.inline li,
{width:48%;}

#header input.textbox,
#header textarea.textarea,
.template_1_Column input.textbox,
.template_1_Column textarea.textarea,
#footer input.textbox,
#footer textarea.textarea
{width:<%=rd(pageWidth - 5)%>px}

.fullwidth #header input.textbox,
.fullwidth #header textarea.textarea,
.fullwidth .template_1_Column input.textbox,
.fullwidth .template_1_Column textarea.textarea,
.fullwidth #footer input.textbox,
.fullwidth #footer textarea.TextArea
{width:<%=rd(fullWidth - boxpad - 5)%>px}

.fullwidth #header .box input.textbox,
.fullwidth #header .box textarea.textarea,
.fullwidth .template_1_Column .box  input.textbox,
.fullwidth .template_1_Column .box textarea.textarea,
.fullwidth #footer .box input.textbox,
.fullwidth #footer .box textarea.TextArea
{width:<%=rd(fullWidth - (boxPad * 4) - 5)%>px}

.template_1_Column .box input.textbox,
.template_1_Column .box textarea.textarea,
#header .box input.textbox,
#header .box textarea.textarea,
#footer .box input.textbox,
#footer .box textarea.textarea
{width:<%=rd(pageWidth - (boxPad * 4) - 5)%>px}

.template_1_Column .inline input.short,
.template_1_Column .inline textarea.short,
#header fieldset.inline input.textbox,
#header fieldset.inline textarea.short,
#footer fieldset.inline input.textbox,
#footer fieldset.inline textarea.textarea,
#cartFull .box fieldset.cols2 input.textbox,
#cartFull .box fieldset.cols2 textarea.textarea,
#cartFull fieldset.inline input.textbox,
#cartFull fieldset.inline textarea.textarea
{width:<%=rd((pageWidth / 2) - (boxPad * 4) - 3)%>px}

.fullwidth .template_1_Column fieldset.inline input.short,
.fullwidth .template_1_Column fieldset.inline select,
.fullwidth .template_1_Column fieldset.inline textarea.short,
.fullwidth #header fieldset.inline input.textbox,
.fullwidth #header fieldset.inline textarea.textarea,
.fullwidth #footer fieldset.inline input.textbox,
.fullwidth #footer fieldset.inline textarea.textarea,
.fullwidth #cartFull .box fieldset.cols2 input.textbox,
.fullwidth #cartFull .box fieldset.cols2 textarea.textarea,
.fullwidth #cartFull fieldset.inline input.textbox,
.fullwidth #cartFull fieldset.inline textarea.textarea
{width:<%=rd((fullWidth / 2) - (boxPad * 3) - 3)%>px}

.fullwidth .template_1_Column .box fieldset.inline input.short,
.fullwidth .template_1_Column .box fieldset.inline select,
.fullwidth .template_1_Column .box fieldset.inline textarea.short,
.fullwidth #header .box fieldset.inline input.textbox,
.fullwidth #header .box fieldset.inline textarea.textarea,
.fullwidth #footer .box fieldset.inline input.textbox,
.fullwidth #footer .box fieldset.inline textarea.textarea,
.fullwidth #cartFull .box fieldset.inline input.textbox,
.fullwidth #cartFull .box fieldset.inline textarea.textarea
{width:<%=rd((fullWidth / 2) - (boxPad * 5) - 3)%>px}


.Site #mainLayout .ewXform fieldset.inline ol li
{padding-right:<%=boxPad * 1 %>px}


#header .box input.textbox,
#header .box textarea.textarea,
#footer .box input.textbox,
#footer .box textarea.textarea
{width:<%=rd(pageWidth - (boxPad * 4) - 3)%>px}

.template_1_Column .box fieldset.inline input.textbox,
.template_1_Column .box fieldset.inline textarea.textarea,
#header .box fieldset.inline input.textbox,
#header .box fieldset.inline textarea.textarea,
#footer .box fieldset.inline input.textbox,
#footer .box fieldset.inline textarea.textarea
{width:<%=rd((pageWidth / 2) - (boxPad * 4) - 3)%>px}

/* FULL WIDTH COLUMN CALCULATIONS */
.fullwidth .cols2 .listItem{width:<%=fullWidth - rd(((fullWidth - colPad) / 2) + colPad)%>px;}
.fullwidth .cols2 .rowMargin{width:<%=rd((fullWidth - colPad) / 2)%>px;}

.fullwidth .cols3 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .cols3 .rowMargin{width:<%=rd((fullWidth - (colPad * 2)) / 3)%>px;}

.fullwidth .cols4 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .cols4 .rowMargin{width:<%=rd((fullWidth - (colPad * 3)) / 4)%>px;}

.fullwidth .cols5 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .cols5 .rowMargin{width:<%=rd((fullWidth - (colPad * 4)) / 5)%>px;}

.fullwidth .box .cols2 .listItem{width:<%=(fullWidth - (boxPad * 2)) - rd(((fullWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .box .cols2 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .box .cols3 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .box .cols3 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .box .cols4 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .box .cols4 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .box .cols5 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .box .cols5 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 50% Columns */
.fullwidth .template_2_Columns .column1 {float:left;width:<%=fw50column%>px;margin-right:<%=rd(colPad)%>px;}
.fullwidth .template_2_Columns .column2 {float:left;width:<%=fw50columnLast%>px;}

.fullwidth .template_2_Columns .column1 .cols2 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols2 .listItem{width:<%=fw50column - rd(((fw50column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols2 .listItem,
.fullwidth .template_2_Columns .column2 .cols2 .listItem{width:<%=fw50columnLast - rd(((fw50columnLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns .column1 .cols2 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols2 .rowMargin{width: <%=rd((fw50column - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols2 .rowMargin,
.fullwidth .template_2_Columns .column2 .cols2 .rowMargin{width: <%=rd((fw50columnLast - colPad) / 2)%>px;}

.fullwidth .template_2_Columns .column1 .box .cols2 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols2 .listItem{width:<%=(fw50column - (boxPad * 2)) - rd(((fw50column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols2 .listItem,
.fullwidth .template_2_Columns .column2 .box .cols2 .listItem{width:<%=(fw50columnLast - (boxPad * 2)) - rd(((fw50columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns .column1 .box .cols2 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols2 .rowMargin{width: <%=rd((fw50column - (boxPad * 2) - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols2 .rowMargin,
.fullwidth .template_2_Columns .column2 .box .cols2 .rowMargin{width: <%=rd((fw50columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns .column1 .cols3 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols3 .listItem{width: <%=fw50column - ((rd((fw50column - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols3 .listItem,
.fullwidth .template_2_Columns .column2 .cols3 .listItem{width: <%=fw50columnLast - ((rd((fw50columnLast - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template_2_Columns .column1 .cols3 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols3 .rowMargin{width: <%=rd((fw50column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols3 .rowMargin,
.fullwidth .template_2_Columns .column2 .cols3 .rowMargin{width: <%=rd((fw50columnLast - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns .column1 .box .cols3 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols3 .listItem{width: <%=fw50column - (boxPad * 2) - ((rd((fw50column - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols3 .listItem,
.fullwidth .template_2_Columns .column2 .box .cols3 .listItem{width: <%=fw50columnLast - (boxPad * 2) - ((rd((fw50columnLast - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template_2_Columns .column1 .box .cols3 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols3 .rowMargin{width: <%=rd((fw50column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols3 .rowMargin,
.fullwidth .template_2_Columns .column2 .box .cols3 .rowMargin{width:<%=rd((fw50columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns .column1 .cols4 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols4 .listItem{width: <%=fw50column - ((rd((fw50column - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols4 .listItem,
.fullwidth .template_2_Columns .column2 .cols4 .listItem{width: <%=fw50columnLast - ((rd((fw50columnLast - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template_2_Columns .column1 .cols4 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols4 .rowMargin{width: <%=rd((fw50column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols4 .rowMargin,
.fullwidth .template_2_Columns .column2 .cols4 .rowMargin{width:<%=rd((fw50columnLast - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns .column1 .box .cols4 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols4 .listItem{width: <%=fw50column - (boxPad * 2) - ((rd((fw50column - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols4 .listItem,
.fullwidth .template_2_Columns .column2 .box .cols4 .listItem{width: <%=fw50columnLast - (boxPad * 2) - ((rd((fw50columnLast - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template_2_Columns .column1 .box .cols4 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols4 .rowMargin{width: <%=rd((fw50column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols4 .rowMargin,
.fullwidth .template_2_Columns .column2 .box .cols4 .rowMargin{width:<%=rd((fw50columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns .column1 .cols5 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols5 .listItem{width: <%=fw50column - ((rd((fw50column - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols5 .listItem,
.fullwidth .template_2_Columns .column2 .cols5 .listItem{width: <%=fw50columnLast - ((rd((fw50columnLast - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template_2_Columns .column1 .cols5 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .cols5 .rowMargin{width: <%=rd((fw50column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .cols5 .rowMargin,
.fullwidth .template_2_Columns .column2 .cols5 .rowMargin{width:<%=rd((fw50columnLast - (colPad * 4)) / 5)%>px;}

.fullwidth .template_2_Columns .column1 .box .cols5 .listItem,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols5 .listItem{width: <%=fw50column - (boxPad * 2) - ((rd((fw50column - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols5 .listItem,
.fullwidth .template_2_Columns .column2 .box .cols5 .listItem{width: <%=fw50columnLast - (boxPad * 2) - ((rd((fw50columnLast - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template_2_Columns .column1 .box .cols5 .rowMargin,
.fullwidth .template_3_Columns_50_25_25 .column1 .box .cols5 .rowMargin{width: <%=rd((fw50column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3 .box .cols5 .rowMargin,
.fullwidth .template_2_Columns .column2 .box .cols5 .rowMargin{width:<%=rd((fw50columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 66% columns */
.fullwidth .template_2_Columns_66_33 .column1{float: left;width: <%=fw66column%>px;margin-right: <%=rd(colPad)%>px;}
.fullwidth .template_2_Columns_66_33 .column2{float: left;width: <%=fw33column%>px;}

.fullwidth .template_2_Columns_66_33 .column1 .cols2 .listItem{width:<%=fw66column - rd(((fw66column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .cols2 .rowMargin{width:<%=rd((fw66column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols2 .listItem{width:<%=fw66column - (boxPad * 2) - rd(((fw66column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols2 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_33_66 .column2 .cols2 .listItem{width:<%=fw66column - rd(((fw66column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .cols2 .rowMargin{width:<%=rd((fw66column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols2 .listItem{width:<%=fw66column - (boxPad * 2) - rd(((fw66column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols2 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_66_33 .column1 .cols3 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .cols3 .rowMargin{width:<%=rd((fw66column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols3 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols3 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_33_66 .column2 .cols3 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .cols3 .rowMargin{width:<%=rd((fw66column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols3 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols3 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_66_33 .column1 .cols4 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .cols4 .rowMargin{width:<%=rd((fw66column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols4 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols4 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_33_66 .column2 .cols4 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .cols4 .rowMargin{width:<%=rd((fw66column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols4 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols4 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_66_33 .column1 .cols5 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .cols5 .rowMargin{width:<%=rd((fw66column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols5 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_66_33 .column1 .box .cols5 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_33_66 .column2 .cols5 .listItem{width:<%=fw66column - ((rd((fw66column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .cols5 .rowMargin{width:<%=rd((fw66column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols5 .listItem{width:<%=fw66column - (boxPad * 2) - ((rd((fw66column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_33_66 .column2 .box .cols5 .rowMargin{width:<%=rd((fw66column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}


/* 33% columns */
.fullwidth .template_2_Columns_33_66 .column1{float: left;width: <%=fw33column%>px;margin-right: <%=rd(colPad)%>px;}
.fullwidth .template_2_Columns_33_66 .column2{float: left;width: <%=fw66column%>px;}

.fullwidth .template_2_Columns_33_66 .column1 .cols2 .listItem{width:<%=fw33column - rd(((fw33column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .cols2 .rowMargin{width:<%=rd((fw33column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols2 .listItem{width:<%=fw33column - (boxPad * 2) - rd(((fw33column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols2 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_66_33 .column2 .cols2 .listItem{width:<%=fw33column - rd(((fw33column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .cols2 .rowMargin{width:<%=rd((fw33column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols2 .listItem{width:<%=fw33column - (boxPad * 2) - rd(((fw33column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols2 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_33_66 .column1 .cols3 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .cols3 .rowMargin{width:<%=rd((fw33column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols3 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols3 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_66_33 .column2 .cols3 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .cols3 .rowMargin{width:<%=rd((fw33column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols3 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols3 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_33_66 .column1 .cols4 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .cols4 .rowMargin{width:<%=rd((fw33column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols4 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols4 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_66_33 .column2 .cols4 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .cols4 .rowMargin{width:<%=rd((fw33column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols4 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols4 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_33_66 .column1 .cols5 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .cols5 .rowMargin{width:<%=rd((fw33column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols5 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_33_66 .column1 .box .cols5 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

.fullwidth .template_2_Columns_66_33 .column2 .cols5 .listItem{width:<%=fw33column - ((rd((fw33column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .cols5 .rowMargin{width:<%=rd((fw33column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols5 .listItem{width:<%=fw33column - (boxPad * 2) - ((rd((fw33column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_66_33 .column2 .box .cols5 .rowMargin{width:<%=rd((fw33column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 3 column widths (true 33%)*/
.fullwidth .template_3_Columns .column1{float: left;width:<%=fw3column%>px;margin-right: <%=colPad%>px;}
.fullwidth .template_3_Columns .column2{float: left;width:<%=fw3column%>px;margin-right: <%=colPad%>px;}
.fullwidth .template_3_Columns .column3{float: left;width:<%=fw3columnLast%>px;}

.fullwidth .template_3_Columns .cols2 .listItem{width:<%=fw3column - rd(((fw3column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns .cols2 .rowMargin{width:<%=rd((fw3column - colPad) / 2)%>px;}
.fullwidth .template_3_Columns .box .cols2 .listItem{width:<%=fw3column - (boxPad * 2) - rd(((fw3column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns .box .cols2 .rowMargin{width:<%=rd((fw3column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_3_Columns .column3 .cols2 .listItem{width:<%=fw3columnLast - rd(((fw3columnLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns .column3 .cols2 .rowMargin{width:<%=rd((fw3columnLast - colPad) / 2)%>px;}
.fullwidth .template_3_Columns .column3 .box .cols2 .listItem{width:<%=fw3columnLast - (boxPad * 2) - rd(((fw3columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns .column3 .box .cols2 .rowMargin{width:<%=rd((fw3columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_3_Columns .cols3 .listItem{width:<%=fw3column - ((rd((fw3column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_3_Columns .cols3 .rowMargin{width:<%=rd((fw3column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_3_Columns .box .cols3 .listItem{width:<%=fw3column - (boxPad * 2) - ((rd((fw3column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_3_Columns .box .cols3 .rowMargin{width:<%=rd((fw3column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_3_Columns .column3 .cols3 .listItem{width:<%=fw3columnLast - ((rd((fw3columnLast - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_3_Columns .column3 .cols3 .rowMargin{width:<%=rd((fw3columnLast - (colPad * 2)) / 3)%>px;}
.fullwidth .template_3_Columns .column3 .box .cols3 .listItem{width:<%=fw3columnLast - (boxPad * 2) - ((rd((fw3columnLast - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_3_Columns .column3 .box .cols3 .rowMargin{width:<%=rd((fw3columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_3_Columns .cols4 .listItem{width:<%=fw3column - ((rd((fw3column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_3_Columns .cols4 .rowMargin{width:<%=rd((fw3column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_3_Columns .box .cols4 .listItem{width:<%=fw3column - (boxPad * 2) - ((rd((fw3column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_3_Columns .box .cols4 .rowMargin{width:<%=rd((fw3column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_3_Columns .column3 .cols4 .listItem{width:<%=fw3columnLast - ((rd((fw3columnLast - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_3_Columns .column3 .cols4 .rowMargin{width:<%=rd((fw3columnLast - (colPad * 3)) / 4)%>px;}
.fullwidth .template_3_Columns .column3 .box .cols4 .listItem{width:<%=fw3columnLast - (boxPad * 2) - ((rd((fw3columnLast - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_3_Columns .column3 .box .cols4 .rowMargin{width:<%=rd((fw3columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_3_Columns .cols5 .listItem{width:<%=fw3column - ((rd((fw3column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_3_Columns .cols5 .rowMargin{width:<%=rd((fw3column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_3_Columns .box .cols5 .listItem{width:<%=fw3column - (boxPad * 2) - ((rd((fw3column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_3_Columns .box .cols5 .rowMargin{width:<%=rd((fw3column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

.fullwidth .template_3_Columns .column3 .cols5 .listItem{width:<%=fw3columnLast - ((rd((fw3columnLast - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_3_Columns .column3 .cols5 .rowMargin{width:<%=rd((fw3columnLast - (colPad * 4)) / 5)%>px;}
.fullwidth .template_3_Columns .column3 .box .cols5 .listItem{width:<%=fw3columnLast - (boxPad * 2) - ((rd((fw3columnLast - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_3_Columns .column3 .box .cols5 .rowMargin{width:<%=rd((fw3columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 25% column widths */
.fullwidth .template_3_Columns_50_25_25 .column1{float:left;width:<%=fw50column%>px;margin-right:<%=colPad%>px;}
.fullwidth .template_3_Columns_50_25_25 .column2{float:left;width:<%=fw25columnLast%>px;margin-right:<%=colPad%>px;}
.fullwidth .template_3_Columns_50_25_25 .column3{float:left;width:<%=fw25columnLastLast%>px;}

.fullwidth .template_3_Columns_25_25_50 .column1{float: left;width: <%=fw25columnFirst%>px;margin-right:<%=colPad%>px;}
.fullwidth .template_3_Columns_25_25_50 .column2{float: left;width: <%=fw25columnFirstLast%>px;margin-right:<%=colPad%>px;}
.fullwidth .template_3_Columns_25_25_50 .column3{float: left;width: <%=fw50columnLast%>px}

.fullwidth .template_3_Columns_25_25_50 .column1 .cols2 .listItem{width:<%=fw25columnFirst - rd(((fw25columnFirst - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column2 .cols2 .listItem{width:<%=fw25columnFirstLast - rd(((fw25columnFirstLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column1 .cols2 .rowMargin{width:<%=rd((fw25columnFirst - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column2 .cols2 .rowMargin{width:<%=rd((fw25columnFirstLast - colPad) / 2)%>px;}

.fullwidth .template_3_Columns_25_25_50 .column1 .box .cols2 .listItem{width:<%=fw25columnFirst - (boxPad * 2) - (rd((fw25columnFirst - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column2 .box .cols2 .listItem{width:<%=fw25columnFirstLast - (boxPad * 2) - (rd((fw25columnFirstLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column1 .box .cols2 .rowMargin{width:<%=rd((fw25columnFirst - (boxPad * 2) - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_25_25_50 .column2 .box .cols2 .rowMargin{width:<%=rd((fw25columnFirstLast - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_3_Columns_50_25_25 .column2 .cols2 .listItem{width:<%=fw25columnLast - rd(((fw25columnLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column3 .cols2 .listItem{width:<%=fw25columnLastLast - rd(((fw25columnLastLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column2 .cols2 .rowMargin{width:<%=rd((fw25columnLast - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column3 .cols2 .rowMargin{width:<%=rd((fw25columnLastLast - colPad) / 2)%>px;}

.fullwidth .template_3_Columns_50_25_25 .column2 .box .cols2 .listItem{width:<%=fw25columnLast - (boxPad * 2) - (rd((fw25columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column3 .box .cols2 .listItem{width:<%=fw25columnLastLast - (boxPad * 2) - (rd((fw25columnLastLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column2 .box .cols2 .rowMargin{width:<%=rd((fw25columnLast - (boxPad * 2) - colPad) / 2)%>px;}
.fullwidth .template_3_Columns_50_25_25 .column3 .box .cols2 .rowMargin{width:<%=rd((fw25columnLastLast - (boxPad * 2) - colPad) / 2)%>px;}

/* 75% / 25% column widths */
.fullwidth .template_2_Columns_75_25 .column1{float: left;width: <%=fw75column%>px;margin-right: <%=rd(colPad)%>px;}
.fullwidth .template_2_Columns_75_25 .column2{float: left;width: <%=fw25column%>px;}

.fullwidth .template_2_Columns_75_25 .column1 .cols2 .listItem{width:<%=fw75column - rd(((fw75column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .cols2 .rowMargin{width:<%=rd((fw75column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols2 .listItem{width:<%=fw75column - (boxPad * 2) - rd(((fw75column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols2 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_75_25 .column2 .cols2 .listItem{width:<%=fw25column - rd(((fw25column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .cols2 .rowMargin{width:<%=rd((fw25column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols2 .listItem{width:<%=fw25column - (boxPad * 2) - rd(((fw25column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols2 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_75_25 .column1 .cols3 .listItem{width:<%= fw75column - ((rd((fw75column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .cols3 .rowMargin{width:<%=rd((fw75column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols3 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols3 .rowMargin{width:<%=rd(((fw75column - (boxPad * 2)) - (colPad * 2)) / 3)%>px;} 

.fullwidth .template_2_Columns_75_25 .column2 .cols3 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .cols3 .rowMargin{width:<%=rd((fw25column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols3 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols3 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_75_25 .column1 .cols4 .listItem{width:<%=fw75column - ((rd((fw75column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .cols4 .rowMargin{width:<%=rd((fw75column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols4 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols4 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_75_25 .column2 .cols4 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .cols4 .rowMargin{width:<%=rd((fw25column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols4 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols4 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_75_25 .column1 .cols5 .listItem{width:<%=fw75column - ((rd((fw75column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .cols5 .rowMargin{width:<%=rd((fw75column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols5 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_75_25 .column1 .box .cols5 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_75_25 .column2 .cols5 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .cols5 .rowMargin{width:<%=rd((fw25column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols5 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_75_25 .column2 .box .cols5 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 25% / 75% column widths */
.fullwidth .template_2_Columns_25_75 .column1{float: left;width: <%=fw25column%>px;margin-right: <%=rd(colPad)%>px;}
.fullwidth .template_2_Columns_25_75 .column2{float: left;width: <%=fw75column%>px;}

.fullwidth .template_2_Columns_25_75 .column1 .cols2 .listItem{width:<%=fw25column - rd(((fw25column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .cols2 .rowMargin{width:<%=rd((fw25column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols2 .listItem{width:<%=fw25column - (boxPad * 2) - rd(((fw25column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols2 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_25_75 .column2 .cols2 .listItem{width:<%=fw75column - rd(((fw75column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .cols2 .rowMargin{width:<%=rd((fw75column - colPad) / 2)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols2 .listItem{width:<%=fw75column - (boxPad * 2) - rd(((fw75column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols2 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_2_Columns_25_75 .column1 .cols3 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .cols3 .rowMargin{width:<%=rd((fw25column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols3 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols3 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_25_75 .column2 .cols3 .listItem{width:<%=fw75column - ((rd((fw75column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .cols3 .rowMargin{width:<%=rd((fw75column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols3 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols3 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_2_Columns_25_75 .column1 .cols4 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .cols4 .rowMargin{width:<%=rd((fw25column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols4 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols4 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_25_75 .column2 .cols4 .listItem{width:<%=fw75column - ((rd((fw75column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .cols4 .rowMargin{width:<%=rd((fw75column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols4 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols4 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_25_75 .column1 .cols5 .listItem{width:<%=fw25column - ((rd((fw25column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .cols5 .rowMargin{width:<%=rd((fw25column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols5 .listItem{width:<%=fw25column - (boxPad * 2) - ((rd((fw25column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_25_75 .column1 .box .cols5 .rowMargin{width:<%=rd((fw25column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_2_Columns_25_75 .column2 .cols5 .listItem{width:<%=fw75column - ((rd((fw75column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .cols5 .rowMargin{width:<%=rd((fw75column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols5 .listItem{width:<%=fw75column - (boxPad * 2) - ((rd((fw75column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_2_Columns_25_75 .column2 .box .cols5 .rowMargin{width:<%=rd((fw75column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* 4 column widths (true 25%)*/
.fullwidth .template_4_Columns .column1{float: left;width:<%=fw4column%>px;margin-right: <%=colPad%>px;}
.fullwidth .template_4_Columns .column2{float: left;width:<%=fw4column%>px;margin-right: <%=colPad%>px;}
.fullwidth .template_4_Columns .column3{float: left;width:<%=fw4column%>px;margin-right: <%=colPad%>px;}
.fullwidth .template_4_Columns .column4{float: left;width:<%=fw4columnLast%>px;}

.fullwidth .template_4_Columns .cols2 .listItem{width:<%=fw4column - rd(((fw4column - colPad) / 2) + colPad)%>px;}
.fullwidth .template_4_Columns .cols2 .rowMargin{width:<%=rd((fw4column - colPad) / 2)%>px;}
.fullwidth .template_4_Columns .box .cols2 .listItem{width:<%=fw4column - (boxPad * 2) - rd(((fw4column - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_4_Columns .box .cols2 .rowMargin{width:<%=rd((fw4column - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_4_Columns .column4 .cols2 .listItem{width:<%=fw4columnLast - rd(((fw4columnLast - colPad) / 2) + colPad)%>px;}
.fullwidth .template_4_Columns .column4 .cols2 .rowMargin{width:<%=rd((fw4columnLast - colPad) / 2)%>px;}
.fullwidth .template_4_Columns .column4 .box .cols2 .listItem{width:<%=fw4columnLast - (boxPad * 2) - rd(((fw4columnLast - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template_4_Columns .column4 .box .cols2 .rowMargin{width:<%=rd((fw4columnLast - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template_4_Columns .cols3 .listItem{width:<%=fw4column - ((rd((fw4column - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_4_Columns .cols3 .rowMargin{width:<%=rd((fw4column - (colPad * 2)) / 3)%>px;}
.fullwidth .template_4_Columns .box .cols3 .listItem{width:<%=fw4column - (boxPad * 2) - ((rd((fw4column - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_4_Columns .box .cols3 .rowMargin{width:<%=rd((fw4column - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_4_Columns .column4 .cols3 .listItem{width:<%=fw4columnLast - ((rd((fw4columnLast - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_4_Columns .column4 .cols3 .rowMargin{width:<%=rd((fw4columnLast - (colPad * 2)) / 3)%>px;}
.fullwidth .template_4_Columns .column4 .box .cols3 .listItem{width:<%=fw4columnLast - (boxPad * 2) - ((rd((fw4columnLast - (boxPad * 2) - (colPad * 2)) / 3) * 2) + (colPad * 2))%>px;}
.fullwidth .template_4_Columns .column4 .box .cols3 .rowMargin{width:<%=rd((fw4columnLast - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template_4_Columns .cols4 .listItem{width:<%=fw4column - ((rd((fw4column - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_4_Columns .cols4 .rowMargin{width:<%=rd((fw4column - (colPad * 3)) / 4)%>px;}
.fullwidth .template_4_Columns .box .cols4 .listItem{width:<%=fw4column - (boxPad * 2) - ((rd((fw4column - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_4_Columns .box .cols4 .rowMargin{width:<%=rd((fw4column - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_4_Columns .column4 .cols4 .listItem{width:<%=fw4columnLast - ((rd((fw4columnLast - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_4_Columns .column4 .cols4 .rowMargin{width:<%=rd((fw4columnLast - (colPad * 3)) / 4)%>px;}
.fullwidth .template_4_Columns .column4 .box .cols4 .listItem{width:<%=fw4columnLast - (boxPad * 2) - ((rd((fw4columnLast - (boxPad * 2) - (colPad * 3)) / 4) * 3) + (colPad * 3))%>px;}
.fullwidth .template_4_Columns .column4 .box .cols4 .rowMargin{width:<%=rd((fw4columnLast - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template_4_Columns .cols5 .listItem{width:<%=fw4column - ((rd((fw4column - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_4_Columns .cols5 .rowMargin{width:<%=rd((fw4column - (colPad * 4)) / 5)%>px;}
.fullwidth .template_4_Columns .box .cols5 .listItem{width:<%=fw4column - (boxPad * 2) - ((rd((fw4column - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_4_Columns .box .cols5 .rowMargin{width:<%=rd((fw4column - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

.fullwidth .template_4_Columns .column4 .cols5 .listItem{width:<%=fw4columnLast - ((rd((fw4columnLast - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_4_Columns .column4 .cols5 .rowMargin{width:<%=rd((fw4columnLast - (colPad * 4)) / 5)%>px;}
.fullwidth .template_4_Columns .column4 .box .cols5 .listItem{width:<%=fw4columnLast - (boxPad * 2) - ((rd((fw4columnLast - (boxPad * 2) - (colPad * 4)) / 5) * 4) + (colPad * 4))%>px;}
.fullwidth .template_4_Columns .column4 .box .cols5 .rowMargin{width:<%=rd((fw4columnLast - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* HEADER AND FOOTER ELEMENTS */

.fullwidth .template #header .cols2 .listItem{width:<%=fullWidth - rd(((fullWidth - colPad) / 2) + colPad)%>px;}
.fullwidth .template #header .cols2 .rowMargin{width:<%=rd((fullWidth - colPad) / 2)%>px;}

.fullwidth .template #header .cols3 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template #header .cols3 .rowMargin{width:<%=rd((fullWidth - (colPad * 2)) / 3)%>px;}

.fullwidth .template #header .cols4 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template #header .cols4 .rowMargin{width:<%=rd((fullWidth - (colPad * 3)) / 4)%>px;}

.fullwidth .template #header .cols5 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template #header .cols5 .rowMargin{width:<%=rd((fullWidth - (colPad * 4)) / 5)%>px;}

.fullwidth .template #header .box .cols2 .listItem{width:<%=(fullWidth - (boxPad * 2)) - rd(((fullWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template #header .box .cols2 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template #header .box .cols3 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template #header .box .cols3 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template #header .box .cols4 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template #header .box .cols4 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template #header .box .cols5 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template #header .box .cols5 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}


.fullwidth .template #footer .cols2 .listItem{width:<%=fullWidth - rd(((fullWidth - colPad) / 2) + colPad)%>px;}
.fullwidth .template #footer .cols2 .rowMargin{width:<%=rd((fullWidth - colPad) / 2)%>px;}

.fullwidth .template #footer .cols3 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template #footer .cols3 .rowMargin{width:<%=rd((fullWidth - (colPad * 2)) / 3)%>px;}

.fullwidth .template #footer .cols4 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template #footer .cols4 .rowMargin{width:<%=rd((fullWidth - (colPad * 3)) / 4)%>px;}

.fullwidth .template #footer .cols5 .listItem{width:<%=fullWidth - ((rd((fullWidth - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template #footer .cols5 .rowMargin{width:<%=rd((fullWidth - (colPad * 4)) / 5)%>px;}

.fullwidth .template #footer .box .cols2 .listItem{width:<%=(fullWidth - (boxPad * 2)) - rd(((fullWidth - (boxPad * 2) - colPad) / 2) + colPad)%>px;}
.fullwidth .template #footer .box .cols2 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - colPad) / 2)%>px;}

.fullwidth .template #footer .box .cols3 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3) + colPad) * 2)%>px;}
.fullwidth .template #footer .box .cols3 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 2)) / 3)%>px;}

.fullwidth .template #footer .box .cols4 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4) + colPad) * 3)%>px;}
.fullwidth .template #footer .box .cols4 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 3)) / 4)%>px;}

.fullwidth .template #footer .box .cols5 .listItem{width:<%=fullWidth - (boxPad * 2) - ((rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5) + colPad) * 4)%>px;}
.fullwidth .template #footer .box .cols5 .rowMargin{width:<%=rd((fullWidth - (boxPad * 2) - (colPad * 4)) / 5)%>px;}

/* FORM ELEMENT WIDTH CALCULATIONS */
.fullwidth .template_4_Columns input.textbox,
.fullwidth .template_4_Columns textarea.textarea,
.fullwidth .template_4_Columns select
{width: <%=rd(((fullWidth / 4) - (boxPad * 3) - 3))%>px}

.fullwidth .template_4_Columns .box input.textbox,
.fullwidth .template_4_Columns .box textarea.textarea,
.fullwidth .template_4_Columns .box select
{width: <%=rd(((fullWidth / 4) - (boxPad * 5) - 3))%>px}

.fullwidth .template_3_Columns_50_25_25 .column2 input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column2 textarea.textarea,
.fullwidth .template_3_Columns_50_25_25 .column2 select,
.fullwidth .template_3_Columns_50_25_25 .column3 input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column3 textarea.textarea,
.fullwidth .template_3_Columns_50_25_25 .column3 select
{width: <%=rd(((fullWidth / 4) - (boxPad * 3) - 3))%>px}

.fullwidth .template_3_Columns_50_25_25 .column2 .box input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column2 .box textarea.textarea,
.fullwidth .template_3_Columns_50_25_25 .column2 .box select,
.fullwidth .template_3_Columns_50_25_25 .column3 .box input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column3 .box textarea.textarea,
.fullwidth .template_3_Columns_50_25_25 .column3 .box select
{width: <%=rd(((fullWidth / 4) - (boxPad * 5) - 3))%>px}

.fullwidth .template_3_Columns input.textbox,
.fullwidth .template_3_Columns textarea.textarea,
.fullwidth .template_3_Columns select
{width: <%=rd(((fullWidth / 3) - (boxPad * 3) - 3))%>px}

.fullwidth .template_3_Columns .box input.textbox,
.fullwidth .template_3_Columns .box textarea.textarea,
.fullwidth .template_3_Columns .box select
{width: <%=rd(((fullWidth / 3) - (boxPad * 5) - 3))%>px}

.fullwidth .template_3_Columns_50_25_25 .column1 input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column1 textarea.textarea,
.fullwidth .template_3_Columns_25_25_50 .column3 input.textbox,
.fullwidth .template_3_Columns_25_25_50 .column3 textarea.textarea,
.fullwidth .template_2_Columns .column1 input.textbox,
.fullwidth .template_2_Columns .column1 textarea.textarea,
.fullwidth .template_2_Columns .column2 input.textbox,
.fullwidth .template_2_Columns .column2 textarea.textarea
{width: <%=rd(((fullWidth / 2) - (boxPad * 2) - 3))%>px}

.fullwidth .template_3_Columns_50_25_25 .column1 .box input.textbox,
.fullwidth .template_3_Columns_50_25_25 .column1 .box textarea.textarea,
.fullwidth .template_3_Columns_25_25_50 .column3 .box input.textbox,
.fullwidth .template_3_Columns_25_25_50 .column3 .box textarea.textarea,
.fullwidth .template_2_Columns .column1 .box input.textbox,
.fullwidth .template_2_Columns .column1 .box textarea.textarea,
.fullwidth .template_2_Columns .column2 .box input.textbox,
.fullwidth .template_2_Columns .column2 .box textarea.textarea
{width: <%=rd(((fullWidth / 2) - (boxPad * 4) - 3))%>px}

.fullwidth .template_2_Columns_66_33 .column1 input.textbox,
.fullwidth .template_2_Columns_66_33 .column1 textarea.textarea,
.fullwidth .template_2_Columns_33_66 .column2 input.textbox,
.fullwidth .template_2_Columns_33_66 .column2 textarea.textarea
{width:<%=rd(fwGrv(1) - (boxPad * 2) - 3)%>px}

.fullwidth .template_2_Columns_66_33 .column1 .box input.textbox,
.fullwidth .template_2_Columns_66_33 .column1 .box textarea.textarea,
.fullwidth .template_2_Columns_33_66 .column2 .box input.textbox,
.fullwidth .template_2_Columns_33_66 .column2 .box textarea.textarea
{width:<%=rd(fwGrv(1) - (boxPad * 6))%>px}

.fullwidth .template_2_Columns_66_33 .column2 input.textbox,
.fullwidth .template_2_Columns_66_33 .column2 textarea.textarea,
.fullwidth .template_2_Columns_33_66 .column1 input.textbox,
.fullwidth .template_2_Columns_33_66 .column1 textarea.textarea
{width:<%=rd(fwGrv(2) - (boxPad * 2) - 3)%>px}

.fullwidth .template_2_Columns_66_33 .column2 .box input.textbox,
.fullwidth .template_2_Columns_66_33 .column2 .box textarea.textarea,
.fullwidth .template_2_Columns_33_66 .column1 .box input.textbox,
.fullwidth .template_2_Columns_33_66 .column1 .box textarea.textarea
{width:<%=rd(fwGrv(2) - (boxPad * 8))%>px}

.fullwidth .template_2_Columns_75_25 .column1 input.textbox,
.fullwidth .template_2_Columns_75_25 .column1 textarea.textarea,
.fullwidth .template_2_Columns_25_75 .column2 input.textbox,
.fullwidth .template_2_Columns_25_75 .column2 textarea.textarea
{width:<%=rd(fw75column - (boxPad * 2))%>px}

.fullwidth .template_2_Columns_75_25 .column1 .box input.textbox,
.fullwidth .template_2_Columns_75_25 .column1 .box textarea.textarea,
.fullwidth .template_2_Columns_25_75 .column2 .box input.textbox,
.fullwidth .template_2_Columns_25_75 .column2 .box textarea.textarea
{width:<%=rd(fw75column - (boxPad * 4))%>px}

.fullwidth .template_2_Columns_75_25 .column2 input.textbox,
.fullwidth .template_2_Columns_75_25 .column2 textarea.textarea,
.fullwidth .template_2_Columns_25_75 .column1 input.textbox,
.fullwidth .template_2_Columns_25_75 .column1 textarea.textarea
{width:<%=rd(fw25column - (boxPad * 2))%>px}

.fullwidth .template_2_Columns_75_25 .column2 .box input.textbox,
.fullwidth .template_2_Columns_75_25 .column2 .box textarea.textarea,
.fullwidth .template_2_Columns_25_75 .column1 .box input.textbox,
.fullwidth .template_2_Columns_25_75 .column1 .box textarea.textarea
{width:<%=rd(fw25column - (boxPad * 4))%>px}

<% Dim masonaryblock As Integer = fw6column - boxPad%>
<% Dim masonaryblockheight As Integer = rd(masonaryblock * mansonaryAspect)%>
.fullwidth #isotope-module{position:relative;width:<%=(fw6column * 6)%>px}
.fullwidth #isotope-module .module{margin-right:<%=boxPad - 1%>px;margin-bottom:<%=boxPad%>px;height:<%=masonaryblockheight%>px;}
.fullwidth #isotope-module .nocontent{height:<%=masonaryblock%>px;margin-bottom:<%=boxPad%>px}
.fullwidth #isotope-module .pos-column1, .fullwidth #isotope-module .pos-column1-1col{width:<%=masonaryblockheight%>px}
.fullwidth #isotope-module .pos-column1-2col{width:<%=rd(masonaryblock * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-3col{width:<%=rd(masonaryblock * 3 + (boxPad * 2))%>px}
.fullwidth #isotope-module .pos-column1-4col{width:<%=rd(masonaryblock * 4 + (boxPad * 3))%>px}
.fullwidth #isotope-module .pos-column1-5col{width:<%=rd(masonaryblock * 5 + (boxPad * 4))%>px}
.fullwidth #isotope-module .pos-column1-1col2row,.fullwidth #isotope-module .pos-column1-1col2row .gmap-canvas{width:<%=masonaryblock%>px;height:<%=rd(masonaryblockheight * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-2col2row,.fullwidth #isotope-module .pos-column1-2col2row .gmap-canvas{width:<%=rd(masonaryblock * 2 + (boxPad * 1))%>px;height:<%=rd(masonaryblockheight * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-3col2row,.fullwidth #isotope-module .pos-column1-3col2row .gmap-canvas{width:<%=rd(masonaryblock * 3 + (boxPad * 2))%>px;height:<%=rd(masonaryblockheight * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-4col2row,.fullwidth #isotope-module .pos-column1-4col2row .gmap-canvas{width:<%=rd(masonaryblock * 4 + (boxPad * 3))%>px;height:<%=rd(masonaryblockheight * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-5col2row,.fullwidth #isotope-module .pos-column1-5col2row .gmap-canvas{width:<%=rd(masonaryblock * 5 + (boxPad * 3))%>px;height:<%=rd(masonaryblockheight * 2 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-1col2row .mo-Title{width:<%=masonaryblock%>px}
.fullwidth #isotope-module .pos-column1-2col2row .mo-Title{width:<%=rd(masonaryblock * 2)-boxpad%>px}
.fullwidth #isotope-module .pos-column1-3col2row .mo-Title{width:<%=rd(masonaryblock * 3)%>px}
.fullwidth #isotope-module .pos-column1-4col2row .mo-Title{width:<%=rd(masonaryblock * 4)+boxpad%>px}
.fullwidth #isotope-module .pos-column1-5col2row .mo-Title{width:<%=rd(masonaryblock * 5)+(boxpad * 2)%>px}
.fullwidth #isotope-module .pos-column1-1col3row{width:<%=masonaryblock%>px;height:<%=rd(masonaryblock * 3 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-2col3row{width:<%=rd(masonaryblock * 2 + (boxPad * 1))%>px;height:<%=rd(masonaryblockheight * 3 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-3col3row{width:<%=rd(masonaryblock * 3 + (boxPad * 2))%>px;height:<%=rd(masonaryblockheight * 3 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-4col3row{width:<%=rd(masonaryblock * 4 + (boxPad * 3))%>px;height:<%=rd(masonaryblockheight * 3 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-5col3row{width:<%=rd(masonaryblock * 5 + (boxPad * 3))%>px;height:<%=rd(masonaryblockheight * 3 + (boxPad * 1))%>px}
.fullwidth #isotope-module .pos-column1-1col100pc{width:<%=masonaryblock%>px;height:100%}
.fullwidth #isotope-module .pos-column1-2col100pc{width:<%=rd(masonaryblock * 2 + (boxPad * 1))%>px;height:auto}
.fullwidth #isotope-module .pos-column1-3col100pc{width:<%=rd(masonaryblock * 3 + (boxPad * 2))%>px;height:auto}
.fullwidth #isotope-module .pos-column1-4col100pc{width:<%=rd(masonaryblock * 4 + (boxPad * 3))%>px;height:auto}
.fullwidth #isotope-module .pos-column1-5col100pc{width:<%=rd(masonaryblock * 5 + (boxPad * 3))%>px;height:auto}
.fullwidth #isotope-module .isotope-item{margin-bottom:<%=boxPad%>px}