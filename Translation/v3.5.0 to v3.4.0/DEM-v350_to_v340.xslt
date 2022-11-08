<?xml version="1.0" encoding="UTF-8"?>

<!--

XML Stylesheet Language Transformation (XSLT) to transform NEMSIS DEMDataSet from v3.5.0 to v3.4.0

Version: 3.5.0.211008CP3_3.4.0.200910CP2_221107
Revision Date: November 7, 2022

-->

<xsl:stylesheet version="2.0"
	xmlns="http://www.nemsis.org"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n="http://www.nemsis.org"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="n xs">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:attribute-set name="NotRecorded">
    <xsl:attribute name="xsi:nil" namespace="http://www.w3.org/2001/XMLSchema-instance">true</xsl:attribute>
    <xsl:attribute name="NV">7701003</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="/">
    <xsl:comment>&#32;This NEMSIS 3.4.0 document was generated from a NEMSIS 3.5.0 document via an XML Stylesheet Language Transformation (XSLT).&#32;</xsl:comment>
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@xsi:schemaLocation">
    <xsl:attribute name="xsi:schemaLocation">http://www.nemsis.org http://www.nemsis.org/media/nemsis_v3/release-3.4.0/XSDs/NEMSIS_XSDs/DEMDataSet_v3.xsd</xsl:attribute>
  </xsl:template>

  <!-- @UUID: Remove -->
  <xsl:template match="@UUID"/>

  <!-- dCustomConfiguration.08: Remove "Not Immunized", "Order Criteria Not Met", Approximate", "Symptom Not Present" -->
  <xsl:template match="n:dCustomConfiguration.08[. = ('8801025', '8801027', '8801029', '8801031')]"/>

  <!-- dAgency.11, dConfiguration.06, dConfiguration.08, dVehicle.05: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:dAgency.11[. = '9917002'] | 
                       n:dConfiguration.06[. = '9917002'] | 
                       n:dConfiguration.08[. = '9917002'] | 
                       n:dVehicle.05[. = '9917002']">
    <xsl:copy>9917013</xsl:copy>
  </xsl:template>

  <!-- dAgency.AgencyYearGroup: Insert if missing -->
  <xsl:template match="n:dAgency.14[not(following-sibling::n:dAgency.AgencyYearGroup)]">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
    <dAgency.AgencyYearGroup>
      <dAgency.15>
        <xsl:value-of select="year-from-date(current-date()) - 1"/>
      </dAgency.15>
      <dAgency.16 xsi:nil="true" NV="7701003"/>
      <dAgency.17 xsi:nil="true" NV="7701003"/>
      <dAgency.18 xsi:nil="true" NV="7701003"/>
      <dAgency.19 xsi:nil="true" NV="7701003"/>
      <dAgency.20 xsi:nil="true" NV="7701003"/>
      <dAgency.21 xsi:nil="true" NV="7701003"/>
    </dAgency.AgencyYearGroup>
  </xsl:template>

  <!-- dAgency.AgencyYearGroup: Insert mandatory/required children if missing -->
  <xsl:template match="n:dAgency.AgencyYearGroup">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:choose>
        <xsl:when test="n:dAgency.15">
          <xsl:apply-templates select="n:dAgency.15"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.15>
            <xsl:value-of select="year-from-date(current-date()) - 1"/>
          </dAgency.15>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.16">
          <xsl:apply-templates select="n:dAgency.16"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.16 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.17">
          <xsl:apply-templates select="n:dAgency.17"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.17 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.18">
          <xsl:apply-templates select="n:dAgency.18"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.18 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.19">
          <xsl:apply-templates select="n:dAgency.19"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.19 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.20">
          <xsl:apply-templates select="n:dAgency.20"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.20 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="n:dAgency.21">
          <xsl:apply-templates select="n:dAgency.21"/>
        </xsl:when>
        <xsl:otherwise>
          <dAgency.21 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="n:dAgency.22"/>
    </xsl:copy>
  </xsl:template>

  <!-- dAgency.15: Map blank to last year -->
  <xsl:template match="n:dAgency.15[. = '']">
    <xsl:copy>
      <xsl:value-of select="year-from-date(current-date()) - 1"/>
    </xsl:copy>
  </xsl:template>

  <!-- dAgency.16, dAgency.17, dAgency.18, dAgency.19, dAgency.20, dAgency.21, dAgency.22: Truncate -->
  <xsl:template match="n:dAgency.16 | n:dAgency.17 | n:dAgency.18 | n:dAgency.19 | n:dAgency.20 | n:dAgency.21 | n:dAgency.22">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:choose>
        <xsl:when test=". != '' and xs:integer(.) > 4000000">
          <xsl:text>4000000</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- dAgency.16, dAgency.17, dAgency.18, dAgency.19, dAgency.20, dAgency.21: Map @NV "Not Reporting" to @NV "Not Recorded" -->
  <xsl:template match="n:dAgency.16/@NV[. = '7701005'] | 
                       n:dAgency.17/@NV[. = '7701005'] | 
                       n:dAgency.18/@NV[. = '7701005'] | 
                       n:dAgency.19/@NV[. = '7701005'] | 
                       n:dAgency.20/@NV[. = '7701005'] | 
                       n:dAgency.21/@NV[. = '7701005']">
    <xsl:attribute name="NV">7701003</xsl:attribute>
  </xsl:template>

  <!-- dConfiguration.02, dConfiguration.03, dConfiguration.04, dConfiguration.05: Insert -->
  <xsl:template match="n:dConfiguration.01">
    <xsl:copy-of select="."/>
    <!-- dConfiguration.02 is mandatory; set to "Other" -->
    <dConfiguration.02>9911019</dConfiguration.02>
    <dConfiguration.03 xsi:nil="true" NV="7701003"/>
    <dConfiguration.04 xsi:nil="true" NV="7701003"/>
    <dConfiguration.05 xsi:nil="true" NV="7701003"/>
  </xsl:template>

  <!-- dConfiguration.MedicationGroup: Insert dConfiguration.09 if there are no instances where dConfiguration.09 is not a SNOMED code -->
  <xsl:template match="n:dConfiguration.MedicationGroup[not(n:dConfiguration.09[not(@CodeType = '9924005' or string-length(.) > 7)])]">
    <xsl:copy>
      <xsl:apply-templates select="@* | n:dConfiguration.08"/>
      <!-- Set dConfiguration.09 to "Oxygen" -->
      <dConfiguration.09>7806</dConfiguration.09>
    </xsl:copy>
  </xsl:template>

  <!-- dConfiguration.09: Remove SNOMED codes -->
  <xsl:template match="n:dConfiguration.09[@CodeType = '9924005' or string-length(.) > 7]"/>

  <!-- dConfiguration.09: Remove @CodeType -->
  <xsl:template match="n:dConfiguration.09/@CodeType"/>

  <!-- dConfiguration.11: Insert if there are no non-empty instances -->
  <xsl:template match="n:dConfiguration.10[not(following-sibling::n:dConfiguration.10) and not(following-sibling::n:dConfiguration.11[. != ''])]">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
    <!-- Set to "None" -->
    <dConfiguration.11>1211019</dConfiguration.11>
  </xsl:template>

  <!-- dConfiguration.11: Remove empty instances -->
  <xsl:template match="n:dConfiguration.11[. = '']"/>

  <!-- dConfiguration.15: Insert if there are no non-empty instances -->
  <xsl:template match="n:dConfiguration.16[not(preceding-sibling::n:dConfiguration.16) and not(preceding-sibling::n:dConfiguration.15[. != ''])]">
    <!-- Set to "Vital Sign Monitoring" -->
    <dConfiguration.15>1215019</dConfiguration.15>
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- dConfiguration.15: Remove empty instances -->
  <xsl:template match="n:dConfiguration.15[. = '']"/>

  <!-- dPersonnel.12: Map "Female-to-Male, Transgender Male", "Male-to-Female, Transgender Female", "Other, neither exclusively male or female" to "Unknown (Unable to Determine)" -->
  <xsl:template match="n:dPersonnel.12[. = ('9906007', '9906009', '9906011')]">
    <xsl:copy>9906005</xsl:copy>
  </xsl:template>

  <!-- dPersonnel.ImmunizationsGroup: Remove if dPersonnel.18 is "None"-->
  <xsl:template match="n:dPersonnel.ImmunizationsGroup[n:dPersonnel.18 = '9910053']"/>

  <!-- dPersonnel.24, dPersonnel.38: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:dPersonnel.24[. = '9925002'] | 
                       n:dPersonnel.38[. = '9925002']">
    <xsl:copy>9925017</xsl:copy>
  </xsl:template>

  <!-- dPersonnel.29: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:dPersonnel.29[. = '1529012']">
    <xsl:copy>1529011</xsl:copy>
  </xsl:template>

  <!-- dFacility.01: Map "Diagnostic Services", "Freestanding Emergency Department", "Morgue/Mortuary", "Police/Jail", "Other EMS Responder (air)", "Other EMS Responder (ground)", "Other Recurring Care Center", "Drug and/or Alcohol Rehabilitation Facility", "Skilled Nursing Facility" to "Other" -->
  <xsl:template match="n:dFacility.01[. = ('1701019', '1701021', '1701023', '1701025', '1701027', '1701029', '1701031', '1701033', '1701035')]">
    <xsl:copy>1701009</xsl:copy>
  </xsl:template>

  <!-- dFacility.04: Map "Stroke-..." to "Stroke Center" -->
  <xsl:template match="n:dFacility.04[. = ('9908037', '9908039', '9908041', '9908043')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9908017</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- dFacility.04: Remove "Cancer Center" and "Labor and Delivery" -->
  <xsl:template match="n:dFacility.04[. = ('9908045', '9908047')]"/>

  <!-- dCustomResults.01: Map to "Not Recorded" if @PN is "Not Immunized", "Order Criteria Not Present", "Symptom Not Present" -->
  <xsl:template match="n:dCustomResults.01[@PN = ('8801025', '8801027', '8801031')]">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

</xsl:stylesheet>
