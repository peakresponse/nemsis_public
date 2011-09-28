<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="no" />
<xsl:template match="/">  

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>NEMSIS Data Dictionary Section Groupin</title>
    <style type="text/css">           
        body {font-family:arial,helvetica,sans-serif; position:relative;}
        .header {font-size:10px;}
        .element {float:left;font-size:10px;}        
        .elementSmall {float:left;font-size:10px;}        
        .elementGroup {float:left;font-size:10px;}        
        .national {float:left;font-size:10px; }                
        .state    {float:left;font-size:10px; }        
        .optional {float:left;font-size:10px; }   
        .cardinalityFont {font-size:10px;}         

        .correlationID {background:ORANGE;font-size:10px;}   
 
        .legendTitle   {font-size:16px;}
        .legend     {font-size:11px;}
        .legendKey   {font-size:11px;}
        .pnNvNil  {float:left;font-size:10px;}                
        .usage    {float:left;font-size:10px;}    

        .indent         {float:left;}
        .recurrence     {float:left;}
        .recurrence_tx  {float:left;font-size:10px;white-space:nowrap;}
        
        .verticalLine {float:left;font-size:10px;}  
        .indent_g2 {float:left;font-size:10px;}
        .indent_tag {float:left;font-size:10px;}
              
        .blank {float:left;font-size:10px;}
        .indent_g  {float:left;font-size:10px;}  
        .indent_gback {float:left;font-size:10px;}
    </style>
</head>
<body>  
  
    <!--<table style="border:solid 1px;" width="630px" cellpadding="2px" cellspacing="0">
      <tr>        
        <td class="legendTitle" width="80px">Legend</td> 
        <td>
          <table cellpadding="0" cellspacing="0" border="0">
            <tr>               
              <td class="legend" align="right" width="80px">Dataset Level:</td> 
              <td width="2px"/>
              <td width="300px">
                <table cellpadding="0" cellspacing="0" border="0" width="300px">
                  <tr>                    
                    <td style="font-size:11px;background:#E10000;border:solid 0px;" width="11px" align="center" height="18px;" >N</td>
                    <td style="width:2px;"/>    
                    <td style="font-size:11px;" width="50px">National</td>
                    <td style="width:5px;"/>    
                    <td style="font-size:11px;background:#FBC723;border:solid 0px;" width="11px" align="center" height="18px;" >S</td>
                    <td style="width:2px;"/>    
                    <td style="font-size:11px;">State</td>  
                  </tr>
                </table>
              </td>
           </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="legendTitle" width="80px"></td> 
        <td>
          <table cellpadding="0" cellspacing="0" border="0">         
           <tr>
              <td class="legend" align="right" width="80px">Usage:</td>   
              <td width="2px"/>
              <td style="font-size:11px;background:#BBBBBB;border:solid 1px;" width="5px;" height="16px;" align="center"></td>
              <td style="width:2px;"/>    
              <td class="legendKey"><B>M</B> = Mandatory , <B>R</B> = Required , or <B>O</B> = Optional</td>               
           </tr>
           <tr><td height="2px"/></tr>
           <tr>
              <td class="legend" align="right" width="80px">Attributes:</td>   
              <td width="2px"/>
              <td style="font-size:11px;background:#FFFFBB;border:solid 1px;" width="5px;" height="16px;" align="center"></td>
              <td style="width:2px;"/>    
              <td class="legendKey"><B>N</B> = Not Values, <B>P</B> = Pertinent Negatives , and/or <B>L</B> = Nillable</td>      
            </tr>      
          </table>
        </td>
      </tr>
    </table> -->     
    <div class="header"><xsl:value-of select="section/@name"/></div>    
    <xsl:call-template name="section">
      <xsl:with-param name="count" select="0"/>
    </xsl:call-template>
    <div style="clear:both"/>  
    <div class="header"><xsl:value-of select="section/@name"/></div>  
</body>
</html>
</xsl:template>

<xsl:template name="section">
  <xsl:param name="count"/>
  <xsl:for-each select="section|element|group">
    <xsl:choose>
        <xsl:when test="local-name()='section'">
          <xsl:call-template name="section">
            <xsl:with-param name="count" select="$count + 1"/>
          </xsl:call-template>              
        </xsl:when>     
        <xsl:when test="local-name()='group'"> 
          <xsl:call-template name="for.loop">            
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="i" select="1"/>
          </xsl:call-template>       
          <div class="recurrence">      
            <div class="recurrence_tx"><xsl:value-of select="@minOccurs"/> to <xsl:value-of select="@maxOccurs"/>|</div>
          </div>

          <div class="elementGroup"><xsl:value-of select="@number"/></div> 
                    
          <div style="clear:both"/>
          <xsl:call-template name="section">
            <xsl:with-param name="count" select="$count + 1"/>
          </xsl:call-template>            
        </xsl:when>   
        <xsl:when test="local-name()='element'">         
          <xsl:call-template name="for.loop">
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="i" select="1"/>
          </xsl:call-template>             
          <div class="recurrence">             
            <div class="recurrence_tx"><xsl:value-of select="@minOccurs"/> to <xsl:value-of select="@maxOccurs"/>|</div>
          </div>       
               
          <xsl:if test="$count &lt; 2"> 
              <div class="element"><xsl:value-of select="@number"/> - <xsl:value-of select="name"/>|</div>
          </xsl:if>   
          <xsl:if test="$count &gt; 1"> 
              <div class="elementSmall"><xsl:value-of select="@number"/> - <xsl:value-of select="name"/>|</div>
          </xsl:if>   
                 
          <xsl:choose><xsl:when test="national/text()='Yes'">
            <div class="national">N|</div>
          </xsl:when></xsl:choose>          
          <xsl:choose><xsl:when test="state/text()='Yes'">
            <div class="state">S|</div>
          </xsl:when></xsl:choose>        
          <xsl:choose><xsl:when test="usage/text()='Mandatory'">
            <div class="optional">M|</div>
          </xsl:when></xsl:choose>       
          <xsl:choose><xsl:when test="usage/text()='Required'">
            <div class="optional">R|</div>
          </xsl:when></xsl:choose>     
          <xsl:choose><xsl:when test="usage/text()='Optional'">
            <div class="optional">O|</div>
          </xsl:when></xsl:choose>  
          
          <xsl:choose><xsl:when test="notValue/text()='Yes' or pertinentNegative/text()='Yes' or @isNillable='Yes'">
            <div class="pnNvNil">
              <xsl:choose><xsl:when test="notValue/text()='Yes'">N<xsl:choose><xsl:when test="pertinentNegative/text()='Yes' or @isNillable='Yes'">|</xsl:when></xsl:choose></xsl:when></xsl:choose>              
              <xsl:choose><xsl:when test="@isNillable='Yes'">L<xsl:choose><xsl:when test="pertinentNegative/text()='Yes'">|</xsl:when></xsl:choose></xsl:when></xsl:choose>
              <xsl:choose><xsl:when test="pertinentNegative/text()='Yes'">P</xsl:when></xsl:choose>                           
             </div>                           
          </xsl:when></xsl:choose> 
          
        </xsl:when>           
    </xsl:choose>
    <div style="clear:both"/>
  </xsl:for-each> 
</xsl:template>

<xsl:template name="for.loop">        
    <xsl:param name="i"      />
    <xsl:param name="count"  />   
    <xsl:if test="$i &lt; $count">   
        <div class="indent_g2">|</div>
    </xsl:if>               
    <xsl:if test="$i &lt; $count">  
      <xsl:call-template name="for.loop"> 
        <xsl:with-param name="i" select="$i + 1"/> 
        <xsl:with-param name="count" select="$count"/>
      </xsl:call-template>
    </xsl:if>     
</xsl:template> 


</xsl:stylesheet>