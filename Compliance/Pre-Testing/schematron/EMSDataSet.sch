<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2" id="EMSDataSet" schemaVersion="3.5.0.191130CP1_compliance_pre_2020">

  <sch:title>NEMSIS ISO Schematron file for EMSDataSet for Compliance Pre-testing (2020, v3.5.0)</sch:title>

  <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

  <!-- "Initialize" variables used by nemsisDiagnostic. -->
  <sch:let name="nemsisElements" value="()"/>
  <sch:let name="nemsisElementsMissing" value="''"/>
  <sch:let name="nemsisElementsMissingContext" value="()"/>

  <!-- PHASES -->

  <!-- No phases used. -->

  <!-- PATTERNS -->

  <sch:pattern id="compliance_eCrew">

    <sch:title>Crew information is complete.</sch:title>

    <sch:rule id="compliance_eCrew.CrewGroup" context="nem:eCrew">

      <sch:let name="nemsisElements" value="nem:eCrew.CrewGroup/nem:eCrew.03"/>
      <sch:let name="nemsisElementsMissing" value=".[not(nem:eCrew.CrewGroup/nem:eCrew.03)]/'eCrew.03'"/>

      <!-- To test: Set all instances of eCrew.03 to a value other than "Driver/Pilot-Response". -->

      <sch:assert id="compliance_eCrew.CrewGroup_DriverResponse" role="[ERROR]" diagnostics="nemsisDiagnostic" test="nem:eCrew.CrewGroup/nem:eCrew.03 = '2403001'">
        There should be a crew member with the role of "Driver/Pilot-Response". This is a validation message for compliance pre-testing for 2020 for NEMSIS v3.5.0.
      </sch:assert>

      <!-- To test: Set all instances of eCrew.03 to a value other than "Primary Patient Caregiver-Transport" on a record where the disposition is "Patient Treated, Transported by This EMS Unit". -->

      <sch:assert id="compliance_eCrew.CrewGroup_PrimaryCaregiverTransport" role="[WARNING]" diagnostics="nemsisDiagnostic" test="not(ancestor::nem:PatientCareReport/nem:eDisposition/nem:eDisposition.12 = '4212033') or nem:eCrew.CrewGroup/nem:eCrew.03 = '2403013'">
        There should be a crew member with the role of "Primary Patient Caregiver-Transport" when the disposition is "Patient Treated, Transported by This EMS Unit". This is a validation message for compliance pre-testing for 2020 for NEMSIS v3.5.0.
      </sch:assert>

    </sch:rule>

  </sch:pattern>

  <!-- DIAGNOSTICS -->

  <sch:diagnostics>

    <?DSDL_INCLUDE_START includes/diagnostic_nemsisDiagnostic.xml?><sch:diagnostic id="nemsisDiagnostic">

  <!-- This is the NEMSIS national diagnostic. It must exist in every NEMSIS Schematron document, 
       and it should be referenced by every assert and report. It provides nationally-
       standardized, structured data to communicate which data elements are of interest in a 
       failed assert or successful report. -->

  <nemsisDiagnostic xmlns="http://www.nemsis.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <!-- Elements that uniquely identify the record where the problem happened. -->

    <record>
      <xsl:copy-of select="ancestor-or-self::*:StateDataSet/*:sState/*:sState.01"/>
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

</sch:diagnostic><?DSDL_INCLUDE_END includes/diagnostic_nemsisDiagnostic.xml?>

  </sch:diagnostics>

  <!-- PROPERTIES -->

  <sch:properties/>

</sch:schema>