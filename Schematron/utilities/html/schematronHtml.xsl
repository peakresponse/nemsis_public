<?xml version="1.0" encoding="UTF-8"?>
<!--
  
XML Stylesheet Language Transformation (XSLT) to transform NEMSIS v3 Schematron to HTML for 
documentation purposes

Version: 3.3.4.160316CP1
Revision Date: March 16, 2016

This product is provided by the NEMIS TAC, without charge, to facilitate browsing NEMSIS 3 
Schematron files via a user-friendly web-based interface.

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:nem="http://www.nemsis.org">
  <xsl:output method="html" encoding="UTF-8"/>

  <!-- Key for NEMSIS element name lookup list, if used in Schematron file (look up XML element name to retrieve NEMSIS element name). -->
  <xsl:key name="nemSch_key_elements" match="nem:element" use="@name"/>

  <!-- Main HTML document, title page, and menu -->
  <xsl:template match="/">
    <html>

      <head>

        <title>
          <xsl:value-of select="sch:schema/sch:title"/>
        </title>

        <link rel="stylesheet" type="text/css" href="http://www.nemsis.org/media/nemsis_v3/master/Schematron/utilities/html/schematronHtml.css" />

        <script type="text/javascript">
          
          var version = '<xsl:value-of select="sch:schema/@schemaVersion"/>'.split('.').slice(0, 3).join('.');
          var versionBase = 'http://www.nemsis.org/media/nemsis_v3/release-' + version;

          // Function to clean up value-of elements in overview page
          function cleanValueOf (element) {
            var replacement = element.innerHTML;
            // If it looks like a nemSch_key_elements lookup, try to isolate the name of the element(s) being looked up
            if (replacement.match(/key\s*\(\s*['"]nemSch_key_elements['"].*\$nemSch_elements\s*\)/)) {
              var match = replacement.match(/[de][A-Z][A-Za-z]*\.\d\d/g);
              // If we couldn't isolate any element names, go with an "(Element)" placeholder
              replacement = match ? match.join(' | ') : '(Element)';
            } else {
              // Otherwise, look for and clean up "string-join" code if found
              replacement = replacement.replace(/string-join\s*\((.*)\[.*],\s*['"]\s*,\s*['"]\)/, '$1');
            }
            element.innerHTML = replacement;
          }

          // Helper function for linkNemsisElement
          function linkReplace ($1, useName) {
            var elementName = window.nemSch_lookup_elements[$1];
            return '&lt;a href="' + versionBase + '/DataDictionary/PDFHTML/DEMEMS/sections/elements/' + $1 + '.xml" target="_blank" title="' +
          $1 + ' ' + elementName + '">' + (useName &amp;&amp; elementName ? elementName : $1) + '&lt;/a>';
            }

          // Function to add links to NEMSIS elements
          // useName (true|*false): if true, replace element name/ID with NEMSIS name/label
          function linkNemsisElement(element, useName) {
            var regEx = useName ? /\$?([de][A-Z][a-zA-Z]+\.\d\d)/g : /([de][A-Z][a-zA-Z]+\.\d\d)/g;
            element.innerHTML = element.innerHTML.replace(regEx, function(match, $1) {return linkReplace($1, useName);});
          }
          
          window.addEventListener('load', function() {
          
            // Create a NEMSIS element/name lookup list
              window.nemSch_lookup_elements = [];
            var nemSch_lookup_elements_source_parent = document.querySelector('nemSch_lookup_elements');
            if (nemSch_lookup_elements_source_parent) {
              var nemSch_lookup_elements_source = nemSch_lookup_elements_source_parent.children;
              for (var i = 0; i &lt; nemSch_lookup_elements_source.length; i++) {
                nemSch_lookup_elements[nemSch_lookup_elements_source[i].attributes[0].value] = nemSch_lookup_elements_source[i].innerText;
              }
            }

            var targets = document.getElementsByClassName('value-of');
            for (var i = 0; i &lt; targets.length; i++) cleanValueOf(targets[i]);

            targets = document.getElementsByClassName ('nameable');
            for (var i = 0; i &lt; targets.length; i++) linkNemsisElement(targets[i], true);

            targets = document.getElementsByClassName('linkable');
            for (var i = 0; i &lt; targets.length; i++) linkNemsisElement(targets[i], false);

          }, false);
        </script>
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

            <h2>
              <a href="#overview">Overview</a>
            </h2>

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
          <img src="http://www.nemsis.org/images/nemsisLogo.gif"/>
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
          <div class="spacer30"></div>
          <div class="spacer10"></div>
          <div class="spacer50"></div>
          <div class="spacer50"></div>
          <div class="url">www.NEMSIS.org</div>
          <div class="spacer10"></div>
          <div class="blueRectBtm"> </div>
        </div>

        <!-- Overview page -->
        <div class="page" id="overview">
          <xsl:apply-templates select="sch:schema/sch:pattern" mode="overview">
            <xsl:sort select="@id"/>
          </xsl:apply-templates>
        </div>


        <!-- All other pages -->

        <xsl:apply-templates mode="page"/>

      </body>

    </html>
  </xsl:template>

  <!-- Named template: Page/section header -->
  <xsl:template name="header">
    <div class="header">
      <span class="headerText">
        <xsl:value-of select="local-name()"/>
      </span>
      <span class="id">
        <xsl:value-of select="@id"/>
      </span>
      <xsl:apply-templates select="@*" mode="inline"/>
    </div>
    <xsl:apply-templates select="sch:title" mode="fixed"/>
  </xsl:template>

  <!-- Named template: Output the @id of an element, or generate one if it doesn't exist -->
  <xsl:template name="generate-id">
    <xsl:choose>
      <xsl:when test="@id!=''">
        <xsl:value-of select="@id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="generate-id()"/>
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


  <!-- Templates for Menu page -->

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

  <!-- Rule -->
  <xsl:template match="sch:rule" mode="menu">
    <div>
      <xsl:value-of select="@id"/>
    </div>
  </xsl:template>


  <!-- Templates for Overview page -->

  <!-- Pattern -->
  <xsl:template match="sch:pattern" mode="overview">
    <div class="section">
      <div class="pattern">
        <a>
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:call-template name="generate-id"/>
          </xsl:attribute>
          <span class="headerText">
            <xsl:value-of select="local-name()"/>
          </span>
          <xsl:choose>
            <xsl:when test="@id!=''">
              <xsl:value-of select="@id"/>
            </xsl:when>
            <xsl:otherwise>
              (unnamed)
            </xsl:otherwise>
          </xsl:choose>
          <xsl:apply-templates select="@*" mode="inline"/>
        </a>
      </div>
      <xsl:apply-templates select="*" mode="overview"/>
    </div>
  </xsl:template>

  <!-- Rule, Assert, Report -->
  <xsl:template match="sch:rule|sch:assert|sch:report" mode="overview">
    <div class="section">
      <div class="header">
        <span class="headerText">
          <xsl:value-of select="local-name()"/>
        </span>
        <xsl:choose>
          <xsl:when test="@id!=''">
            <xsl:value-of select="@id"/>
          </xsl:when>
          <xsl:otherwise>
            (unnamed)
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="@*" mode="inline"/>
      </div>
      <xsl:choose>
        <xsl:when test="local-name() = 'assert' or local-name() = 'report'">
          <div class="fullWidthValue nameable">
            <xsl:apply-templates select="node()" mode="overview"/>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="*" mode="overview"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Value-of -->
  <xsl:template match="sch:value-of" mode="overview">
    <span class="value-of">
      <xsl:choose>
        <xsl:when test="contains(@select, 'local-name()')">
          <xsl:variable name="q">'</xsl:variable>
          <xsl:value-of select="concat(substring-before(@select, 'local-name()'), $q, ancestor::sch:rule/@context, $q, substring-after(@select, 'local-name()'))"/>
        </xsl:when>
        <xsl:when test="contains(@select, 'local-name(.)')">
          <xsl:variable name="q">'</xsl:variable>
          <xsl:value-of select="concat(substring-before(@select, 'local-name(.)'), $q, ancestor::sch:rule/@context, $q, substring-after(@select, 'local-name(.)'))"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@select"/>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>

  <!-- Title -->
  <xsl:template match="sch:title" mode="overview">
    <div class="fullWidthValue linkable">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <!-- Everything else in overview mode -->
  <xsl:template match="*" mode="overview"/>


  <!-- Templates for pages -->

  <!-- Schema -->
  <xsl:template match="sch:schema" mode="page">
    <div class="page">
      <xsl:attribute name="id">
        <xsl:call-template name="generate-id"/>
      </xsl:attribute>
      <xsl:call-template name="header"/>
      <xsl:apply-templates select="node()|@*"/>
    </div>
    <xsl:apply-templates select="*" mode="page"/>
    <xsl:apply-templates select="text()" mode="escape"/>
  </xsl:template>

  <xsl:template match="sch:diagnostics" mode="page">
    <xsl:apply-templates mode="page"/>
  </xsl:template>

  <!-- Phase, pattern, diagnostic -->
  <xsl:template match="sch:phase|sch:pattern|sch:diagnostic" mode="page">
    <div class="page">
      <xsl:attribute name="id">
        <xsl:call-template name="generate-id"/>
      </xsl:attribute>
      <xsl:call-template name="header"/>
      <xsl:choose>
        <xsl:when test="local-name() = 'diagnostic'">
          <xsl:apply-templates select="@*"/>
          <div class="fullWidthValue linkable code">
            <xsl:apply-templates select="node()|comment()" mode="escape"/>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="node()|@*"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <!-- Everything else in page mode -->
  <xsl:template match="*" mode="page"/>


  <!-- Templates for fixed elements -->

  <!-- Title -->
  <xsl:template match="sch:title" mode="fixed">
    <div class="fullWidthTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="fullWidthValue linkable">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>


  <!-- Templates for inline elements -->

  <!-- @abstract -->
  <xsl:template match="@abstract" mode="inline">
    <span class="abstract">(Abstract)</span>
  </xsl:template>

  <!-- Everything else in inline mode -->
  <xsl:template match="node()|@*" mode="inline"/>


  <!-- General templates -->

  <!-- Rule -->
  <xsl:template match="sch:rule">
    <div class="section">
      <xsl:call-template name="header"/>
      <xsl:apply-templates select="node()|@*"/>
    </div>
  </xsl:template>

  <!-- Assert or report -->
  <xsl:template match="sch:assert|sch:report">
    <div class="section">
      <xsl:call-template name="header"/>
      <xsl:apply-templates select="@*"/>
      <div class="fullWidthValue linkable code">
        <xsl:apply-templates select="node()" mode="escape"/>
      </div>
    </div>
  </xsl:template>

  <!-- Key -->
  <xsl:template match="xsl:key">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
      <xsl:value-of select="@name"/>: match "<xsl:value-of select="@match"/>" using "<xsl:value-of select="@use"/>"
    </div>
  </xsl:template>

  <!-- Let or param -->
  <xsl:template match="sch:let|sch:param">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
      $<xsl:value-of select="@name"/> = <xsl:value-of select="@value"/>
    </div>
  </xsl:template>

  <!-- NS -->
  <xsl:template match="sch:ns">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
      <xsl:value-of select="@prefix"/>: <a href="{@uri}" target="_blank">
        <xsl:value-of select="@uri"/>
      </a>
    </div>
  </xsl:template>

  <!-- xsl:variable, nem:nemSch_lookup_elements -->
  <xsl:template match="xsl:variable|nem:nemSch_lookup_elements">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue">
      <xsl:copy-of select="."/>
    </div>
  </xsl:template>

  <!-- @diagnostics -->
  <xsl:template match="@diagnostics"/>

  <!-- @extends -->
  <xsl:template match="sch:extends">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
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
    <div class="summaryValue linkable">
      <a href="#{.}">
        <xsl:value-of select="."/>
      </a>
    </div>
  </xsl:template>

  <!-- @role -->
  <xsl:template match="@role" mode="inline">
    <xsl:choose>
      <xsl:when test=".='[WARNING]'">
        <div class="role warning">Warning</div>
      </xsl:when>
      <xsl:when test=".='[ERROR]'">
        <div class="role error">Error</div>
      </xsl:when>
      <xsl:when test=".='[Fatal]'">
        <div class="role fatal">Fatal</div>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- @see -->
  <xsl:template match="@see">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
      <a href="{.}" target="_blank">
        <xsl:value-of select="."/>
      </a>
    </div>
  </xsl:template>

  <!-- All other attributes and elements -->

  <xsl:template match="sch:phase|sch:pattern|sch:diagnostics"/>

  <xsl:template match="sch:title"/>

  <xsl:template match="@abstract"/>

  <xsl:template match="@id"/>

  <xsl:template match="@role"/>

  <xsl:template match="@*|*">
    <div class="summaryTitle">
      <xsl:value-of select="local-name()"/>
    </div>
    <div class="summaryValue linkable">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <!-- XML comment -->
  <xsl:template match="comment()">
    <div class="fullWidthTitle">
      Comment
    </div>
    <div class="fullWidthValue linkable">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>


  <!-- Escaped code -->

  <!-- Elements -->
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
    <xsl:choose>
      <!-- Element has content -->
      <xsl:when test="node()">
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
      </xsl:when>
      <!-- Element has no content (singleton tag) -->
      <xsl:otherwise>
        <!-- End singleton tag -->
        <span class="xmlDelimiter">/&gt;</span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- XML Comment -->
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

  <!-- Named template: escape XML code -->
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