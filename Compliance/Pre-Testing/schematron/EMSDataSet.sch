<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            queryBinding="xslt2"
            id="EMSDataSet"
            schemaVersion="3.5.0.230317CP4_compliance_pretesting_2024">
   <sch:title>NEMSIS ISO Schematron file for EMSDataSet for compliance pre-testing (2024, v3.5.0)</sch:title>
   <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
   <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
   <!-- "Initialize" variables used by nemsisDiagnostic. -->
   <sch:let name="nemsisElements" value="()"/>
   <sch:let name="nemsisElementsMissing" value="''"/>
   <sch:let name="nemsisElementsMissingContext" value="()"/>
   <!-- PHASES -->
   <!-- No phases used. -->
   <!-- PATTERNS -->
   <sch:pattern id="compliance_covidImmunization">
      <sch:title>COVID-19 immunization status should be recorded on patients with influenza-like illness or infectious disease</sch:title>
      <sch:rule id="compliance_covidImmunization_rule"
                context="nem:PatientCareReport[nem:eSituation/(nem:eSituation.09, nem:eSituation.10, nem:eSituation.11, nem:eSituation.12)[matches(., '^(B97\.2.*)|(B99.*)|(J00.*)|(J09.*)|(J1[0-8].*)|(J2[0-2].*)|(Z20\.8.*)|(Z20\.9)$')]]">
         <sch:let name="nemsisElements"
                  value="nem:eSituation/(nem:eSituation.09, nem:eSituation.10, nem:eSituation.11, nem:eSituation.12)[matches(., '^(B97\.2.*)|(B99.*)|(J00.*)|(J09.*)|(J1[0-8].*)|(J2[0-2].*)|(Z20\.8.*)|(Z20\.9)$')]"/>
         <sch:let name="nemsisElementsMissing" value="'eHistory.10'"/>
         <sch:let name="nemsisElementsMissingContext"
                  value="nem:eHistory/nem:eHistory.ImmunizationsGroup"/>
         <!-- To test: On case 2024-EMS-1-ILIRelease_v350 or 2024-EMS-4-CovidTransfer_v350, remove the entry for COVID-19 in eHistory.10 The Patient's Type of Immunization, or change it to another value. -->
         <sch:assert id="compliance_covidImmunization_assert"
                     role="[WARNING]"
                     diagnostics="nemsisDiagnostic"
                     test="nem:eCustomResults/nem:eCustomResults.ResultsGroup[nem:eCustomResults.01 = '9910055' and nem:eCustomResults.03 = ancestor::nem:PatientCareReport/nem:eHistory/nem:eHistory.ImmunizationsGroup[nem:eHistory.10]/@CorrelationID]">
        COVID-19 immunization status should be recorded when an impression or symptom is influenza-like illness or infectious disease. If the patient is not immunized for COVID-19, select "Not Immunized" along with "COVID-19" for The Patient's Type of Immunization. This is a validation message for compliance pre-testing for 2024 for NEMSIS v3.5.0.
      </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern id="compliance_lungAssessment">
      <sch:title>Lung Assessment should be recorded on 911 calls for patients with influenza-like illness or infectious disease</sch:title>
      <sch:rule id="compliance_lungAssessment_rule"
                context="nem:PatientCareReport[nem:eResponse/nem:eResponse.ServiceGroup/nem:eResponse.05 = '2205001' and nem:eSituation/(nem:eSituation.09, nem:eSituation.10, nem:eSituation.11, nem:eSituation.12)[matches(., '^(B97\.2.*)|(B99.*)|(J00.*)|(J09.*)|(J1[0-8].*)|(J2[0-2].*)|(Z20\.8.*)|(Z20\.9)$')]]">
         <sch:let name="nemsisElements"
                  value="nem:eResponse/nem:eResponse.ServiceGroup/nem:eResponse.05, nem:eSituation/(nem:eSituation.09, nem:eSituation.10, nem:eSituation.11, nem:eSituation.12)[matches(., '^(B97\.2.*)|(B99.*)|(J00.*)|(J09.*)|(J1[0-8].*)|(J2[0-2].*)|(Z20\.8.*)|(Z20\.9)$')]"/>
         <sch:let name="nemsisElementsMissing" value="'eExam.23'"/>
         <sch:let name="nemsisElementsMissingContext" value="nem:eExam.LungGroup"/>
         <!-- To test: On case 2024-EMS-1-ILIRelease_v350, remove the entries for eExam.23 Lung Assessment or record it as "Not Done". -->
         <sch:assert id="compliance_lungAssessment_assert"
                     role="[WARNING]"
                     diagnostics="nemsisDiagnostic"
                     test="nem:eExam/nem:eExam.AssessmentGroup/nem:eExam.LungGroup/nem:eExam.23[. != '3523015']">
        Lung Assessment should be recorded when an impression or symptom is influenza-like illness or infectious disease and Type of Service Requested is "Emergency Response (Primary Response Area)". This is a validation message for compliance pre-testing for 2024 for NEMSIS v3.5.0.
      </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern id="compliance_lastOralIntake">
      <sch:title>Last Oral Intake should be recorded on 911 calls with a patient that happen in the morning</sch:title>
      <sch:rule id="compliance_lastOralIntake_rule"
                context="nem:PatientCareReport[nem:eResponse/nem:eResponse.ServiceGroup/nem:eResponse.05 = '2205001' and hours-from-dateTime(nem:eTimes/nem:eTimes.03) &lt; 12 and nem:eDisposition/nem:eDisposition.IncidentDispositionGroup/nem:eDisposition.27 = '4227001']">
         <sch:let name="nemsisElements"
                  value="nem:eResponse/nem:eResponse.ServiceGroup/nem:eResponse.05, nem:eTimes/nem:eTimes.03, nem:eDisposition/nem:eDisposition.IncidentDispositionGroup/nem:eDisposition.27"/>
         <sch:let name="nemsisElementsMissing" value="'eHistory.19'"/>
         <sch:let name="nemsisElementsMissingContext" value="nem:eHistory"/>
         <!-- To test: On case 2024-EMS-1-ILIRelease_v350, remove the value for eHistory.19 Last Oral Intake. -->
         <sch:assert id="compliance_lastOralIntake_assert"
                     role="[ERROR]"
                     diagnostics="nemsisDiagnostic"
                     test="nem:eHistory/nem:eHistory.19">
        Last Oral Intake should be recorded when Type of Service Requested is "Emergency Response (Primary Response Area)" and Unit Notified by Dispatch Date/Time is in the morning and Unit Disposition is "Patient Contact Made". This is a validation message for compliance pre-testing for 2024 for NEMSIS v3.5.0.
      </sch:assert>
      </sch:rule>
   </sch:pattern>
   <!-- DIAGNOSTICS -->
   <sch:diagnostics>
      <sch:diagnostic id="nemsisDiagnostic">

      <!-- This is the NEMSIS national diagnostic. It must exist in every NEMSIS Schematron document, 
           and it should be referenced by every assert and report. It provides nationally-
           standardized, structured data to communicate which data elements are of interest in a 
           failed assert or successful report. -->
         <nemsisDiagnostic xmlns="http://www.nemsis.org"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

        <!-- Elements that uniquely identify the record where the problem happened. -->
            <record>
               <xsl:copy-of select="ancestor-or-self::*:StateDataSet/*:sState/*:sState.01"/>
               <xsl:copy-of select="ancestor-or-self::*:DemographicReport/*:dAgency/(*:dAgency.01 | *:dAgency.02 | *:dAgency.04)"/>
               <xsl:copy-of select="ancestor-or-self::*:Header/*:DemographicGroup/*"/>
               <xsl:copy-of select="ancestor-or-self::*:PatientCareReport/*:eRecord/*:eRecord.01"/>
               <xsl:if test="ancestor-or-self::*[@UUID]">
                  <UUID>
                     <xsl:value-of select="ancestor-or-self::*[@UUID][1]/@UUID"/>
                  </UUID>
               </xsl:if>
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
                  <xsl:variable name="parent"
                                select="$nemsisElementsMissingContext[contains(local-name(), substring-before(current(), '.'))][1]"/>
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
   </sch:diagnostics>
   <!-- PROPERTIES -->
   <sch:properties/>
</sch:schema>
