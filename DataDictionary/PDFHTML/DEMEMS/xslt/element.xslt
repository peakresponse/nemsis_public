<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="us-ascii"/>
<xsl:template match="/">  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <title><xsl:value-of select="element/@number"/> - <xsl:value-of select="element/name"/></title>
    <style type="text/css">
      body {font-family:arial,helvetica,sans-serif; position:relative;}
            
      .pageHeadingElement {font-size:20px;}
  
      .national {width:80px;font-size:14px;text-align:center;color:white;background: url(../../images/roundedNational.gif) no-repeat;}
      .state    {width:80px;font-size:14px;text-align:center;color:white;background: url(../../images/roundedState.gif) no-repeat;}
      
      .numberName {font-size:16px;color:white;padding-left:5px; background: url(../../images/roundedNumberName.gif) no-repeat;}
         
      .definitionTitle {font-size:14px;background:#F0F0F0;color:#004080;}    
      .definitionValue {font-size:14px;}

      .summaryTitle         {font-size:14px;background:#F0F0F0;color:#004080;}
      .summaryValue         {font-size:14px;}
            
      .attributeTitle         {font-size:14px;background:#F0F0F0;color:#004080;}
      .attributeName          {font-size:12px;font-weight:bold;color:#004080;}
      .attributeValue         {font-size:12px;}
            
      .sectionCommentTitle    {font-size:14px;background:#F0F0F0;color:#004080;}
      .sectionCommentValue    {font-size:12px;}
      
      .sectionV3ChangesTitle  {font-size:14px;background:#F0F0F0;color:#004080;}
      .sectionV3ChangesValue  {font-size:12px;}
      
      .sectionRestrictionsEnumerationCodeTitle        {width:60px;  font-size:12px;font-weight:bold;}
      .sectionRestrictionsEnumerationDescriptionTitle {width:560px; font-size:12px;font-weight:bold;}
      .sectionRestrictionsEnumerationCodeValue        {width:60px;  font-size:12px;}
      .sectionRestrictionsEnumerationDescriptionValue {width:560px; font-size:12px;}     
             
      .sectionAssociatedMeasuresTitle     {font-size:14px;background:#F0F0F0;color:#004080;}
      .sectionAssociatedMeasuresValue     {font-size:12px;padding-right:30px;}      
      
      .sectionRestrictionsTitle   {font-size:14px;background:#F0F0F0;color:#004080;}
      .sectionRestrictionsPattern {width:600px;font-size:12px;}
      
      .sectionRestrictionsDataTypeTitle   {width:120px;font-size:12px;font-weight:bold;}
      .sectionRestrictionsDataTypeValue   {width:120px;font-size:12px;}     
      .sectionRestrictionsConstraintTitle {width:155px;font-size:12px;font-weight:bold;}
      .sectionRestrictionsConstraintValue {width:155px;font-size:12px;}
      
      .sectionConstraintsHeaderDataType   {width:100px;font-size:12px;font-weight:bold;}
      .sectionConstraintsValueDataType    {width:100px;font-size:12px;}      
      .sectionConstraintsHeaderDateTime   {width:200px;font-size:12px;font-weight:bold;}
      .sectionConstraintsValueDateTime    {width:200px;font-size:12px;}
      
      td   {font-size:12px;}
    </style>
</head>

<body>
    
         

        
        
  

  <table border="0" cellspacing="0" cellpadding="0" width="675px">    
    <tr><td>
        <table width="675px" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td align="right" class="pageHeadingElement">
              <xsl:value-of select="element/@number"/>
            </td>
          </tr>
        </table>
    </td></tr>     
    <xsl:choose><xsl:when test="element/state/text()='Yes' or element/national/text()='Yes'">
    <tr><td height="8px;"></td></tr> 
    <tr><td>
        <table border="0" cellspacing="0" cellpadding="0" align="right" >
          <tr>  
            <xsl:choose><xsl:when test="element/state/text()='Yes'">
            <td class="state" height="23px">State</td>
            </xsl:when></xsl:choose> 
               
            <xsl:choose><xsl:when test="element/national/text()='Yes'">
            <td width="5px;"></td> 
            <td class="national" height="23px">National</td>
            <td width="2px;"></td> 
            </xsl:when></xsl:choose>  
          </tr>
        </table>
    </td></tr>  
    </xsl:when></xsl:choose>    
    <tr><td height="5px;"></td></tr>  
    <tr><td>
        <table width="675px" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td class="numberName" height="26px;">
              <xsl:value-of select="element/@number"/> - <xsl:value-of select="element/name"/>
            </td>
          </tr>
        </table>
    </td></tr> 
    <tr><td height="5px;"></td></tr>     
    <tr><td>       
        <table border="0" cellspacing="0" cellpadding="0" width="675px">
          <tr>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0" width="675px" >
                <tr>
                  <td>
                    <table border="0" cellspacing="0" cellpadding="0" width="675px" height="26px">
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td width="667px" class="definitionTitle">Definition</td>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr><td height="2px;"></td></tr>
                <tr>                  
                  <td class="definitionValue" style="padding-left:5px"><xsl:value-of select="element/definition"/></td>
                </tr>
              </table>
            </td>        
          </tr>
        </table>
    </td></tr>    
    <tr><td height="10px;"></td></tr>         
    <tr><td>         
        <table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="2px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td class="summaryTitle">National Element</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue"><xsl:value-of select="element/national"/></td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td width="5px"></td>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;"></td>
                        <td class="summaryTitle">Pertinent Negatives (PN)</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue">                        
                          <xsl:choose>
                            <xsl:when test="element/restrictions/pertinentNegatives">Yes</xsl:when>
                            <xsl:otherwise>No</xsl:otherwise>
                          </xsl:choose>    
                        </td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>            
          </tr>
          <tr><td height="3px;"></td></tr> 
          <tr>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td class="summaryTitle">State Element</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td> 
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue"><xsl:value-of select="element/state"/></td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>   
            <td width="5px"></td>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td class="summaryTitle">NOT Values</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>    
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue">
                          <xsl:choose>
                            <xsl:when test="element/restrictions/notValues">Yes</xsl:when>
                            <xsl:otherwise>No</xsl:otherwise>
                          </xsl:choose> 
                        </td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>                     
          </tr>          
          <tr><td height="3px;"></td></tr> 
          <tr>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;"></td>
                        <td class="summaryTitle">Version 2 Element</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;"></td>
                      </tr>      
                      <tr>
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue">                        
                          <xsl:choose>
                            <xsl:when test="string-length(element/v2Number) &gt; 0"><xsl:value-of select="element/v2Number"/></xsl:when>
                            <xsl:otherwise>&#160;</xsl:otherwise>
                          </xsl:choose>     
                        </td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td width="5px"></td>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td class="summaryTitle">Is Nillable</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue"><xsl:value-of select="element/@isNillable"/></td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>            
          </tr>          
          <tr><td height="3px"></td></tr> 
          <tr>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td class="summaryTitle">Usage</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue">
                          <xsl:choose>
                            <xsl:when test="element/usage"><xsl:value-of select="element/usage"/></xsl:when>
                            <xsl:otherwise>&#160;</xsl:otherwise>
                          </xsl:choose>   
                        </td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td width="5px"></td>
            <td>  
              <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="180px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;"></td>
                        <td class="summaryTitle">Recurrence</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2px"></td>
                  <td>
                    <table width="140px" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="center" class="summaryValue">
                          <xsl:value-of select="element/@minOccurs"/> : <xsl:value-of select="element/@maxOccurs"/>
                        </td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>            
          </tr>   
        </table>
    </td></tr>
        
    <!--<xsl:choose>  
    <xsl:when test="element/restrictions/pertinentNegatives/*">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                    <tr>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                    </tr>
                    <tr>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                      <td width="667px" class="sectionNOTValuesTitle">Pertinent Negatives</td>
                      <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                    </tr>      
                    <tr>
                      <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                      <td style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                    <tr>
                    <xsl:for-each select="element/restrictions/pertinentNegatives/choice">                  
                        <td class="sectionPNValue">
                          <xsl:value-of select="description"/>
                        </td>                 
                    </xsl:for-each>  
                    </tr>      
                  </table>
                </td>                       
              </tr>
            </table> 
    </td></tr>    
    </xsl:when>
    </xsl:choose> -->   
    
    <!-- NOT VALUES -->
    <!--<xsl:choose>  
    <xsl:when test="element/restrictions/notValues/*">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                    <tr>
                      <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                      <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif) no-repeat;"></td>        
                      <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                    </tr>
                    <tr>
                      <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                      <td width="667px" class="sectionNOTValuesTitle">NOT Values</td>
                      <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                    </tr>      
                    <tr>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                      <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr><td height="2px;"></td></tr> 
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="0" border="0" >
                    <tr>                      
                    <td width="5px;"></td>
                    <xsl:for-each select="element/restrictions/notValues/choice">                 
                        <td class="sectionNOTValuesValue">
                          <xsl:value-of select="description"/>
                        </td>                 
                    </xsl:for-each>  
                    </tr>      
                  </table>
                </td>                       
              </tr>
            </table>
    </td></tr>         
    </xsl:when>
    </xsl:choose>         --> 
    
    <!-- PERFORMANCE MEASURES SECTION -->  
    <xsl:choose>  
    <xsl:when test="element/performanceMeasuresGroup/*"> 
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td width="667px" class="sectionAssociatedMeasuresTitle">Associated Performance Measure Initiatives</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr><td height="2px;"></td></tr> 
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" border="0" >
                <tr>
                <td width="5px"></td>
                <xsl:for-each select="element/performanceMeasuresGroup/*">                 
                    <td class="sectionAssociatedMeasuresValue">
                      <xsl:value-of select="."/>
                    </td>                 
                </xsl:for-each>  
                </tr>      
              </table>
            </td>                       
          </tr>
        </table>
    </td></tr>           
    </xsl:when>
    </xsl:choose>     
    
    
    
    <!-- ATTRIBUTES --> 
    <xsl:choose>  
    <xsl:when test="    element/restrictions/notValues 
                    or  element/restrictions/pertinentNegatives
                    or  element/restrictions/emailAddressType
                    or  element/restrictions/phoneNumberType
                    or  element/restrictions/velocityUnit
                    or  element/restrictions/distanceUnit
                    or  element/restrictions/correlationID
                    or  element/restrictions/currentStatus
                    or  element/restrictions/currentStatusDate
                    or  element/restrictions/fileType
                    or  element/restrictions/StreetAddress
                    ">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td width="667px" class="attributeTitle">Attributes</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>
          

                    
                    
          <!--<xsl:choose><xsl:when test="element/restrictions/notValues">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">
                      <table width="100%" cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top.gif);"></td>        
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                      </tr>
                      <tr>
                        <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                        <td align="left" class="attributeName">NOT Values</td>
                        <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                      </tr>      
                      <tr>
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                        <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom.gif) no-repeat;"></td>        
                        <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                      </tr>
                    </table>                    
                  </td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td style="padding-left:10px;">
                  <xsl:for-each select="element/restrictions/notValues/choice">
                    <div class="attributeValue" style="float:left;width:180px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> -->
                    
                    
          <xsl:choose><xsl:when test="element/restrictions/notValues">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">NOT Values</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/notValues/choice">
                    <div class="attributeValue" style="float:left;width:180px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          <xsl:choose><xsl:when test="element/restrictions/pertinentNegatives">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Pertinent Negatives</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/pertinentNegatives/choice">
                    <div class="attributeValue" style="width:220px;float:left;white-space: nowrap;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose>                     
          
          <xsl:choose><xsl:when test="element/restrictions/StreetAddress">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Street Address 2</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                    <div class="attributeValue" style="float:left;width:130px;"> 
                      <b>Data Type:</b> String  
                    </div>
                    <div class="attributeValue" style="float:left;width:130px;"> 
                      <b>MinLength:</b> 2  
                    </div>
                    <div class="attributeValue" style="float:left;width:130px;"> 
                      <b>MaxLength:</b> 55 
                    </div>
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          <xsl:choose><xsl:when test="element/restrictions/emailAddressType">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Email Address</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/emailAddressType/choice">
                    <div class="attributeValue" style="float:left;width:130px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          <xsl:choose><xsl:when test="element/restrictions/phoneNumberType">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Phone Number</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/phoneNumberType/choice">
                    <div class="attributeValue" style="float:left;width:130px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          <xsl:choose><xsl:when test="element/restrictions/velocityUnit">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Velocity Unit</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/velocityUnit/choice">
                    <div class="attributeValue" style="float:left;width:200px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          <xsl:choose><xsl:when test="element/restrictions/distanceUnit">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Distance Unit</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/distanceUnit/choice">
                    <div class="attributeValue" style="float:left;width:200px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          <xsl:choose><xsl:when test="element/restrictions/currentStatus">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Current Status</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                      <xsl:for-each select="element/restrictions/currentStatus/choice">
                        <td class="attributeValue" width="100px">
                          <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                        </td>
                      </xsl:for-each> 
                      </tr>
                    </table>
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
          
          
          <xsl:choose><xsl:when test="element/restrictions/currentStatusDate">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Current Status Date</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td class="attributeValue" style="width:150px;"><b>Data Type:</b> DateTime</td>
                        <td class="attributeValue" style="width:220px;"><b>minInclusive:</b> 1950-01-01T00:00:00</td>
                        <td class="attributeValue" style="width:220px;"><b>maxInclusive:</b> 2050-01-01T00:00:00</td>                        
                      </tr>
                      <tr>
                        <td class="attributeValue" style="width:500px;" colspan="3"><b>Pattern:</b> [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(\.\d+)?(\+|-)[0-9]{2}:[0-9]{2}</td>
                      </tr>                        
                    </table>                                        
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose>
          
          <xsl:choose><xsl:when test="element/restrictions/correlationID">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">Correlation ID</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                    <table cellspacing="0" cellpadding="0" border="0">
                      <tr>
                        <td class="attributeValue" style="width:150px;"><b>Data Type:</b> String</td>
                        <td class="attributeValue" style="width:150px;"><b>minLength:</b> 0</td>
                        <td class="attributeValue" style="width:150px;"><b>maxLength:</b> 255 </td>                        
                      </tr>                       
                    </table>    
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
            

          <xsl:choose><xsl:when test="element/restrictions/fileType">
          <tr><td height="5px;"></td></tr>  
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="attributeName">File Type</td>
                </tr>         
                <tr>
                  <td width="5px"></td>
                  <td>
                  <xsl:for-each select="element/restrictions/fileType/choice">
                    <div class="attributeValue" style="float:left;width:120px;"> 
                      <xsl:value-of select="code"/> - <xsl:value-of select="description"/> 
                    </div>
                  </xsl:for-each> 
                  </td>
                </tr>  
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose>             
            
            
        </table>          
    </td></tr>    
    </xsl:when>
    </xsl:choose>        
    
    
    <!-- CONSTRAINTS SECTION & PATTERNS --> 
    <xsl:choose>  
    <xsl:when test="element/restrictions/constraints or element/restrictions/patterns">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td width="667px" class="sectionRestrictionsTitle">Constraints</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>

          
          
          <xsl:choose><xsl:when test="element/restrictions/constraints"> 
          <tr>
            <td>              
              <table cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="120px">
                    <table cellspacing="0" cellpadding="0" border="0" >
                      <tr>
                        <td class="sectionRestrictionsDataTypeTitle">Data Type</td>
                      </tr>
                      <tr>
                      <td class="sectionRestrictionsConstraintValue">
                        <xsl:value-of select="element/restrictions/constraints/dataType"/>
                      </td>
                      </tr>
                    </table>
                  </td>          
                  <xsl:for-each select="element/restrictions/constraints/constraint">
                    <xsl:sort select="constraintTitle" order="descending"/>
                    <td>
                        <table cellspacing="0" cellpadding="0">
                        <tr>
                          <td class="sectionRestrictionsConstraintTitle"><xsl:value-of select="constraintTitle"/></td>   
                        </tr>
                        <tr>                 
                          <td class="sectionRestrictionsConstraintValue"> 
                            <xsl:choose>  
                              <xsl:when test="../dataType='positiveInteger' ">
                                <xsl:value-of select="format-number(number(constraintValue),'###,###')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="constraintValue"/>
                              </xsl:otherwise>
                            </xsl:choose>  
                          </td>
                        </tr>
                      </table> 
                    </td>
                    <td width="15px"/>
                  </xsl:for-each>       
                </tr>  
              </table>  
            </td>
          </tr>    
          </xsl:when></xsl:choose> 
          
          
          
          <xsl:choose><xsl:when test="element/restrictions/patterns"> 
          <xsl:choose><xsl:when test="element/restrictions/constraints">
          <tr><td height="8px;"></td></tr> 
          </xsl:when>
          <xsl:otherwise>
          <tr><td height="3px;"></td></tr> 
          </xsl:otherwise></xsl:choose>
          <tr>
            <td>
              <table width="667px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td width="667px" class="sectionRestrictionsDataTypeTitle">Pattern</td>
                </tr>         
                <xsl:for-each select="element/restrictions/patterns/pattern">
                <tr>
                  <td width="5px"></td>
                  <td class="sectionRestrictionsPattern"> 
                    <xsl:value-of select="."/> 
                  </td>
                </tr>
                </xsl:for-each>   
              </table>
            </td>
          </tr>
          </xsl:when></xsl:choose> 
            
        </table>          
    </td></tr>    
    </xsl:when>
    </xsl:choose>         
        
    <!-- ENUMERATIONS SECTION -->
    <xsl:choose>  
    <xsl:when test="element/restrictions/enumerations">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td class="sectionCommentTitle">Code List</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr><td height="3px;"></td></tr> 
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td width="5px"></td>
                  <td class="sectionRestrictionsEnumerationCodeTitle">Code</td>
                  <td class="sectionRestrictionsEnumerationCodeTitle">Description</td>
                </tr>
                <tr><td height="3px"></td></tr>
                <xsl:for-each select="element/restrictions/enumerations/choice">
                  <tr>
                    <td width="5px"></td>
                    <td class="sectionRestrictionsEnumerationCodeValue" valign="top">
                      <xsl:value-of select="code"/>
                    </td>
                    <td class="sectionRestrictionsEnumerationDescriptionValue">
                      <xsl:value-of select="description"/>
                    </td>
                  </tr>
                  <tr><td height="3px"></td></tr>
                </xsl:for-each> 
              </table>
            </td>                       
          </tr>
        </table>     
    </td></tr>          
    </xsl:when>
    </xsl:choose>    
        
    <!-- DATA ELEMENT COMMENT SECTION -->
    <xsl:choose>  
    <xsl:when test="string-length(element/v3Comment) &gt; 0">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif) no-repeat;"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td width="667px" class="sectionCommentTitle">Data Element Comment</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td class="sectionCommentValue" style="padding-left:5px"><xsl:copy-of select="element/v3Comment"/></td>
          </tr>
        </table>     
    </td></tr>       
    </xsl:when>
    </xsl:choose>     
       
    <!-- VERSION 3 CHANGES IMPLEMENTED SECTION -->
    <xsl:choose>  
    <xsl:when test="string-length(element/v3Changes) &gt; 0">
    <tr><td height="8px;"></td></tr> 
    <tr><td>    
        <table border="0" cellspacing="0" cellpadding="0" width="675px">
          <tr>
            <td>
              <table width="675px" cellspacing="0" cellpadding="0" border="0" >
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_section.gif);"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/top_right.gif) no-repeat;"></td>
                </tr>
                <tr>
                  <td width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/left.gif) no-repeat;;"></td>
                  <td width="667px" class="sectionV3ChangesTitle">Version 3 Changes Implemented</td>
                  <td width="4px" style="background: url(../../images/roundedCornerWithBorder_Titles/right.gif) no-repeat;;"></td>
                </tr>      
                <tr>
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_left.gif) no-repeat;"></td>
                  <td height="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_section.gif) no-repeat;"></td>        
                  <td height="3px" width="3px" style="background: url(../../images/roundedCornerWithBorder_Titles/bottom_right.gif) no-repeat;"></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td class="sectionV3ChangesValue" style="padding-left:5px"><xsl:copy-of select="element/v3Changes"/></td>
          </tr>
        </table>     
    </td></tr>       
    </xsl:when>
    </xsl:choose>
     
  </table>
           
 

                 
</body>
</html>
</xsl:template>
</xsl:stylesheet>