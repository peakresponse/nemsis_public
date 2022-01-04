<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2" id="DEMDataSet" schemaVersion="3.5.0.191130CP1_compliance_pre_2022">

  <sch:title>NEMSIS ISO Schematron file for DEMDataSet for Compliance Pre-testing (2022, v3.5.0)</sch:title>

  <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

  <!-- "Initialize" variables used by nemsisDiagnostic. -->
  <sch:let name="nemsisElements" value="()"/>
  <sch:let name="nemsisElementsMissing" value="''"/>
  <sch:let name="nemsisElementsMissingContext" value="()"/>

  <!-- PHASES -->

  <!-- No phases used. -->

  <!-- PATTERNS -->

  <sch:pattern id="compliance_vehicle_call_signs">

    <sch:title>EMS Unit Call Signs are included on a Crew Call Sign list.</sch:title>

    <sch:rule id="compliance_vehicle_call_signs_rule" context="nem:dVehicle.03">

      <sch:let name="nemsisElements" value="., ancestor::nem:DemographicReport/nem:dConfiguration/nem:dConfiguration.ConfigurationGroup/nem:dConfiguration.16"/>

      <!-- To test: Change dVehicle.03 EMS Unit Call Sign to a random value on one of the vehicles to generate the warning. -->
        
      <sch:assert id="compliance_vehicle_call_signs_assert" role="[WARNING]" diagnostics="nemsisDiagnostic" test=". = ancestor::nem:DemographicReport/nem:dConfiguration/nem:dConfiguration.ConfigurationGroup/nem:dConfiguration.16">
        The EMS Unit Call Sign of each vehicle should be included on a Crew Call Sign list. This is a validation message for compliance pre-testing for 2022 for NEMSIS v3.5.0.
      </sch:assert>

    </sch:rule>

  </sch:pattern>

  <sch:pattern id="compliance_license">

    <sch:title>EMS Personnel's State's Licensure ID Number matches the state's format.</sch:title>

    <sch:rule id="compliance_license_rule" context="nem:dPersonnel.LicensureGroup[nem:dPersonnel.22 = '04' and nem:dPersonnel.24 = ('9925001', '9925005', '9925007')]">

      <sch:let name="nemsisElements" value="(nem:dPersonnel.22, nem:dPersonnel.23, nem:dPersonnel.24)"/>

      <!-- To test: Change the Arizona State Licensure ID Number on a personnel to a value that does not match a 7- or 8-digit format. -->
        
      <sch:assert id="compliance_license_assert" role="[ERROR]" diagnostics="nemsisDiagnostic" test="matches(normalize-space(nem:dPersonnel.23), '^\d{7,8}$')">
        EMS Personnel's State's Licensure ID Number for Arizona should be 7 or 8 digits. This is a validation message for compliance pre-testing for 2022 for NEMSIS v3.5.0.
      </sch:assert>

    </sch:rule>

  </sch:pattern>

  <!-- DIAGNOSTICS -->

  <sch:diagnostics>

    <sch:diagnostic id="nemsisDiagnostic" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

      <!-- This is the NEMSIS national diagnostic. It must exist in every NEMSIS Schematron document, 
           and it should be referenced by every assert and report. It provides nationally-
           standardized, structured data to communicate which data elements are of interest in a 
           failed assert or successful report. -->

      <nemsisDiagnostic xmlns="http://www.nemsis.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

        <!-- Elements that uniquely identify the record where the problem happened. -->

        <record>
          <xsl:copy-of select="ancestor-or-self::*:StateDataSet/*:sState/*:sState.01" />
          <xsl:copy-of select="ancestor-or-self::*:DemographicReport/*:dAgency/(*:dAgency.01 | *:dAgency.02 | *:dAgency.04)" />
          <xsl:copy-of select="ancestor-or-self::*:Header/*:DemographicGroup/*" />
          <xsl:copy-of select="ancestor-or-self::*:PatientCareReport/*:eRecord/*:eRecord.01" />
          <xsl:if test="ancestor-or-self::*[@UUID]">
            <UUID>
              <xsl:value-of select="ancestor-or-self::*[@UUID][1]/@UUID" />
            </UUID>
          </xsl:if>
        </record>

        <!-- Elements that the user may want to revisit to resolve the problem, along with their values. -->

        <elements>
          <xsl:for-each select="$nemsisElements">
            <xsl:element name="element">
              <xsl:attribute name="location">
                <xsl:apply-templates select="." mode="schematron-get-full-path" />
              </xsl:attribute>
              <xsl:for-each select="@*">
                <xsl:attribute name="{name()}">
                  <xsl:value-of select="." />
                </xsl:attribute>
              </xsl:for-each>
              <xsl:if test="not(*)">
                <xsl:value-of select="." />
              </xsl:if>
            </xsl:element>
          </xsl:for-each>
        </elements>

        <!-- Elements that were missing, that the user may want to visit to resolve the problem. -->

        <elementsMissing>
          <xsl:variable name="default_context" select="." />
          <xsl:for-each select="tokenize($nemsisElementsMissing, ' ')">
            <xsl:variable name="parent" select="$nemsisElementsMissingContext[contains(local-name(), substring-before(current(), '.'))][1]" />
            <element>
              <xsl:attribute name="parentLocation">
                <xsl:choose>
                  <xsl:when test="$parent">
                    <xsl:apply-templates select="$parent" mode="schematron-get-full-path" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="$default_context" mode="schematron-get-full-path" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:attribute name="name">
                <xsl:value-of select="." />
              </xsl:attribute>
            </element>
          </xsl:for-each>
        </elementsMissing>

      </nemsisDiagnostic>

    </sch:diagnostic>

  </sch:diagnostics>

  <!-- PROPERTIES -->

  <sch:properties />

</sch:schema>