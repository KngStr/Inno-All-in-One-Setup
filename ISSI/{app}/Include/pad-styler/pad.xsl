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
<xsl:variable name="appIcon" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Icon_URL"/>
<xsl:variable name="appScreenshot" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Screenshot_URL"/>
<xsl:variable name="appDownload" select="/XML_DIZ_INFO/Web_Info/Download_URLs/Primary_Download_URL"/>
<xsl:variable name="appUrl" select="/XML_DIZ_INFO/Web_Info/Application_URLs/Application_Info_URL"/>
<xsl:variable name="appChangeInfo" select="/XML_DIZ_INFO/Program_Info/Program_Change_Info"/>
<xsl:variable name="appYear" select="/XML_DIZ_INFO/Program_Info/Program_Release_Year"/>
<xsl:variable name="appMonth" select="/XML_DIZ_INFO/Program_Info/Program_Release_Month"/>
<xsl:variable name="appDay" select="/XML_DIZ_INFO/Program_Info/Program_Release_Day"/>
<xsl:variable name="appKb" select="/XML_DIZ_INFO/Program_Info/File_Info/File_Size_K"/>
<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$appName"/></title>
    <link rel="stylesheet" href="pad.css" type="text/css"/>
  </head>
  <body>
    <table width="720" border="0" align="center" cellpadding="0">
      <tr>
        <td>
          <center>
            <br /><h1>
            <xsl:if test="$appIcon != ''"><img src="{$appIcon}" hspace="8"/> </xsl:if>
            <xsl:value-of select="$appName"/> v<xsl:value-of select="$appVersion"/></h1>
            <b><xsl:value-of select="$appDesc"/></b><br /><br />
            <xsl:if test="$appScreenshot != ''"><img src="{$appScreenshot}" /><br /><br /></xsl:if>
          </center>
          <b>About <xsl:value-of select="$appName"/></b><br />
          <xsl:value-of select="$appDescription"/><br /><br />
          <b>What's New in v <xsl:value-of select="$appVersion"/></b> (<xsl:value-of select="$appYear"/>-<xsl:value-of select="$appMonth"/>-<xsl:value-of select="$appDay"/>)<br />
          <xsl:value-of select="$appChangeInfo"/><br /><br />
          <b><a href="{$appDownload}">Download <xsl:value-of select="$appName"/> v<xsl:value-of select="$appVersion"/></a> (<xsl:value-of select="$appKb"/> KB)
          </b><br /><br />
          <center>
            <font size="2"><a href="{$appUrl}" target="_blank"><xsl:value-of select="$appName"/></a> Copyright © <xsl:value-of select="$appYear"/> by <a href="{$appPublisherUrl}" target="_blank"><xsl:value-of select="$appPublisher"/></a>. All rights reserved.</font>
            <br /><br />
          </center>
          <br /><br />
        </td>
      </tr>
    </table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>