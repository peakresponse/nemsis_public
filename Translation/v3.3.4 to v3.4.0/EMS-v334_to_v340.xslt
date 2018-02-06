<?xml version="1.0" encoding="UTF-8"?>

<!--

XML Stylesheet Language Transformation (XSLT) to transform NEMSIS EMSDataSet from 3.3.4 to v3.4.0

Version: 3.3.4.160713CP2_3.4.0.160713CP2_180108
Revision Date: January 8, 2018

-->

<xsl:stylesheet version="2.0"
	xmlns="http://www.nemsis.org"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:n="http://www.nemsis.org"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="n xs">

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
    <xsl:attribute name="xsi:schemaLocation">http://www.nemsis.org http://www.nemsis.org/media/nemsis_v3/release-3.4.0/XSDs/NEMSIS_XSDs/EMSDataSet_v3.xsd</xsl:attribute>
  </xsl:template>

  <!-- dAgency.04: Map to "00" if not matching pattern (elements are mandatory) -->
  <xsl:template match="n:dAgency.04[not(matches(., '^[0-9]{2}$'))]">
    <xsl:copy>00</xsl:copy>
  </xsl:template>

  <!-- eResponse.07: Map "Air Transport" to "Air Transport-Helicopter" -->
  <xsl:template match="n:eResponse.07[. = '2207001']">
    <xsl:copy>2207011</xsl:copy>
  </xsl:template>

  <!-- eCrew.02: Map "Nurse" to "Registered Nurse" -->
  <xsl:template match="n:eCrew.02[. = '9925021']">
    <xsl:copy>9925043</xsl:copy>
  </xsl:template>

  <!-- ePatient.07, eScene.21, eDisposition.06: Map to "Not Recorded" if not matching pattern -->
  <xsl:template match="n:ePatient.07[. != '' and not(matches(., '^[0-9]{5}$'))] | 
                       n:eScene.21[. != '' and not(matches(., '^[0-9]{5}$'))] | 
                       n:eDisposition.06[. != '' and not(matches(., '^[0-9]{5}$'))]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="NV">7701003</xsl:attribute>
      <xsl:attribute name="xsi:nil">true</xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <!-- ePatient.08, eScene.18, eDisposition.05: Map to "Not Recorded" if not matching pattern -->
  <xsl:template match="n:ePatient.08[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:eScene.18[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:eDisposition.05[. != '' and not(matches(., '^[0-9]{2}$'))]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="NV">7701003</xsl:attribute>
      <xsl:attribute name="xsi:nil">true</xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <!-- ePatient.12: Remove if not matching pattern -->
  <xsl:template match="n:ePatient.12[not(matches(., '^[0-9]{9}$'))]"/>

  <!-- ePatient.20, n:ePayment.14, n:ePayment.28, n:ePayment.36: Remove if not matching pattern -->
  <xsl:template match="n:ePatient.20[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:ePayment.14[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:ePayment.28[. != '' and not(matches(., '^[0-9]{2}$'))] | 
                       n:ePayment.36[. != '' and not(matches(., '^[0-9]{2}$'))]"/>

  <!-- ePayment.10: Truncate -->
  <xsl:template match="n:ePayment.10[string-length(.) > 60]">
    <xsl:copy>
      <xsl:value-of select="substring(., 1, 60)"/>
    </xsl:copy>
  </xsl:template>

  <!-- ePayment.22: Map "Other" to "Other Relationship" -->
  <xsl:template match="n:ePayment.22[. = '2622007']">
    <xsl:copy>2622019</xsl:copy>
  </xsl:template>

  <!-- ePayment.43: Remove -->
  <xsl:template match="n:ePayment.43"/>

  <!-- ePayment.53: Truncate -->
  <xsl:template match="n:ePayment.53[string-length(.) > 50]">
    <xsl:copy>
      <xsl:value-of select="substring(., 1, 50)"/>
    </xsl:copy>
  </xsl:template>

  <!-- eInjury.01, eOutcome.08: Truncate if not matching pattern -->
  <xsl:template match="n:eInjury.01[. != '' and matches(., '([TV-Y][0-9]{2})((\.[0-9A-Z]{1,7})?)') and not(matches(., '^([TV-Y][0-9]{2})((\.[0-9A-Z]{1,4})?)$'))] | 
                       n:eOutcome.08[. != '' and matches(., '([TV-Y][0-9]{2})((\.[0-9A-Z]{1,7})?)') and not(matches(., '^([TV-Y][0-9]{2})((\.[0-9A-Z]{1,4})?)$'))]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="substring(., 1, 8)"/>
    </xsl:copy>
  </xsl:template>

  <!-- eInjury.04: Map @PN to "Not Recorded" -->
  <xsl:template match="n:eInjury.04[@PN]">
    <xsl:copy>
      <xsl:attribute name="xsi:nil">true</xsl:attribute>
      <xsl:attribute name="NV">7701003</xsl:attribute>
      <xsl:apply-templates select="@CorrelationID"/>
    </xsl:copy>
  </xsl:template>

  <!-- eArrest.10: Remove -->
  <xsl:template match="n:eArrest.10"/>

  <!-- eArrest.11: Map "Bradycardia" to "PEA" -->
  <xsl:template match="n:eArrest.11[. = '3011003']">
    <xsl:copy>3011005</xsl:copy>
  </xsl:template>

  <!-- eExam.05: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.05[. = ('3505025' , '3505027')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3505045</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.06: Remove "Decapitation" -->
  <xsl:template match="n:eExam.06[. = '3506019']" />

  <!-- eExam.06: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.06[. = ('3506027' , '3506029')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3506047</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.07: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.07[. = ('3507021' , '3507023')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3507049</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.08: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.08[. = ('3508043' , '3508045')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3508097</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.11: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.11[. = ('3511027' , '3511029')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3511053</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.12: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.12[. = ('3512029' , '3512031')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3512059</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.13: Remove "Crush Injury" -->
  <xsl:template match="n:eExam.13[. = '3513027']" />

  <!-- eExam.14: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.14[. = ('3514021' , '3514023')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3514047</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.16: Map "Gunshot Wound-..." to "Gunshot Wound" -->
  <xsl:template match="n:eExam.16[. = ('3516037' , '3516039')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3516077</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.20: Map "Reported Stroke Symptoms Resolved..." values to eExam.21 values -->
  <xsl:template match="n:eExam.20[. = ('3520047' , '3520049')]"/>
  <xsl:template match="n:eExam[n:eExam.AssessmentGroup/n:eExam.20[. = ('3520047' , '3520049') and not(@PN)]]">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
      <xsl:choose>
        <xsl:when test="n:eExam.AssessmentGroup/n:eExam.20[. = '3520047' and not(@PN)]">
          <eExam.21>3521003</eExam.21>
        </xsl:when>
        <xsl:when test="n:eExam.AssessmentGroup/n:eExam.20[. = '3520049' and not(@PN)]">
          <eExam.21>3521005</eExam.21>
        </xsl:when>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- eProtocols.01: Map "Exposure-Carbon Monoxide/Smoke Inhalation" to "Exposure-Carbon Monoxide" and "Exposure-Smoke Inhalation" -->
  <xsl:template match="n:eProtocols.ProtocolGroup[n:eProtocols.01 = '9914039']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <eProtocols.01>9914167</eProtocols.01>
      <xsl:apply-templates select="n:eProtocols.02"/>
    </xsl:copy>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <eProtocols.01>9914173</eProtocols.01>
      <xsl:apply-templates select="n:eProtocols.02"/>
    </xsl:copy>
  </xsl:template>

  <!-- eMedications.08: Map "Itching/Urticaria" to "Itching" and "Urticaria" -->
  <xsl:template match="n:eMedications.08[. = '3708027']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3708043</xsl:text>
    </xsl:copy>
    <xsl:copy>3708045</xsl:copy>
  </xsl:template>

  <!-- eMedications.10, eProcedures.10: Map "Nurse" to "Registered Nurse" -->
  <xsl:template match="n:eProcedures.10[. = '9905017'] | 
                       n:eMedications.10[. = '9905017']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>9905041</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eProcedures.07: Map "Itching/Urticaria" to "Itching" and "Urticaria" -->
  <xsl:template match="n:eProcedures.07[. = '3907029']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3907049</xsl:text>
    </xsl:copy>
    <xsl:copy>3907051</xsl:copy>
  </xsl:template>

  <!-- eProcedures.07: Map "Portacath" to "Other" -->
  <xsl:template match="n:eProcedures.07[. = '3907037']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3907035</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eAirway.AirwayGroup: Move eAirway.08 and eAirway.09 out of eAirway.ConfirmationGroup -->
  <xsl:template match="n:eAirway.AirwayGroup[n:eAirway.ConfirmationGroup[n:eAirway.08 or n:eAirway.09]]">
    <xsl:copy>
      <xsl:apply-templates select="@* | n:eAirway.01 | n:eAirway.ConfirmationGroup"/>
      <xsl:apply-templates select="n:eAirway.ConfirmationGroup/n:eAirway.08"/>
      <xsl:apply-templates select="n:eAirway.ConfirmationGroup/n:eAirway.09"/>
      <xsl:apply-templates select="n:eAirway.10 | n:eAirway.11"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="n:eAirway.ConfirmationGroup[n:eAirway.08 or n:eAirway.09]">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()[not(local-name() = ('eAirway.08', 'eAirway.09'))]"/>
    </xsl:copy>
  </xsl:template>

  <!-- eDisposition.19: Map new values to existing values by comparing to eDisposition.13 (not precise) -->
  <xsl:template match="n:eDisposition.19[. != '']">
    <xsl:copy>
      <xsl:choose>
        <!-- If eSituation.13 is empty, unable to map -->
        <xsl:when test="../../n:eSituation/n:eSituation.13 = ''">
          <xsl:attribute name="xsi:nil">true</xsl:attribute>
          <xsl:attribute name="NV">7701003</xsl:attribute>
        </xsl:when>
        <!-- Improved -->
        <xsl:when test=". = '9916001'">
          <xsl:choose>
            <!-- Dead without Resuscitation Efforts (Black) => Critical (Red) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813007'">4219001</xsl:when>
            <!-- Critical (Red) => Emergent (Yellow) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813001'">4219003</xsl:when>
            <!-- Otherwise => Lower Acuity (Green) -->
            <xsl:otherwise>9916005</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- Unchanged -->
        <xsl:when test=". = '9916003'">
          <xsl:choose>
            <!-- Dead without Resuscitation Efforts (Black) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813007'">4219007</xsl:when>
            <!-- Critical (Red) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813001'">4219001</xsl:when>
            <!-- Emergent (Yellow) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813003'">4219003</xsl:when>
            <!-- Otherise: Lower Acuity (Green) -->
            <xsl:otherwise>9916005</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- Worse -->
        <xsl:when test=". = '9916005'">
          <xsl:choose>
            <!-- Lower Acuity (Green) => Emergent (Yellow) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813005'">4219003</xsl:when>
            <!-- Emergent (Yellow) => Critical (Red) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813003'">4219001</xsl:when>
            <!-- Critical (Red) => Dead without Resuscitation Efforts (Black) -->
            <xsl:when test="../../n:eSituation/n:eSituation.13 = '2813001'">4219007</xsl:when>
            <!-- Otherwise => Dead without Resuscitation Efforts (Black) -->
            <xsl:otherwise>9916005</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- eDisposition.23: Map "STEMI" => "Cardiac-STEMI/PCI Capable" -->
  <xsl:template match="n:eDisposition.23[. = '9908013']">
    <xsl:copy>9908031</xsl:copy>
  </xsl:template>

  <!-- eDisposition.23: "STEMI Center (24/7)" to "Cardiac-STEMI/PCI Capable (24/7)" -->
  <xsl:template match="n:eDisposition.23[. = '9908015']">
    <xsl:copy>9908033</xsl:copy>
  </xsl:template>

  <!-- eOther.09: Map "Sound Recording" to "Other Audio Recording" -->
  <xsl:template match="n:eOther.09[. = '4509023']">
    <xsl:copy>4509001</xsl:copy>
  </xsl:template>

</xsl:stylesheet>
