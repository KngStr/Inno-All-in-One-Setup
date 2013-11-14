<!-- PAD-Styler v1.0 //-->
<!-- PAD XSL formatting by Jan Albartus - www.albartus.com //-->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" />
<xsl:variable name="appName" select="/XML_DIZ_INFO/Program_Info/Program_Name"/>
<xsl:variable name="appPublisher" select="/XML_DIZ_INFO/Company_Info/Company_Name"/>
<xsl:variable name="appPublisherUrl" select="/XML_DIZ_INFO/Company_Info/Company_WebSite_URL"/>
<xsl:variable name="appVersion" select="/XML_DIZ_INFO/Program_Info/Program_Version"/>
<xsl:variable name="appDesc" select="/XML_DIZ_INFO/Program_Descriptions/English/Char_Desc_80"/>
<xsl:variable name="appDescription" select="/XML_DIZ_INFO/Program_Descriptions/English/Char_Desc_2000"/>
<xsl:variable name="appKeywords" select="/XML_DIZ_INFO/Program_Descriptions/English/Keywords"/>
<xsl:variable name="appIcon" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Icon_URL"/>
<xsl:variable name="appScreenshot" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Screenshot_URL"/>
<xsl:variable name="appDownload" select="/XML_DIZ_INFO/Web_Info/Download_URLs/Primary_Download_URL"/>
<xsl:variable name="appDownload2" select="/XML_DIZ_INFO/Web_Info/Download_URLs/Secondary_Download_URL"/>
<xsl:variable name="appDownload3" select="/XML_DIZ_INFO/Web_Info/Download_URLs/Additional_Download_URL_1"/>
<xsl:variable name="appDownload4" select="/XML_DIZ_INFO/Web_Info/Download_URLs/Additional_Download_URL_1"/>
<xsl:variable name="appUrl" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Info_URL"/>
<xsl:variable name="appChangeInfo" select="/XML_DIZ_INFO/Program_Info/Program_Change_Info"/>
<xsl:variable name="appYear" select="/XML_DIZ_INFO/Program_Info/Program_Release_Year"/>
<xsl:variable name="appMonth" select="/XML_DIZ_INFO/Program_Info/Program_Release_Month"/>
<xsl:variable name="appDay" select="/XML_DIZ_INFO/Program_Info/Program_Release_Day"/>
<xsl:variable name="appKb" select="/XML_DIZ_INFO/Program_Info/File_Info/File_Size_K"/>
<xsl:variable name="appMb" select="/XML_DIZ_INFO/Program_Info/File_Info/File_Size_MB"/>
<xsl:variable name="appType" select="/XML_DIZ_INFO/Program_Info/Program_Type"/>
<xsl:variable name="appCost" select="/XML_DIZ_INFO/Program_Info/Program_Cost_Dollars"/>
<xsl:variable name="appReleaseStatus" select="/XML_DIZ_INFO/Program_Info/Program_Release_Status"/>
<xsl:variable name="appASP" select="/XML_DIZ_INFO/ASP/ASP_Member_Number"/>
<xsl:variable name="appFormASP" select="/XML_DIZ_INFO/ASP/ASP_FORM"/>
<xsl:variable name="Address_1" select="/XML_DIZ_INFO/Company_Info/Address_1"/>
<xsl:variable name="Address_2" select="/XML_DIZ_INFO/Company_Info/Address_2"/>
<xsl:variable name="City_Town" select="/XML_DIZ_INFO/Company_Info/City_Town"/>
<xsl:variable name="State_Province" select="/XML_DIZ_INFO/Company_Info/State_Province"/>
<xsl:variable name="Zip_Postal_Code" select="/XML_DIZ_INFO/Company_Info/Zip_Postal_Code"/>
<xsl:variable name="Country" select="/XML_DIZ_INFO/Company_Info/Country"/>
<xsl:variable name="General_Phone" select="/XML_DIZ_INFO/Company_Info/Support_Info/General_Phone"/>
<xsl:variable name="General_Email" select="/XML_DIZ_INFO/Company_Info/Support_Info/General_Email"/>
<xsl:variable name="Support_Phone" select="/XML_DIZ_INFO/Company_Info/Support_Info/Support_Phone"/>
<xsl:variable name="Support_Email" select="/XML_DIZ_INFO/Company_Info/Support_Info/Support_Email"/>
<xsl:variable name="Sales_Phone" select="/XML_DIZ_INFO/Company_Info/Support_Info/Sales_Phone"/>
<xsl:variable name="Sales_Email" select="/XML_DIZ_INFO/Company_Info/Support_Info/Sales_Email"/>
<xsl:variable name="Application_Order_URL" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Order_URL"/>
<xsl:variable name="Program_OS_Support" select="/XML_DIZ_INFO/Program_Info/Program_OS_Support"/>
<xsl:variable name="Program_System_Requirements" select="/XML_DIZ_INFO/Program_Info/Program_System_Requirements"/>
<xsl:variable name="Program_Install_Support" select="/XML_DIZ_INFO/Program_Info/Program_Install_Support"/>
<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$appName"/></title>
    <link rel="stylesheet" href="padgen.css" type="text/css"/>
  </head>
  <body>
    <table border="0" bgcolor="#e0e0e0" width="720" align="center">
      <tr>
        <td>
          <table border="0" bgcolor="#EEEEEE" width="100%">
            <tr valign="top">
              <td>
                <xsl:if test="$appIcon != ''"><img src="{$appIcon}"/> </xsl:if>
              </td>
              <td width="100%">
                <table border="0" width="100%">
                  <tr>
                    <td colspan="2" valign="top">
                      <b><a href="{$appUrl}"><xsl:value-of select="$appName"/></a> v<xsl:value-of select="$appVersion"/></b><br />
                    </td>
                  </tr>
                  <tr>
                    <td width="50%">
                      <font size="2">
                        <b>Release Date: </b><xsl:value-of select="$appMonth"/>/<xsl:value-of select="$appDay"/>/<xsl:value-of select="$appYear"/><br />
                        <b>Release Status: </b><xsl:value-of select="$appReleaseStatus"/>
                      </font>
                    </td>
                    <td width="50%">
                      <font size="2">
                        <b>Type: </b><xsl:value-of select="$appType"/><br />
                        <xsl:if test="$appCost != ''"><b>Cost: </b><xsl:value-of select="$appCost"/> $US</xsl:if>
                        <xsl:if test="$appCost = ''"><b>Cost: </b>0 $US</xsl:if>
                      </font>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <table border="0" bgcolor="#FFFFFF">
            <tr>
              <td>
                <xsl:if test="$appScreenshot != ''"><br /><center><img src="{$appScreenshot}" /></center><br /><hr width="100%" /></xsl:if>
                <br /><b>Description:</b><br />
                <font size="2">
                  <xsl:value-of select="$appDescription"/><br /><br />
                </font>
                <hr width="100%" />
                <br /><b>Download:</b><br />
                <font size="2">
                  <a href="{$appDownload}"><xsl:value-of select="$appName"/> v<xsl:value-of select="$appVersion"/></a> (File Size: <xsl:value-of select="$appKb"/>kB / <xsl:value-of select="$appMb"/>MB)<br />
                  <br />
                </font>
                <hr width="100%" />
                  
                  <br /><b>Operating Systems:</b><br />
                  <font size="2"><xsl:value-of select="$Program_OS_Support"/><br /><br />
                  <xsl:if test="$Program_System_Requirements != ''"><b>System Requirements: </b><xsl:value-of select="$Program_System_Requirements"/><br /></xsl:if>
                </font>
                </td>
              </tr>
           </table>
         </td>
       </tr>
     </table>
     <center><br />
       <font size="2"><a href="{$appUrl}" target="_blank"><xsl:value-of select="$appName"/></a> Copyright © <xsl:value-of select="$appYear"/> by <a href="{$appPublisherUrl}" target="_blank"><xsl:value-of select="$appPublisher"/></a>. All rights reserved.</font>
       <br /><br />
     </center>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>