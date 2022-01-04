<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2" id="EMSDataSet" schemaVersion="3.5.0.191130CP1_compliance_pre_2022">

  <sch:title>NEMSIS ISO Schematron file for EMSDataSet for Compliance Pre-testing (2022, v3.5.0)</sch:title>

  <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

  <!-- "Initialize" variables used by nemsisDiagnostic. -->
  <sch:let name="nemsisElements" value="()"/>
  <sch:let name="nemsisElementsMissing" value="''"/>
  <sch:let name="nemsisElementsMissingContext" value="()"/>

  <!-- PHASES -->

  <!-- No phases used. -->

  <!-- PATTERNS -->

  <sch:pattern id="compliance_refusal">

    <sch:title>Reason for Refusal/Release is recorded when applicable.</sch:title>

    <sch:rule id="compliance_refusal_rule" context="nem:eDisposition.IncidentDispositionGroup[nem:eDisposition.28 = '4228007']">

      <sch:let name="nemsisElements" value="nem:eDisposition.28"/>
      <sch:let name="nemsisElementsMissing" value="'eDisposition.31'"/>

      <!-- To test: Set eDisposition.28 Patient Evaluation/Care to "Patient Refused Evaluation/Care" and do not record eDisposition.31 Reason for Refusal/Release. -->

      <sch:assert id="compliance_refusal_assert" role="[ERROR]" diagnostics="nemsisDiagnostic" test="nem:eDisposition.31">
        Reason for Refusal/Release should be recorded when Patient Evaluation/Care is "Patient Refused Evaluation/Care". This is a validation message for compliance pre-testing for 2022 for NEMSIS v3.5.0.
      </sch:assert>

    </sch:rule>

  </sch:pattern>

  <sch:pattern id="compliance_spo2">

    <sch:title>Pulse oximetry is measured after oxygen is administered.</sch:title>

    <sch:rule id="compliance_pain_rule" context="nem:eMedications.MedicationGroup[nem:eMedications.01 != '' and nem:eMedications.02 = '9923001' and nem:eMedications.03[. = '7806' and not(@PN)]]">

      <sch:let name="nemsisElements" value="ancestor::nem:PatientCareReport/nem:eVitals/nem:eVitals.VitalGroup[nem:eVitals.01 != '' and nem:eVitals.01 > current()/nem:eMedications.01]/nem:eVitals.12"/>
      <sch:let name="nemsisElementsMissing" value=".[not(ancestor::nem:PatientCareReport/nem:eVitals/nem:eVitals.VitalGroup[nem:eVitals.01 != '' and nem:eVitals.01 > current()/nem:eMedications.01])]/'eVitals.12'"/>
      <sch:let name="nemsisElementsMissingContext" value=".[not(ancestor::nem:PatientCareReport/nem:eVitals/nem:eVitals.VitalGroup[nem:eVitals.01 != '' and nem:eVitals.01 > current()/nem:eMedications.01])]/ancestor::nem:PatientCareReport/nem:eVitals/nem:eVitals.VitalGroup"/>

      <!-- To test: On a report where oxygen is administered (with a date/time and not prior to this unit's care), set eVitals.12 Pulse Oximetry to a Not Value or Pertinent Negative on all sets of vitals obtained after the oxygen is given. -->

      <sch:assert id="compliance_pain_assert" role="[WARNING]" diagnostics="nemsisDiagnostic" test="ancestor::nem:PatientCareReport/nem:eVitals/nem:eVitals.VitalGroup[nem:eVitals.01 != '' and nem:eVitals.01 > current()/nem:eMedications.01]/nem:eVitals.12 != ''">
        A Pulse Oximetry reading should be recorded after oxygen is administered. This is a validation message for compliance pre-testing for 2022 for NEMSIS v3.5.0.
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