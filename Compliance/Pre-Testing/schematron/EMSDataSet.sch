<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2" id="EMSDataSet" schemaVersion="3.4.0.170111_compliance_pre">

  <sch:title>NEMSIS ISO Schematron file for EMSDataSet for Compliance Pre-testing</sch:title>

  <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

  <!-- PATTERNS -->

  <sch:pattern id="compliance_sequence_odometer">

    <sch:title>The odometer reading sequence is reasonable.</sch:title>

    <sch:rule id="compliance_sequence_odometer_rule" context="nem:eResponse">

      <sch:let name="nemsisElements" value="(nem:eResponse.19, nem:eResponse.20, nem:eResponse.21, nem:eResponse.22)"/>

      <!-- To test: Set two of the odometer readings to the same value as each other to trigger the error. -->

      <sch:assert id="compliance_sequence_odometer_0" role="[ERROR]" diagnostics="nemsisDiagnostic" test="nem:eResponse.19 = (nem:eResponse.20, nem:eResponse.21, nem:eResponse.22) or nem:eResponse.20 = (nem:eResponse.21, nem:eResponse.22) or nem:eResponse.21 = nem:eResponse.22">
        No two odometer readings should be the same as each other.
      </sch:assert>

      <!-- To test: Set the odometer readings so that the difference between the lowest and highest readings is more than 1,000 to trigger the warning. -->

      <sch:assert id="compliance_sequence_odometer_1000" role="[WARNING]" diagnostics="nemsisDiagnostic" test="max((nem:eResponse.19, nem:eResponse.20, nem:eResponse.21, nem:eResponse.22)) - min((nem:eResponse.19, nem:eResponse.20, nem:eResponse.21, nem:eResponse.22)) &lt; 1000">
        Odometer readings should not exceed 1,000 miles traveled.
      </sch:assert>

    </sch:rule>

  </sch:pattern>

  <!-- DIAGNOSTICS -->

  <sch:diagnostics>

    <?DSDL_INCLUDE_START includes/diagnostic_nemsisDiagnostic.xml?>
    <sch:diagnostic id="nemsisDiagnostic">

      <!-- This is the NEMSIS national diagnostic. It must exist in every NEMSIS Schematron document, 
       and it should be referenced by every assert and report. It provides nationally-
       standardized, structured data to communicate which data elements are of interest in a 
       failed assert or successful report. -->

      <nemsisDiagnostic xmlns="http://www.nemsis.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

        <!-- Elements that uniquely identify the record where the problem happened. -->

        <record>
          <xsl:copy-of select="ancestor-or-self::*:DemographicReport/*:dAgency/(*:dAgency.01 | *:dAgency.02 | *:dAgency.04)"/>
          <xsl:copy-of select="ancestor-or-self::*:Header/*:DemographicGroup/*"/>
          <xsl:copy-of select="ancestor-or-self::*:PatientCareReport/*:eRecord/*:eRecord.01"/>
        </record>

        <!-- Elements that the user may want to revisit to resolve the problem, along with their values. -->

        <elements>
          <xsl:for-each select="$nemsisElements">
            <xsl:element name="element">
              <xsl:attribute name="location">
                <xsl:apply-templates select="." mode="schematron-get-full-path"/>
              </xsl:attribute>
              <xsl:for-each select="@*">
                <xsl:attribute name="{name()}">
                  <xsl:value-of select="."/>
                </xsl:attribute>
              </xsl:for-each>
              <xsl:if test="not(*)">
                <xsl:value-of select="."/>
              </xsl:if>
            </xsl:element>
          </xsl:for-each>
        </elements>

        <!-- Elements that were missing, that the user may want to visit to resolve the problem. -->

        <elementsMissing>
          <xsl:variable name="default_context" select="."/>
          <xsl:for-each select="tokenize($nemsisElementsMissing, ' ')">
            <xsl:variable name="parent" select="$nemsisElementsMissingContext[contains(local-name(), substring-before(current(), '.'))][1]"/>
            <element>
              <xsl:attribute name="parentLocation">
                <xsl:choose>
                  <xsl:when test="$parent">
                    <xsl:apply-templates select="$parent" mode="schematron-get-full-path"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$default_context" mode="schematron-get-full-path"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:attribute name="name">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </element>
          </xsl:for-each>
        </elementsMissing>

      </nemsisDiagnostic>

    </sch:diagnostic>
    <?DSDL_INCLUDE_END includes/diagnostic_nemsisDiagnostic.xml?>

  </sch:diagnostics>

</sch:schema>