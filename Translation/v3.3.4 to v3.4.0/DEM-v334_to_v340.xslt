<?xml version="1.0" encoding="UTF-8"?>

<!--

XML Stylesheet Language Transformation (XSLT) to transform NEMSIS DEMDataSet from 3.3.4 to v3.4.0

Version: 3.3.4.160713CP2_3.4.0.160713CP2_180108
Revision Date: January 8, 2018

-->

<xsl:stylesheet version="2.0"
	xmlns="http://www.nemsis.org"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n="http://www.nemsis.org"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="n">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:comment>&#32;This NEMSIS 3.4.0 document was generated from a NEMSIS 3.3.4 document via an XML Stylesheet Language Transformation (XSLT).&#32;</xsl:comment>
    <xsl:text>&#10;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="node()"/>
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

  <!-- dAgency.04, dAgency.05: Map to "00" if not matching pattern (elements are mandatory) -->
  <xsl:template match="n:dAgency.04[not(matches(., '^[0-9]{2}$'))] | 
                       n:dAgency.05[not(matches(., '^[0-9]{2}$'))] | 
                       n:dConfiguration.01[not(matches(., '^[0-9]{2}$'))]">
    <xsl:copy>00</xsl:copy>
  </xsl:template>

  <!-- dAgency.06: Map to "00000" if not matching pattern (element is mandatory) -->
  <xsl:template match="n:dAgency.06[. != '' and not(matches(., '^[0-9]{5}$'))]">
    <xsl:copy>00000</xsl:copy>
  </xsl:template>

  <!-- dAgency.11, dConfiguration.06, dConfiguration.08, dVehicle.05: Map "Nurse" to "Registered Nurse" -->
  <xsl:template match="n:dAgency.11[. = '9917017'] | 
                       n:dConfiguration.06[. = '9917017'] | 
                       n:dConfiguration.08[. = '9917017'] | 
                       n:dVehicle.05[. = '9917017']">
    <xsl:copy>9917031</xsl:copy>
  </xsl:template>

  <!-- dContact.07, dLocation.08, dPersonnel.06, dPersonnel.22, dFacility.09: Remove if not matching pattern -->
  <xsl:template match="n:dContact.07[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:dLocation.08[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:dPersonnel.06[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:dPersonnel.22[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:dFacility.09[. != '' and not(matches(., '^[0-9]{2}$'))]"/>

  <!-- dConfiguration.02: Map "Nurse" to "Registered Nurse" -->
  <xsl:template match="n:dConfiguration.02[. = '9911017']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9911033</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- dConfiguration.05, dConfiguration.10: Map "Exposure-Carbon Monoxide/Smoke Inhalation" to "Exposure-Carbon Monoxide" and "Exposure-Smoke Inhalation" -->
  <xsl:template match="n:dConfiguration.05[. = '9914039'] | 
                       n:dConfiguration.10[. = '9914039']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9914167</xsl:text>
    </xsl:copy>
    <xsl:copy>9914173</xsl:copy>
  </xsl:template>

  <!-- dLocation.10, dFacility.11: Remove if not matching pattern -->
  <xsl:template match="n:dLocation.10[not(matches(., '^[0-9]{5}$'))] | 
                       n:dFacility.11[not(matches(., '^[0-9]{5}$'))]"/>

  <!-- dPersonnel.24, dPersonnel.38: Map "Nurse" to "Registered Nurse" -->
  <xsl:template match="n:dPersonnel.24[. = '9925021'] | 
                       n:dPersonnel.38[. = '9925021']">
    <xsl:copy>9925043</xsl:copy>
  </xsl:template>

  <!-- dPersonnel.29: Translate code for 2009 Advanced Emergency Medical Technician (AEMT) -->
  <xsl:template match="n:dPersonnel.29[. = '1529901']">
    <xsl:copy>1529001</xsl:copy>
  </xsl:template>

  <!-- dFacility.04: Map "STEMI" to "Cardiac-STEMI/PCI Capable" -->
  <xsl:template match="n:dFacility.04[. = '9908013']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9908031</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- dFacility.04: Map "STEMI Center (24/7)" to "Cardiac-STEMI/PCI Capable (24/7)" -->
  <xsl:template match="n:dFacility.04[. = '9908015']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9908033</xsl:text>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
