<?xml version="1.0" encoding="UTF-8"?>
<!--
  
XML Stylesheet Language Transformation (XSLT) to transform NEMSIS v3 Schematron to HTML for 
documentation purposes

Version: 3.3.4-140303
Revision Date: March 3, 2014

This product is provided by the NEMIS TAC, without charge, to facilitate browsing NEMSIS 3 
Schematron files via a user-friendly web-based interface.

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:nem="http://www.nemsis.org">
  <xsl:output method="html" encoding="UTF-8"/>

  <!-- Main HTML document, title page, and menu -->
  <xsl:template match="/">
    <html>

      <head>
        <title>
          <xsl:value-of select="sch:schema/sch:title"/>
        </title>
        <link rel="stylesheet" type="text/css" href="../utilities/html/schematronHtml.css" />
      </head>

      <body>

        <!-- Menu -->

        <div id="menu">

          <a href="#">
            <h1>
              NEMSIS Schematron Business Rules<br/>
              Version: <xsl:value-of select="sch:schema/@schemaVersion"/>
            </h1>
          </a>

          <div class="contents">

            <h2>Schema</h2>
            <xsl:apply-templates select="sch:schema" mode="menu"/>

            <h2>Phases</h2>
            <xsl:apply-templates select="sch:schema/sch:phase" mode="menu">
              <xsl:sort select="@id"/>
            </xsl:apply-templates>

            <h2>Patterns</h2>
            <xsl:apply-templates select="sch:schema/sch:pattern" mode="menu">
              <xsl:sort select="@id"/>
            </xsl:apply-templates>

            <h2>Diagnostics</h2>
            <xsl:apply-templates select="sch:schema/sch:diagnostics/sch:diagnostic" mode="menu">
              <xsl:sort select="@id"/>
            </xsl:apply-templates>

          </div>

        </div>

        <!-- Title page -->
        <div class="page" id="root">
          <img src="../utilities/html/nemsisLogo.gif"/>
          <div class="blueRect"></div>
          <div class="spacer20"></div>
          <div class="titleMain">NEMSIS</div>
          <div class="titleSub">Schematron Business Rules</div>
          <div class="spacer50"></div>
          <div class="nhtsa">
            <xsl:value-of select="sch:schema/@id"/>
          </div>
          <div class="nhtsa2">
            Version: <xsl:value-of select="sch:schema/@schemaVersion"/>
          </div>
          <div class="spacer50"></div>
          <div class="standard">
            <xsl:value-of select="sch:schema/sch:title"/>
          </div>
          <div class="spacer30"></div>
          <div class="version">
            Version Date: <xsl:value-of select="concat(substring(sch:schema/@schemaVersion, 9, 2), '/', substring(sch:schema/@schemaVersion, 11, 2), '/20', substring(sch:schema/@schemaVersion, 7, 2))"/>
          </div>
          <div class="spacer30"></div>
          <div class="spacer10"></div>
          <div class="spacer50"></div>
          <div class="spacer50"></div>
          <div class="url">www.NEMSIS.org</div>
          <div class="spacer10"></div>
          <div class="blueRectBtm"> </div>
        </div>

        <!-- All other pages -->
        
        <xsl:apply-templates mode="page"/>

      </body>

    </html>
  </xsl:template>

  <!-- Named template: Page header -->
  <xsl:template name="pageHeader">
    <div class="name">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="id">
      <xsl:value-of select="@id"/>
    </div>
    <xsl:apply-templates select="sch:title" mode="fixed"/>
    <xsl:apply-templates select="nem:nemsisTacDoc" mode="fixed"/>
  </xsl:template>

  <!-- Named template: Output the @id of an element, or generate one if it doesn't exist -->
  <xsl:template name="generate-id">
    <xsl:choose>
      <xsl:when test="@id!=''">
        <xsl:value-of select="@id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat(local-name(), '_', position())"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Named template: Tokenize IDREFS and transform to anchors -->
  <xsl:template name="tokenizeIdrefs">
    <xsl:param name="text" select="normalize-space(.)"/>
    <xsl:param name="separator" select="' '"/>
    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
        <a href="#{normalize-space($text)}">
          <xsl:value-of select="normalize-space($text)"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <a href="#{normalize-space(substring-before($text, $separator))}">
          <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
        </a>
        <xsl:text> </xsl:text>
        <xsl:call-template name="tokenizeIdrefs">
          <xsl:with-param name="text" select="substring-after($text, $separator)"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Menu item -->
  <xsl:template match="*" mode="menu">
    <a>
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:call-template name="generate-id"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="@id!=''">
          <xsl:value-of select="@id"/>
        </xsl:when>
        <xsl:otherwise>
          unnamed <xsl:value-of select="local-name()"/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
    <xsl:apply-templates select="sch:rule" mode="menu"/>
  </xsl:template>

  <xsl:template match="sch:rule" mode="menu">
    <div>
      <xsl:value-of select="@id"/>
    </div>
  </xsl:template>
  
  <!-- Schema -->
  <xsl:template match="sch:schema" mode="page">
    <div class="page">
      <xsl:attribute name="id">
        <xsl:call-template name="generate-id"/>
      </xsl:attribute>
      <xsl:call-template name="pageHeader"/>
      <xsl:apply-templates select="node()"/>
    </div>
    <xsl:apply-templates select="*" mode="page"/>
  </xsl:template>

  <xsl:template match="sch:diagnostics" mode="page">
    <xsl:apply-templates mode="page"/>
  </xsl:template>

  <!-- Page (phase, pattern, diagnostic) -->
  <xsl:template match="sch:phase|sch:pattern|sch:diagnostic" mode="page">
    <div class="page">
      <xsl:attribute name="id">
        <xsl:call-template name="generate-id"/>
      </xsl:attribute>
      <xsl:call-template name="pageHeader"/>
      <xsl:choose>
        <xsl:when test="local-name() = 'diagnostic'">
          <xsl:apply-templates select="@*"/>
          <div class="fullWidthValue code">
            <xsl:apply-templates select="node()|comment()" mode="escape"/>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="node()|@*"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="sch:phase|sch:pattern|sch:diagnostics"/>

  <xsl:template match="*" mode="page"/>

  <!-- Rule -->
  <xsl:template match="sch:rule">
    <div class="section">
      <div class="fullWidthTitle">
        <xsl:value-of select="local-name()"/>
      </div>
      <xsl:apply-templates select="node()|@*"/>
    </div>
  </xsl:template>

  <!-- Assert or report -->
  <xsl:template match="sch:assert|sch:report">
    <div class="section">
      <div class="fullWidthTitle">
        <xsl:value-of select="local-name()"/>
      </div>
      <xsl:apply-templates select="@*"/>
      <div class="fullWidthValue code">
        <xsl:apply-templates select="node()" mode="escape"/>
      </div>
    </div>
  </xsl:template>

  <!-- Key -->
  <xsl:template match="xsl:key">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <xsl:value-of select="@name"/>: match "<xsl:value-of select="@match"/>" using "<xsl:value-of select="@use"/>"
    </div>
  </xsl:template>

  <!-- Let or param -->
  <xsl:template match="sch:let|sch:param">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      $<xsl:value-of select="@name"/> = <xsl:value-of select="@value"/>
    </div>
  </xsl:template>

  <!-- NS -->
  <xsl:template match="sch:ns">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <xsl:value-of select="@prefix"/>: <a href="{@uri}">
        <xsl:value-of select="@uri"/>
      </a>
    </div>
  </xsl:template>

  <!-- Title -->
  <xsl:template match="sch:title" mode="fixed">
    <div class="fullWidthTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="fullWidthValue">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="sch:title"/>
  <xsl:template match="sch:title" mode="page"/>

  <!-- @diagnostics -->
  <xsl:template match="@diagnostics">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <xsl:call-template name="tokenizeIdrefs"/>
    </div>
  </xsl:template>

  <!-- @extends -->
  <xsl:template match="sch:extends">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <a>
        <xsl:attribute name="href">
          <xsl:for-each select="//sch:pattern[sch:rule/@id=current()/@rule]">
            <xsl:text>#</xsl:text>
            <xsl:call-template name="generate-id"/>
          </xsl:for-each>
        </xsl:attribute>
        <xsl:value-of select="@rule"/>
      </a>
    </div>
  </xsl:template>

  <!-- @is-a -->
  <xsl:template match="@is-a">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <a href="#{.}">
        <xsl:value-of select="."/>
      </a>
    </div>
  </xsl:template>

  <!-- All other attributes and elements -->
  <xsl:template match="@*|*">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <!-- XML comment -->
  <xsl:template match="comment()">
    <div class="fullWidthTitle">
      Comment
    </div>
    <div class="fullWidthValue">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <!-- Escaped code (all templates below) -->
  <xsl:template match="*" mode="escape">
    <!-- Begin opening tag -->
    <span class="xmlDelimiter">&lt;</span>
    <span class="xmlName">
      <xsl:value-of select="name()"/>
    </span>
    <!-- Attributes -->
    <xsl:for-each select="@*">
      <xsl:text> </xsl:text>
      <span class="xmlAttribute">
        <xsl:value-of select="name()"/>
      </span>
      <xsl:text>="</xsl:text>
      <span class="xmlAttributeValue">
        <xsl:call-template name="escape-xml">
          <xsl:with-param name="text" select="."/>
        </xsl:call-template>
      </span>
      <xsl:text>"</xsl:text>
    </xsl:for-each>
    <!-- End opening tag -->
    <span class="xmlDelimiter">&gt;</span>
    <!-- Content (child elements, text nodes, and PIs) -->
    <xsl:apply-templates select="node()" mode="escape" />
    <!-- Closing tag -->
    <span class="xmlDelimiter">&lt;/</span>
    <span class="xmlName">
      <xsl:value-of select="name()"/>
    </span>
    <span class="xmlDelimiter">&gt;</span>
  </xsl:template>

  <xsl:template match="comment()" mode="escape">
    <!-- Begin comment tag -->
    <span class="xmlDelimiter">&lt;!--</span>
    <span class="xmlComment">
      <xsl:call-template name="escape-xml">
        <xsl:with-param name="text" select="."/>
      </xsl:call-template>
    </span>
    <!-- End comment tag -->
    <span class="xmlDelimiter">--&gt;</span>
  </xsl:template>

  <xsl:template match="text()" mode="escape">
    <xsl:call-template name="escape-xml">
      <xsl:with-param name="text" select="."/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="escape-xml">
    <xsl:param name="text"/>
    <xsl:if test="$text != ''">
      <xsl:variable name="head" select="substring($text, 1, 1)"/>
      <xsl:variable name="tail" select="substring($text, 2)"/>
      <xsl:choose>
        <xsl:when test="$head = '&amp;'">
          <span class="xmlEntity">&amp;amp;</span>
        </xsl:when>
        <xsl:when test="$head = '&lt;'">
          <span class="xmlEntity">&amp;lt;</span>
        </xsl:when>
        <xsl:when test="$head = '&gt;'">
          <span class="xmlEntity">&amp;gt;</span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$head"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="escape-xml">
        <xsl:with-param name="text" select="$tail"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>