<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="no" />
<xsl:template match="/">  

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>NEMSIS Data Dictionary Section Groupin</title>
    <style type="text/css">           
        body {font-family:arial,helvetica,sans-serif; position:relative;}
        a:link, a:visited   { font-size: 12; text-decoration: none; color:#24409A; }
        a:hover, a:focus    { font-size: 12; text-decoration: none; color:#BB7A2A; }
        .header {width:630px;background:#004080; color:white; padding:1px 2px 4px 5px; margin:0px 0px 0px 0px;font-size:18px;}
        .element {white-space:nowrap;width:5in;float:left;background:#F0F0F0; padding:1px 1px 3px 8px; margin:3px 0px 4px 0px;font-size:12px; border:solid 1px;}        
        .elementSmall {white-space:nowrap;width:4.8in;float:left;background:#F0F0F0; padding:1px 1px 3px 8px; margin:3px 0px 4px 0px;font-size:12px; border:solid 1px;}        
        .elementGroup {width:5.5in;float:left;z-index:10;background:#99CC99; padding:1px 1px 3px 5px; margin:3px 0px 3px 0px;font-size:12px; border:solid 1px;white-space:nowrap;}        
        
        .deprecated {height:12px;background:PURPLE;float:left;padding:3px 3px 3px 3px; margin:3px 1px 3px 1px;font-size:10px; border:solid 1px  purple;color:white;}                
        .national {height:12px;background:#E10000;float:left;padding:3px 3px 3px 3px; margin:3px 1px 3px 1px;font-size:10px; border:solid 1px;}                
        .state    {height:12px;background:#FBC723;float:left;padding:3px 3px 3px 3px; margin:3px 1px 3px 1px;font-size:10px; border:solid 1px;}        
        .optional {height:12px;background:#BBBBBB;float:left;padding:3px 3px 3px 3px; margin:3px 1px 3px 1px;font-size:10px; border:solid 1px;}   
        .cardinalityFont {font-size:11px;}         

        .correlationID {height:12px;background:ORANGE;font-size:10px;}   
 
        .legendTitle  {font-size:16px;}
        .legend       {font-size:11px;}
        .legendKey    {font-size:11px;}
        
        .row       {width:8in;float:left;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;} 
        .parent    {width:8in;float:left;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;} 
         
        .pnNvNil  {height:12px;float:left;background:#FFFFBB; padding:3px 3px 3px 3px; margin:3px 0px 3px 1px;font-size:10px; border:solid 1px;white-space:nowrap;}                
        .usage    {height:12px;float:left;background:#BBBBBB; padding:3px 3px 3px 3px; margin:3px 0px 3px 1px;font-size:10px; border:solid 1px;white-space:nowrap;}    

        .indent         {float:left;height:22px;width:20px;padding:0px 0px 0px 0px; border-bottom:solid 1px;}
        .recurrence     {float:left;width:30px;height:22px;padding:0px 0px 0px 0px; border-bottom:solid 1px;}
        .recurrence_tx  {float:left;height:11px;padding:10px 0px 0px 2px;font-size:10px;}
        
        .verticalLine {float:left;height:30px;padding:0px 0px 0px 0px; margin:-6px 0px 0px 0px; border-left:solid 1px;}  
        .indent_g2    {float:left;width:30px;padding:3px 0px 1px 0px;}
        .indent_tag   {float:left;height:22px;padding:0px 0px 0px 0px;border-bottom:solid 1px;}
              
        .blank        {float:left;height:12px;width:2px;padding:3px 0px 3px 0px;margin:3px 0px 3px 0px;font-size:12px;}
        .indent_g     {float:left;width:48px;padding:3px 0px 1px 0px;}  
        .indent_gback {float:left;width:49px;padding:3px 0px 1px 0px;}
    </style>
</head>
<body>  
  
    <table style="border:solid 1px;" width="630px" cellpadding="2px" cellspacing="0">
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
                    <td style="width:5px;"/>    
                    <td style="font-size:11px;background:PURPLE;border:solid 0px;color:white" width="11px" align="center" height="18px;" >D</td>
                    <td style="width:2px;"/>    
                    <td style="font-size:11px;">Deprecated</td>  
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
              <td class="legendKey"><B>M</B> = Mandatory , <B>R</B> = Required , <B>E</B> = Recommended, or <B>O</B> = Optional</td>               
           </tr>
           <tr><td height="2px"/></tr>
           <tr>
              <td class="legend" align="right" width="80px">Attributes:</td>   
              <td width="2px"/>
              <td style="font-size:11px;background:#FFFFBB;border:solid 1px;" width="5px;" height="16px;" align="center"></td>
              <td style="width:2px;"/>    
              <td class="legendKey"><B>N</B> = Not Values, <B>P</B> = Pertinent Negatives , <B>L</B> = Nillable, and/or <B>C</B> = Correlation ID</td>     
            </tr>      
          </table>
        </td>
      </tr>
    </table>      
    <div style="clear:both"/>
    <div style="height:1px;font-size:1px;"></div>  
    <div class="header"><xsl:value-of select="section/@name"/></div>    
    <xsl:call-template name="section">      
      <xsl:with-param name="count" select="0"/>
    </xsl:call-template>
    <div style="clear:both"/>  
    <div style="height:1px;font-size:1px;"></div> 
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
          <div class="row">   
          <div class="parent">   
          <xsl:call-template name="for.loop">            
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="i" select="1"/>
          </xsl:call-template>      
          <div class="recurrence">      
            <div class="recurrence_tx"> 
              <xsl:value-of select="@minOccurs"/> : <xsl:value-of select="@maxOccurs"/>
            </div>
          </div>
            <div class="indent_tag"/><div class="elementGroup"><xsl:value-of select="@number"/></div>                     
            <xsl:choose><xsl:when test="@CorrelationID='Yes'">
    		      <div class="pnNvNil">C</div>                
            </xsl:when></xsl:choose>   
          </div>          
          </div>      
          <div style="clear:both"/>
          <xsl:call-template name="section">
            <xsl:with-param name="count" select="$count + 1"/>
          </xsl:call-template>       
        </xsl:when>                   
        
        <xsl:when test="local-name()='element'">     
          <div class="row">      
          <div class="parent">  
          <xsl:call-template name="for.loop">
            <xsl:with-param name="count" select="$count"/>
            <xsl:with-param name="i" select="1"/>
          </xsl:call-template>     
            <div class="recurrence">             
              <div class="recurrence_tx">    
                <xsl:value-of select="@minOccurs"/> : <xsl:value-of select="@maxOccurs"/>
              </div>
            </div>
            <xsl:if test="$count &lt; 2"> 
                <div class="element"><a href="elements/{@number}.xml" target="detailFrame">
                  <xsl:value-of select="@number"/> - 
                    <xsl:choose>  
                    <xsl:when test="refNumber/text()!=''"> 
                            (<xsl:value-of select="refNumber"/>) 
                    </xsl:when>
                    </xsl:choose> 
                  <xsl:value-of select="name"/></a>
                </div>
            </xsl:if>   
            <xsl:if test="$count &gt; 1"> 
                <div class="elementSmall"><a href="elements/{@number}.xml" target="detailFrame">
                  <xsl:value-of select="@number"/> - 
                    <xsl:choose>  
                    <xsl:when test="refNumber/text()!=''"> 
                            (<xsl:value-of select="refNumber"/>) 
                    </xsl:when>
                    </xsl:choose> 
                  <xsl:value-of select="name"/></a>
                </div>
            </xsl:if>  
            <div class="blank"/>    
            <xsl:choose><xsl:when test="deprecated/text()='Yes'">
              <div class="deprecated">D</div>
            </xsl:when></xsl:choose>      
            <xsl:choose><xsl:when test="national/text()='Yes'">
              <div class="national">N</div>
            </xsl:when></xsl:choose>          
            <xsl:choose><xsl:when test="state/text()='Yes'">
              <div class="state">S</div>
            </xsl:when></xsl:choose>        
            <xsl:choose><xsl:when test="usage/text()='Mandatory'">
              <div class="optional">M</div>
            </xsl:when></xsl:choose>       
            <xsl:choose><xsl:when test="usage/text()='Required'">
              <div class="optional">R</div>
            </xsl:when></xsl:choose>      
            <xsl:choose><xsl:when test="usage/text()='Recommended'">
              <div class="optional">E</div>
            </xsl:when></xsl:choose>     
            <xsl:choose><xsl:when test="usage/text()='Optional'">
              <div class="optional">O</div>
            </xsl:when></xsl:choose>  
            <xsl:choose><xsl:when test="notValue/text()='Yes' or pertinentNegative/text()='Yes' or @isNillable='Yes'">
              <div class="pnNvNil">
                <xsl:choose><xsl:when test="notValue/text()='Yes'">N<xsl:choose><xsl:when test="pertinentNegative/text()='Yes' or @isNillable='Yes'">, </xsl:when></xsl:choose></xsl:when></xsl:choose>              
                <xsl:choose><xsl:when test="@isNillable='Yes'">L<xsl:choose><xsl:when test="pertinentNegative/text()='Yes'">, </xsl:when></xsl:choose></xsl:when></xsl:choose>
                <xsl:choose><xsl:when test="pertinentNegative/text()='Yes'">P</xsl:when></xsl:choose>                           
               </div>                                        
            </xsl:when></xsl:choose>
            <xsl:choose><xsl:when test="@CorrelationID='Yes'">
              <div class="pnNvNil">C</div>                
            </xsl:when></xsl:choose>  
          </div>
          </div>
        </xsl:when>           
    </xsl:choose>
    <div style="clear:both"/>
  </xsl:for-each>       
</xsl:template>

<xsl:template name="for.loop">        
    <xsl:param name="i"      />
    <xsl:param name="count"  />     
    <div class="verticalLine"/>    
    <xsl:if test="$i &lt; $count">   
        <div class="indent_g2"/>
    </xsl:if>               
    <xsl:if test="$i &lt; $count">  
      <xsl:call-template name="for.loop"> 
        <xsl:with-param name="i" select="$i + 1"/> 
        <xsl:with-param name="count" select="$count"/>
      </xsl:call-template>
    </xsl:if>     
</xsl:template> 


</xsl:stylesheet>