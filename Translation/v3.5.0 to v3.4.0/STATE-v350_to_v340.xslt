<?xml version="1.0" encoding="UTF-8"?>

<!--

XML Stylesheet Language Transformation (XSLT) to transform NEMSIS StateDataSet from v3.5.0 to v3.4.0

Version: 3.5.0.191130CP1_3.4.0.160713CP2_200115
Revision Date: January 15, 2020

-->

<xsl:stylesheet version="2.0"
	xmlns="http://www.nemsis.org"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n="http://www.nemsis.org"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="n xs">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:key name="key_element_names" match="n:element" use="@v350"/>

  <xsl:template match="/">
    <xsl:comment>&#32;This NEMSIS 3.4.0 document was generated from a NEMSIS 3.5.0 document via an XML Stylesheet Language Transformation (XSLT).&#32;</xsl:comment>
    <xsl:text>&#10;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@* | node()" priority="-1">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@xsi:schemaLocation">
    <xsl:attribute name="xsi:schemaLocation">http://www.nemsis.org http://www.nemsis.org/media/nemsis_v3/release-3.4.0/XSDs/NEMSIS_XSDs/StateDataSet_v3.xsd</xsl:attribute>
  </xsl:template>

  <!-- Elements: Map element name -->
  <xsl:template match="element()">
    <xsl:element name="{n:name(.)}">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="n:StateDataSet">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="n:sState"/>
      <!-- Switch order of "d" and "e" CustomConfiguration -->
      <xsl:apply-templates select="n:sdCustomConfiguration"/>
      <xsl:apply-templates select="n:seCustomConfiguration"/>
      <!-- sSoftware: Remove -->
      <!-- Split "d" and "e" State Collected Element -->
      <xsl:if test="n:sElement/n:sElement.01[starts-with(., 'd')]">
        <dState>
          <xsl:apply-templates select="n:sElement/n:sElement.01[starts-with(., 'd')]"/>
        </dState>
      </xsl:if>
      <xsl:if test="n:sElement/n:sElement.01[starts-with(., 'e')]">
        <eState>
          <xsl:apply-templates select="n:sElement/n:sElement.01[starts-with(., 'e')]"/>
        </eState>
      </xsl:if>
      <xsl:apply-templates select="n:sConfiguration"/>
      <xsl:apply-templates select="n:sAgency"/>
      <xsl:apply-templates select="n:sFacility"/>
    </xsl:copy>
  </xsl:template>

  <!-- @effectiveDate: Remove -->
  <xsl:template match="@effectiveDate"/>

  <!-- sState.01: Un-enclose -->
  <xsl:template match="n:sState">
    <xsl:apply-templates select="n:sState.01"/>
  </xsl:template>

  <!-- seCustomConfiguration.08: Remove "Not Immunized", "Order Criteria Not Met", Approximate", "Symptom Not Present" -->
  <xsl:template match="n:seCustomConfiguration.08[. = ('8801025', '8801027', '8801029', '8801031')]"/>

  <!-- sdCustomConfiguration.08: Remove "Not Immunized", "Order Criteria Not Met", Approximate", "Symptom Not Present" -->
  <xsl:template match="n:sdCustomConfiguration.08[. = ('8801025', '8801027', '8801029', '8801031')]"/>

  <!-- sElement.01: Rename; remove if not starting with "d" or "e" (also remove if empty) -->
  <xsl:template match="n:sElement.01">
    <xsl:if test="starts-with(., 'd') or starts-with(., 'e')">
      <xsl:element name="{concat(substring(., 1, 1), 'State.01')}">
        <xsl:apply-templates select="@* | node()"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!-- sConfiguration.01: Map from StateCertificationLicensureLevels to LicenseLevels data type, remove if empty -->
  <xsl:template match="n:sConfiguration.01">
    <xsl:if test=". != ''">
      <xsl:element name="{n:name(.)}">
        <xsl:choose>
          <!--  Advanced Emergency Medical Technician (AEMT) => 2009 Advanced Emergency Medical Technician (AEMT) -->
          <xsl:when test=". = '9917001'">9911001</xsl:when>
          <!--  Emergency Medical Technician - Intermediate => EMT-Intermediate -->
          <xsl:when test=". = '9917002'">9911011</xsl:when>
          <!--  Emergency Medical Responder (EMR) => 2009 Emergency Medical Responder (EMR) -->
          <xsl:when test=". = '9917003'">9911003</xsl:when>
          <!--  Emergency Medical Technician (EMT) => 2009 Emergency Medical Technician (EMT) -->
          <xsl:when test=". = '9917005'">9911005</xsl:when>
          <!--  Paramedic => 2009 Paramedic -->
          <xsl:when test=". = '9917007'">9911007</xsl:when>
          <!--  Physician -->
          <xsl:when test=". = '9917019'">9911021</xsl:when>
          <!--  Critical Care Paramedic -->
          <xsl:when test=". = '9917021'">9911023</xsl:when>
          <!--  Community Paramedicine -->
          <xsl:when test=". = '9917023'">9911025</xsl:when>
          <!--  Nurse Practitioner -->
          <xsl:when test=". = '9917025'">9911027</xsl:when>
          <!--  Physician Assistant -->
          <xsl:when test=". = '9917027'">9911029</xsl:when>
          <!--  Licensed Practical Nurse (LPN) -->
          <xsl:when test=". = '9917029'">9911031</xsl:when>
          <!--  Registered Nurse -->
          <xsl:when test=". = '9917031'">9911033</xsl:when>
        </xsl:choose>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <!-- sConfiguration.02: Remove if empty -->
  <xsl:template match="n:sConfiguration.02[. = '']"/>

  <!-- sConfiguration.02, sConfiguration.04: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:sConfiguration.02[. = '9917002'] | n:sConfiguration.04[. = '9917002']">
    <xsl:element name="{n:name(.)}">
      <xsl:text>9917013</xsl:text>
    </xsl:element>
  </xsl:template>

  <!-- sConfiguration.04: Remove if empty -->
  <xsl:template match="n:sConfiguration.04[. = '']"/>

  <!-- sConfiguration.05: Remove if empty; remove SNOMED codes -->
  <xsl:template match="n:sConfiguration.05[. = '' or @CodeType = '9924005' or string-length(.) > 7]"/>

  <!-- sConfiguration.05: Remove @CodeType -->
  <xsl:template match="n:sConfiguration.05/@CodeType"/>

  <!-- sAgency.01: Remove if empty -->
  <xsl:template match="n:sAgency.01[. = '']"/>

  <!-- sAgency.02: Remove if empty -->
  <xsl:template match="n:sAgency.02[. = '']"/>

  <!-- sFacility.01: Remove if empty -->
  <xsl:template match="n:sFacility.01[. = '']"/>

  <!-- sFacility.01: Map "Diagnostic Services", "Freestanding Emergency Department", "Morgue/Mortuary", "Police/Jail", "Other EMS Responder (air)", "Other EMS Responder (ground)", "Other Recurring Care Center", "Drug and/or Alcohol Rehabilitation Facility", "Skilled Nursing Facility" to "Other" -->
  <xsl:template match="n:sFacility.01[. = ('1701021', '1701023', '1701025', '1701027', '1701029', '1701031', '1701033', '1701035')]">
    <xsl:element name="{n:name(.)}">
      <xsl:text>1701009</xsl:text>
    </xsl:element>
  </xsl:template>

  <!-- sFacility.02: Remove if empty -->
  <xsl:template match="n:sFacility.02[. = '']"/>

  <!-- sFacility.03: Remove if empty -->
  <xsl:template match="n:sFacility.03[. = '']"/>

  <!-- sFacility.04: Remove if empty -->
  <xsl:template match="n:sFacility.04[. = '']"/>

  <!-- sFacility.04: Map "Stroke-..." to "Stroke Center" -->
  <xsl:template match="n:sFacility.04[. = ('9908037', '9908039', '9908041', '9908043')]">
    <xsl:element name="{n:name(.)}">
      <xsl:apply-templates select="@*"/>
      <xsl:text>9908017</xsl:text>
    </xsl:element>
  </xsl:template>

  <!-- sFacility.04: Remove "Cancer Center" and "Labor and Delivery" -->
  <!-- JL: Check -->
  <xsl:template match="n:sFacility.04[. = ('9908045', '9908047')]"/>

  <!-- sFacility.09: Remove if empty -->
  <xsl:template match="n:sFacility.09[. = '']"/>

  <!-- sFacility.10: Remove if empty -->
  <xsl:template match="n:sFacility.10[. = '']"/>

  <!-- sFacility.11: Remove if empty -->
  <xsl:template match="n:sFacility.11[. = '']"/>

  <!-- Elements: Map element name -->
  <xsl:function name="n:name" as="xs:string">
    <xsl:param name="element" as="node()"/>
    <xsl:value-of select="(key('key_element_names', local-name($element), $element_names)/@v340, local-name($element))[1]"/>
  </xsl:function>

  <!-- Element name mapping variable -->
  <xsl:variable name="element_names">
    <element v340="dConfiguration.01"                 v350="sState.01"/>
    <element v340="dCustomConfiguration"              v350="sdCustomConfiguration"/>
    <element v340="dCustomConfiguration.CustomGroup"  v350="sdCustomConfiguration.CustomGroup"/>
    <element v340="dCustomConfiguration.01"           v350="sdCustomConfiguration.01"/>
    <element v340="dCustomConfiguration.02"           v350="sdCustomConfiguration.02"/>
    <element v340="dCustomConfiguration.03"           v350="sdCustomConfiguration.03"/>
    <element v340="dCustomConfiguration.04"           v350="sdCustomConfiguration.04"/>
    <element v340="dCustomConfiguration.05"           v350="sdCustomConfiguration.05"/>
    <element v340="dCustomConfiguration.06"           v350="sdCustomConfiguration.06"/>
    <element v340="dCustomConfiguration.07"           v350="sdCustomConfiguration.07"/>
    <element v340="dCustomConfiguration.08"           v350="sdCustomConfiguration.08"/>
    <element v340="dCustomConfiguration.09"           v350="sdCustomConfiguration.09"/>
    <element v340="eCustomConfiguration"              v350="seCustomConfiguration"/>
    <element v340="eCustomConfiguration.CustomGroup"  v350="seCustomConfiguration.CustomGroup"/>
    <element v340="eCustomConfiguration.01"           v350="seCustomConfiguration.01"/>
    <element v340="eCustomConfiguration.02"           v350="seCustomConfiguration.02"/>
    <element v340="eCustomConfiguration.03"           v350="seCustomConfiguration.03"/>
    <element v340="eCustomConfiguration.04"           v350="seCustomConfiguration.04"/>
    <element v340="eCustomConfiguration.05"           v350="seCustomConfiguration.05"/>
    <element v340="eCustomConfiguration.06"           v350="seCustomConfiguration.06"/>
    <element v340="eCustomConfiguration.07"           v350="seCustomConfiguration.07"/>
    <element v340="eCustomConfiguration.08"           v350="seCustomConfiguration.08"/>
    <element v340="eCustomConfiguration.09"           v350="seCustomConfiguration.09"/>
    <element v340="dState.01"                         v350="sElement.01"/>
    <element v340="eState.01"                         v350="sElement.01"/>
    <element v340="dConfiguration"                    v350="sConfiguration"/>
    <element v340="dConfiguration.02"                 v350="sConfiguration.01"/>
    <element v340="dConfiguration.ProcedureGroup"     v350="sConfiguration.ProcedureGroup"/>
    <element v340="dConfiguration.06"                 v350="sConfiguration.02"/>
    <element v340="dConfiguration.03"                 v350="sConfiguration.03"/>
    <element v340="dConfiguration.MedicationGroup"    v350="sConfiguration.MedicationGroup"/>
    <element v340="dConfiguration.08"                 v350="sConfiguration.04"/>
    <element v340="dConfiguration.04"                 v350="sConfiguration.05"/>
    <element v340="dConfiguration.05"                 v350="sConfiguration.06"/>
    <element v340="dAgency"                           v350="sAgency"/>
    <element v340="dAgencyGroup"                      v350="sAgencyGroup"/>
    <element v340="dAgency.01"                        v350="sAgency.01"/>
    <element v340="dAgency.02"                        v350="sAgency.02"/>
    <element v340="dAgency.03"                        v350="sAgency.03"/>
    <element v340="dFacility"                         v350="sFacility"/>
    <element v340="dFacilityGroup"                    v350="sFacilityGroup"/>
    <element v340="dFacility.01"                      v350="sFacility.01"/>
    <element v340="dFacility.FacilityGroup"           v350="sFacility.FacilityGroup"/>
    <element v340="dFacility.02"                      v350="sFacility.02"/>
    <element v340="dFacility.03"                      v350="sFacility.03"/>
    <element v340="dFacility.04"                      v350="sFacility.04"/>
    <element v340="dFacility.05"                      v350="sFacility.05"/>
    <element v340="dFacility.06"                      v350="sFacility.06"/>
    <element v340="dFacility.07"                      v350="sFacility.07"/>
    <element v340="dFacility.08"                      v350="sFacility.08"/>
    <element v340="dFacility.09"                      v350="sFacility.09"/>
    <element v340="dFacility.10"                      v350="sFacility.10"/>
    <element v340="dFacility.11"                      v350="sFacility.11"/>
    <element v340="dFacility.12"                      v350="sFacility.12"/>
    <element v340="dFacility.13"                      v350="sFacility.13"/>
    <element v340="dFacility.14"                      v350="sFacility.14"/>
    <element v340="dFacility.15"                      v350="sFacility.15"/>
  </xsl:variable>

</xsl:stylesheet>
