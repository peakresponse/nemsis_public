<?xml version="1.0" encoding="UTF-8"?>

<!--

XML Stylesheet Language Transformation (XSLT) to transform NEMSIS EMSDataSet from v3.5.0 to v3.4.0

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

  <xsl:attribute-set name="NotRecorded" namespace="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:attribute name="xsi:nil">true</xsl:attribute>
    <xsl:attribute name="NV">7701003</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="/">
    <xsl:comment>&#32;This NEMSIS 3.4.0 document was generated from a NEMSIS 3.5.0 document via an XML Stylesheet Language Transformation (XSLT).&#32;</xsl:comment>
    <xsl:text>&#10;</xsl:text>
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
    <xsl:attribute name="xsi:schemaLocation">http://www.nemsis.org http://www.nemsis.org/media/nemsis_v3/release-3.4.0/XSDs/NEMSIS_XSDs/EMSDataSet_v3.xsd</xsl:attribute>
  </xsl:template>

  <!-- @UUID: Remove -->
  <xsl:template match="@UUID"/>

  <!-- eCustomConfiguration.08: Remove "Not Immunized", "Order Criteria Not Met", "Approximate", "Symptom Not Present" -->
  <xsl:template match="n:eCustomConfiguration.08[. = ('8801025', '8801027', '8801029', '8801031')]"/>

  <!-- eResponse.05: Map new values -->
  <!-- JL: Check -->
  <xsl:template match="n:eResponse.05">
    <xsl:copy>
      <xsl:choose>
        <!-- Hospital to Non-Hospital Facility Transfer, Non-Hospital Facility to Non-Hospital Facility Transfer, Non-Hospital Facility to Hospital Transfer => Medical Transport -->
        <xsl:when test=". = ('2205015', '2205017', '2205019')">2205007</xsl:when>
        <!-- Support Services, Non-Patient Care Rescue/Extrication, Crew Transport Only, Transport of Organs or Body Parts, Mortuary Services, Mobile Integrated Health Care Encounter, Evaluation for Special Referral/Intake Programs, Administrative Operations => Public Assistance/Other Not Listed -->
        <xsl:when test=". = ('2205021', '2205023', '2205025', '2205027', '2205029', '2205031', '2205033', '2205035')">2205011</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- eResponse.07: Map new values -->
  <xsl:template match="n:eResponse.07[not(. = ('2207011', '2207013'))]">
    <xsl:copy>
      <xsl:choose>
        <!-- Ground Transport..., Wheel Chair Van/Ambulette => Ground Transport -->
        <xsl:when test=". = ('2207015', '2207017', '2207019', '2207025')">2207003</xsl:when>
        <!-- Non-Transport-Medical Treatment... => Non-Transport Rescue -->
        <xsl:when test=". = ('2207021', '2207023')">2207009</xsl:when>
        <!-- Non-Transport-No Medical Equipment... => Non-Transport Administrative (e.g., Supervisor) -->
        <!-- JL: Or should it be Non-Transport Assistance? -->
        <xsl:when test=". = ('2207025')">2207005</xsl:when>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

  <!-- eResponse.08: Map "Communication Specialist-Assignment Error", "No Receiving MD, Bed, Hospital", "Specialty Team Delay" to "Other" -->
  <xsl:template match="n:eResponse.08[. = ('2208019', '2208021', '2208023')]">
    <xsl:copy>2208015</xsl:copy>
  </xsl:template>

  <!-- eResponse.15: Map from eResponse.07, eCrew.02 -->
  <xsl:template match="n:eResponse.14">
    <xsl:copy-of select="."/>
    <eResponse.15>
      <xsl:choose>
        <!-- Air Transport..., ...ALS Equipped... -->
        <xsl:when test="../n:eResponse.07 = ('2207011', '2207013', '2207015', '2207021')">
          <xsl:choose>
            <!-- ALS-Physician => ALS-Physician -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925027'">2215019</xsl:when>
            <!-- ...Nurse... => ALS-Nurse -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = ('9925037', '9925041', '9925043')">2215017</xsl:when>
            <!-- Critical Care Paramedic => Specialty Critical Care -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925033'">2215021</xsl:when>
            <!-- Community Paramedicine => ALS-Community Paramedicine -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925035'">2215015</xsl:when>
            <!-- Paramedic => ALS-Paramedic -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925007'">2215013</xsl:when>
            <!-- Emergency Medical Technician - Intermediate => ALS-Intermediate -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925002'">2215011</xsl:when>
            <!-- Advanced Emergency Medical Technician (AEMT) => ALS-AEMT -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925001'">2215009</xsl:when>
            <!-- Otherwise, or eCrew.02 missing => ALS-Paramedic -->
            <xsl:otherwise>2215013</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- ...BLS Equipped... -->
        <xsl:when test="../n:eResponse.07 = ('2207017', '2207023')">
          <xsl:choose>
            <!-- Community Paramedicine => BLS-Community Paramedicine -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925035'">2215023</xsl:when>
            <!-- Emergency Medical Technician - Intermediate => BLS-Intermediate -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925002'">2215007</xsl:when>
            <!-- Advanced Emergency Medical Technician (AEMT) => BLS-AEMT -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925001'">2215005</xsl:when>
            <!-- Emergency Medical Technician (EMT) => BLS-Basic /EMT -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925005'">2215003</xsl:when>
            <!-- Emergency Medical Responder (EMR) => BLS-First Responder/EMR -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925003'">2215001</xsl:when>
            <!-- Otherwise, or eCrew.02 missing => BLS-Basic /EMT -->
            <xsl:otherwise>2215003</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- Ground Transport (Critical Care Equipped) => Specialty Critical Care -->
        <xsl:when test="../n:eResponse.07 = '2207019'">2215021</xsl:when>
        <!-- Wheel Chair Van/Ambulette => BLS-First Responder/EMR -->
        <xsl:when test="../n:eResponse.07 = '2207025'">2215001</xsl:when>
        <!-- Non-Transport-No Medical Equipment -->
        <xsl:when test="../n:eResponse.07 = '2207027'">
          <xsl:choose>
            <!-- ALS-Physician => ALS-Physician -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925027'">2215019</xsl:when>
            <!-- ...Nurse... => ALS-Nurse -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = ('9925037', '9925041', '9925043')">2215017</xsl:when>
            <!-- Critical Care Paramedic => Specialty Critical Care -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925033'">2215021</xsl:when>
            <!-- Community Paramedicine => ALS-Community Paramedicine -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925035'">2215015</xsl:when>
            <!-- Paramedic => ALS-Paramedic -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925007'">2215013</xsl:when>
            <!-- Emergency Medical Technician - Intermediate => ALS-Intermediate -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925002'">2215011</xsl:when>
            <!-- Advanced Emergency Medical Technician (AEMT) => ALS-AEMT -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925001'">2215009</xsl:when>
            <!-- Emergency Medical Technician (EMT) => BLS-Basic /EMT -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925005'">2215003</xsl:when>
            <!-- Emergency Medical Responder (EMR) => BLS-First Responder/EMR -->
            <xsl:when test="../../n:eCrew/n:eCrew.CrewGroup/n:eCrew.02 = '9925003'">2215001</xsl:when>
            <!-- Otherwise, or eCrew.02 missing => BLS-First Responder/EMR -->
            <xsl:otherwise>2215013</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
      </xsl:choose>
    </eResponse.15>
  </xsl:template>

  <!-- eDispatch.01: Map "Altered Mental Status", "Intercept", "Nausea", "Vomiting" to "No Other Appropriate Choice" -->
  <xsl:template match="n:eDispatch.01[. = ('2301085', '2301087', '2301089', '2301091')]">
    <xsl:copy>2301051</xsl:copy>
  </xsl:template>

  <!-- eCrew.02: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:eCrew.02[. = '9925002']">
    <xsl:copy>9925017</xsl:copy>
  </xsl:template>

  <!-- eTimes.17: Remove -->
  <xsl:template match="n:eTimes.17"/>

  <!-- ePatient.05: Remove if blank (@PN not supported) -->
  <xsl:template match="n:ePatient.05[. = '']"/>

  <!-- ePatient.06: Remove if blank (@PN not supported) -->
  <xsl:template match="n:ePatient.06[. = '']"/>

  <!-- ePatient.12: Remove if blank (@PN not supported) -->
  <xsl:template match="n:ePatient.12[. = '']"/>

  <!-- ePatient.13: Map "Female-to-Male, Transgender Male", "Male-to-Female, Transgender Female", "Other, neither exclusively male or female" to "Not Recorded" -->
  <xsl:template match="n:ePatient.13[. = ('9906007', '9906009', '9906011')]">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- ePatient.18: Remove if blank (@PN not supported) -->
  <xsl:template match="n:ePatient.18[. = '']"/>

  <!-- ePatient.22: Remove -->
  <xsl:template match="n:ePatient.22"/>

  <!-- ePayment.05: Remove "Licensed Practical Nurse (LPN)", "Case Manager", "Social Worker" -->
  <xsl:template match="n:ePayment.05[. = ('2605013', '2605015', '2605017')]"/>

  <!-- ePayment.42: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:ePayment.42[. = '9925014']">
    <xsl:copy>9925023</xsl:copy>
  </xsl:template>

  <!-- ePayment.51, eOutcome.10: Truncate ICD-10 code -->
  <xsl:template match="n:ePayment.51[string-length() > 7] |
                       n:eOutcome.10[string-length() > 7]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="substring(., 1, 7)"/>
    </xsl:copy>
  </xsl:template>

  <!-- ePayment.59: Remove -->
  <xsl:template match="n:ePayment.59"/>

  <!-- ePayment.60: Remove -->
  <xsl:template match="n:ePayment.60"/>

  <!-- eScene.20: Truncate -->
  <xsl:template match="n:eScene.20[string-length() > 50]">
    <xsl:copy>
      <xsl:value-of select="substring(., 1, 50)"/>
    </xsl:copy>
  </xsl:template>

  <!-- eScene.24: Remove -->
  <xsl:template match="n:eScene.24"/>

  <!-- eSituation.01/@PN: Map "Unable to Complete" to "Not Recorded" -->
  <xsl:template match="n:eSituation.01[@PN = '8801023']">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eSituation.01/@PN: Remove "Approximate" -->
  <xsl:template match="n:eSituation.01/@PN[. = '8801029']"/>

  <!-- eSituation.13: Map "Non-Acute/Routine" to "Lower Acuity (Green)" -->
  <xsl:template match="n:eSituation.13[. = '2813009']">
    <xsl:copy>2813005</xsl:copy>
  </xsl:template>

  <!-- eSituation.10: Map to "Not Recorded" if @PN is "Symptom Not Present" -->
  <xsl:template match="n:eSituation.10[@PN = '8801031']">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eSituation.18: Remove if empty -->
  <xsl:template match="n:eSituation.18[. = '']"/>

  <!-- eSituation.19: Remove -->
  <xsl:template match="n:eSituation.19"/>

  <!-- eSituation.20: Remove -->
  <xsl:template match="n:eSituation.20"/>

  <!-- eInjury.07: Map "Unable to Determine" to "Not Recorded" -->
  <xsl:template match="n:eInjury.07[. = '2907033']">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eArrest.05: Insert -->
  <xsl:template match="n:eArrest.07">
    <eArrest.05 xsi:nil="true" NV="7701003"/>
    <xsl:copy-of select="."/>
  </xsl:template>

  <!-- eArrest.09: Map "Compressions-Hands Only CPR" to "Compressions-Continuous" -->
  <xsl:template match="n:eArrest.09[. = '3009021']">
    <xsl:copy>3009001</xsl:copy>
  </xsl:template>

  <!-- eArrest.09: Map "Ventilation-with OPA/NPA", "Ventilation-Advanced Airway Device", "Ventilation-Passive Ventilation with Oxygen" to "Ventilation-Bag Valve Mask" -->
  <xsl:template match="n:eArrest.09[. = ('3009023', '3009025', '3009027')]">
    <xsl:copy>3009013</xsl:copy>
  </xsl:template>

  <!-- eArrest.10: Remove -->
  <xsl:template match="n:eArrest.10"/>

  <!-- eArrest.17, eVitals.03: Map "Non-STEMI Septal Ischemia", "STEMI Septal Ischemia" to "Other" -->
  <xsl:template match="n:eArrest.17[. = ('9901030', '9901058')] | 
                       n:eVitals.03[. = ('9901030', '9901058')]">
    <xsl:copy>9901031</xsl:copy>
  </xsl:template>

  <!-- eArrest.20: Remove -->
  <xsl:template match="n:eArrest.20"/>

  <!-- eArrest.21: Remove -->
  <xsl:template match="n:eArrest.21"/>

  <!-- eArrest.22: Remove -->
  <xsl:template match="n:eArrest.22"/>

  <!-- eHistory.01: Map "Alcohol Use, Suspected", "Drug Use, Suspected" to "Not Recorded" -->
  <xsl:template match="n:eHistory.01[. = ('3101033', '3101035')]">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eHistory.ImmunizationsGroup: Remove if eHistory.10 is "None"-->
  <xsl:template match="n:eHistory.ImmunizationsGroup[n:eHistory.10 = '9910053']"/>

  <!-- eHistory.ImmunizationsGroup: Remove if eHistory.10/@PN is "Not Immunized"-->
  <xsl:template match="n:eHistory.ImmunizationsGroup[n:eHistory.10/@PN = '8801025']"/>

  <!-- eHistory.12, eMedications.03: Remove SNOMED codes -->
  <xsl:template match="n:eHistory.12[@CodeType = '9924005' or string-length(.) > 7] |
                       n:eMedications.03[@CodeType = '9924005' or string-length(.) > 7]">
    <!-- PN: Remove -->
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eHistory.12, eMedications.03: Remove @CodeType -->
  <xsl:template match="n:eHistory.12/@CodeType | 
                       n:eMedications.03/@CodeType"/>

  <!-- eHistory.15, eMedications.04: Map 	"Auto Injector", "BVM", "CPAP", "IV Pump", "Nebulizer", "Umbilical Artery Catheter", "Umbilical Venous Catheter" to "Other/miscellaneous" -->
  <xsl:template match="n:eHistory.15[. = ('9927063', '9927065', '9927067', '9927069', '9927071', '9927073', '9927075')] | 
                       n:eMedications.04[. = ('9927063', '9927065', '9927067', '9927069', '9927071', '9927073', '9927075')]">
    <xsl:copy>9927037</xsl:copy>
  </xsl:template>

  <!-- eHistory.17: Map "Physical Exam Indicates Suspected Alcohol or Drug Use" to "Smell of Alcohol on Breath" -->
  <!-- JL: Check -->
  <xsl:template match="n:eHistory.17[. = '3117013']">
    <xsl:copy>3117011</xsl:copy>
  </xsl:template>

  <!-- eHistory.20: Remove -->
  <xsl:template match="n:eHistory.20"/>

  <!-- eVitals.04: Map "2 Lead ECG (pads or paddles)" to "Other (AED, Not Listed)"-->
  <xsl:template match="n:eVitals.04[. = '3304000']">
    <xsl:copy>3304015</xsl:copy>
  </xsl:template>

  <!-- eVitals.07: Map 1-9 to 0 -->
  <xsl:template match="n:eVitals.07[matches(., '^[1-9]$')]">
    <xsl:copy>0</xsl:copy>
  </xsl:template>

  <!-- eVitals.08 Insert if missing -->
  <xsl:template match="n:eVitals.BloodPressureGroup">
    <xsl:copy>
      <xsl:apply-templates select="n:eVitals.06"/>
      <xsl:apply-templates select="n:eVitals.07"/>
      <xsl:choose>
        <xsl:when test="n:eVitals.08">
          <xsl:apply-templates select="n:eVitals.08"/>
        </xsl:when>
        <xsl:otherwise>
          <eVitals.08 xsi:nil="true" NV="7701003"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="n:eVitals.09"/>
    </xsl:copy>
  </xsl:template>

  <!-- eVitals.16: Convert Percentage to mmHg -->
  <xsl:template match="n:eVitals.16[. != '' and @ETCO2Type = '3340003']">
    <xsl:copy>
      <!-- @ETCO2Type: Remove -->
      <!-- BTPS (Body Temperature, Pressure Saturated): normal air pressure = 760mmHg; water vapor pressure = 47mmHg -->
      <xsl:value-of select="round((760 - 47) * . div 100)"/>
    </xsl:copy>
  </xsl:template>

  <!-- eVitals.16: Convert kPa to mmHg -->
  <xsl:template match="n:eVitals.16[. != '' and @ETCO2Type = '3340005']">
    <xsl:copy>
      <!-- @ETCO2Type: Remove -->
      <!-- 1kPa = 7.5mmHg -->
      <xsl:value-of select="round(. * 7.5)"/>
    </xsl:copy>
  </xsl:template>

  <!-- eVitals.16/@ETCO2Type: Remove -->
  <xsl:template match="n:eVitals.16/@ETCO2Type"/>

  <!-- eVitals.18: Map "High" to 600 -->
  <xsl:template match="n:eVitals.18[. = 'High']">
    <xsl:copy>600</xsl:copy>
  </xsl:template>

  <!-- eVitals.18: Map "Low" to 20 -->
  <xsl:template match="n:eVitals.18[. = 'Low']">
    <xsl:copy>20</xsl:copy>
  </xsl:template>

  <!-- eVitals.30: Map "Los Angeles Prehospital Stroke Screen (LAPSS)" to "Los Angeles" -->
  <!-- JL: Check -->
  <xsl:template match="n:eVitals.30[. = '3330004']">
    <xsl:copy>3330003</xsl:copy>
  </xsl:template>

  <!-- eVitals.30: Map "Boston Stroke Scale (BOSS)", "Ontario Prehospital Stroke Scale (OPSS)", "Melbourne Ambulance Stroke Screen (MASS)", "Rapid Arterial oCclusion Evaluation (RACE)", "Los Angeles Motor Score (LAMS)" to "Other Stroke Scale Type" -->
  <xsl:template match="n:eVitals.30[. = ('3330015', '3330017', '3330019', '3330021', '3330023')]">
    <xsl:copy>3330011</xsl:copy>
  </xsl:template>

  <!-- eLabs.03: Remove new values -->
  <xsl:template match="n:eLabs.03[xs:integer(.) > 3403113]"/>

  <!-- JL: eExam.15: Remove new values -->
  <xsl:template match="n:eExam.15[. = ('3515097', '3515099', '3515101', '3515103', '3515105', '3515107', '3515109', '3515111')]"/>

  <!-- eExam.18: Map "Dilated" to "8-mm or >" -->
  <xsl:template match="n:eExam.18[. = '3518061']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3518015</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.18: Map "Pin Point" to "1mm" -->
  <xsl:template match="n:eExam.18[. = '3518063']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3518001</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.AssessmentGroup: Move eExam.LungGroup and eExam.ChestGroup to eExam.08 -->
  <xsl:template match="n:eExam.AssessmentGroup[n:eExam.LungGroup or n:eExam.ChestGroup]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="n:eExam.03"/>
      <xsl:apply-templates select="n:eExam.04"/>
      <xsl:apply-templates select="n:eExam.05"/>
      <xsl:apply-templates select="n:eExam.06"/>
      <xsl:apply-templates select="n:eExam.07"/>
      <!-- eExam.LungGroup: Map to eExam.08 -->
      <xsl:apply-templates select="n:eExam.LungGroup/n:eExam.23"/>
      <!-- eExam.ChestGroup: Map to eExam.08 -->
      <xsl:apply-templates select="n:eExam.ChestGroup/n:eExam.25"/>
      <xsl:apply-templates select="n:eExam.09"/>
      <xsl:apply-templates select="n:eExam.AbdomenGroup"/>
      <xsl:apply-templates select="n:eExam.12"/>
      <xsl:apply-templates select="n:eExam.SpineGroup"/>
      <xsl:apply-templates select="n:eExam.ExtremityGroup"/>
      <xsl:apply-templates select="n:eExam.EyeGroup"/>
      <xsl:apply-templates select="n:eExam.19"/>
      <xsl:apply-templates select="n:eExam.20"/>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.LungGroup => eExam.08 -->
  <xsl:template match="n:eExam.23">
    <xsl:choose>
      <!-- Breath Sounds-Absent  => Breath Sounds-Absent-Left or Breath Sounds-Absent-Right -->
      <xsl:when test=". ='3523001'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508011', '3508013')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Breath Sounds-Decreased => Breath Sounds-Decreased-Left or Breath Sounds-Decreased-Right -->
      <xsl:when test=". ='3523003'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508015', '3508017')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Breath Sounds-Equal -->
      <xsl:when test=". ='3523005'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508019')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Breath Sounds-Normal => Breath Sounds-Normal-Left or Breath Sounds-Normal-Right -->
      <xsl:when test=". ='3523007'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508021', '3508023')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Foreign Body => Foreign Body -->
      <xsl:when test=". ='3523009'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508041')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Increased Respiratory Effort => Increased Respiratory Effort -->
      <xsl:when test=". ='3523011'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508047')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Normal => Normal -->
      <xsl:when test=". ='3523013'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508053')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Not Done => Not Done -->
      <xsl:when test=". ='3523015'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508055')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Pain => Pain -->
      <xsl:when test=". ='3523017'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508057')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Pain with Inspiraton/Expiration => Pain with Inspiraton/expiration-Left or Pain with Inspiraton/expiration-Right -->
      <xsl:when test=". ='3523019'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508059', '3508061')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Rales => Rales-Left or Rales-Right -->
      <xsl:when test=". ='3523021'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508065', '3508067')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Rhonchi => Rhonchi-Left or Rhonchi-Right -->
      <xsl:when test=". ='3523023'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508071', '3508073')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Rhonchi/Wheezing => Rhonchi/Wheezing -->
      <xsl:when test=". ='3523025'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508075')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Stridor => Stridor-Left or Stridor-Right -->
      <xsl:when test=". ='3523027'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508077', '3508079')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Wheezing-Expiratory => Wheezing-Expiratory-Left or Wheezing-Expiratory-Right -->
      <xsl:when test=". ='3523029'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508089', '3508091')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Wheezing-Inspiratory => Wheezing-Inspiratory-Left or Wheezing-Inspiratory-Right -->
      <xsl:when test=". ='3523031'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508093', '3508095')"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- eExam.ChestGroup => eExam.08-->
  <xsl:template match="n:eExam.25">
    <xsl:choose>
      <!-- Abrasion -->
      <xsl:when test=". ='3525001'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508001')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Avulsion -->
      <xsl:when test=". ='3525003'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508003')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Accessory Muscles Used with Breathing -->
      <xsl:when test=". ='3525005'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508005')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Bleeding Controlled -->
      <xsl:when test=". ='3525007'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508007')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Bleeding Uncontrolled -->
      <xsl:when test=". ='3525009'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508009')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Burn-Blistering -->
      <xsl:when test=". ='3525011'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508025')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Burn-Charring -->
      <xsl:when test=". ='3525013'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508027')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Burn-Redness -->
      <xsl:when test=". ='3525015'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508029')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Burn-White/Waxy -->
      <xsl:when test=". ='3525017'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508031')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Crush Injury -->
      <xsl:when test=". ='3525019'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508033')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Deformity -->
      <xsl:when test=". ='3525021'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508035')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Flail Segment => Flail Segment-Left or Flail Segment-Right -->
      <xsl:when test=". ='3525023'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508037', '3508039')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Implanted Device -->
      <xsl:when test=". ='3525025'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508049')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Laceration -->
      <xsl:when test=". ='3525027'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508051')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Normal -->
      <xsl:when test=". ='3525029'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508053')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Not Done -->
      <xsl:when test=". ='3525031'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508055')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Pain -->
      <xsl:when test=". ='3525033'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508057')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Pain with Inspiration/Expiration => Pain with Inspiration/expiration-Left or Pain with Inspiration/expiration-Right -->
      <xsl:when test=". ='3525035'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508059', '3508061')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Puncture/Stab Wound -->
      <xsl:when test=". ='3525037'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508063')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Retraction -->
      <xsl:when test=". ='3525039'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508069')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Tenderness-->
      <xsl:when test=". ='3525041'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508085', '3508087')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Gunshot Wound -->
      <xsl:when test=". ='3525043'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508097')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Swelling -->
      <xsl:when test=". ='3525045'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508099')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Contusion -->
      <xsl:when test=". ='3525047'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508101')"/>
        </xsl:call-template>
      </xsl:when>
      <!-- Tenderness-General -->
      <xsl:when test=". ='3525049'">
        <xsl:call-template name="eExam08">
          <xsl:with-param name="values" select="('3508103')"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!--Named template to generate eExam.08 instances from eExam.LungGroup or eExam.ChestGroup instances -->
  <!-- $values should be a set containing one value for non-sided findings, or two values for left (first value) / right (second value) / bilateral (both values) findings -->
  <xsl:template name="eExam08">
    <xsl:param name="values" as="xs:string*" required="yes"/>
    <xsl:choose>
      <!-- One value in $values: copy to eExam.08 -->
      <xsl:when test="count($values) = 1">
        <eExam.08>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="$values[1]"/>
        </eExam.08>
      </xsl:when>
      <!-- Two values in $values: Check for left/right/bilateral and output eExam.08 accordingly -->
      <xsl:otherwise>
        <xsl:choose>
          <!-- Left => ...-Left -->
          <xsl:when test="../n:eExam.22 = '3522001' or ../n:eExam.24 = '3524001'">
            <eExam.08>
              <xsl:apply-templates select="@*"/>
              <xsl:value-of select="$values[1]"/>
            </eExam.08>
          </xsl:when>
          <!-- Right => ...-Right -->
          <xsl:when test="../n:eExam.22 = '3522003' or ../n:eExam.24 = '3524003'">
            <eExam.08>
              <xsl:apply-templates select="@*"/>
              <xsl:value-of select="$values[2]"/>
            </eExam.08>
          </xsl:when>
          <!-- Otherwise (Bilateral, General, missing) => ...-Left and ...-Right -->
          <xsl:otherwise>
            <eExam.08>
              <xsl:apply-templates select="@*"/>
              <xsl:value-of select="$values[1]"/>
            </eExam.08>
            <eExam.08>
              <!-- Copy @CorrelationID to first instance only -->
              <xsl:apply-templates select="@PN"/>
              <xsl:value-of select="$values[2]"/>
            </eExam.08>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- eExam.19: Map "Pharmacologically Paralyzed", "Pharmacologically Sedated" to "Pharmacologically Sedated/Paralyzed" -->
  <xsl:template match="n:eExam.19[. = ('3519037', '3519039')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3519019</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eExam.19: Remove "Altered mental status, unspecified", "Developmentally Impaired", "Disorientation, unspecified", "Pharmacologically Paralyzed", "Pharmacologically Sedated", "Psychologically Impaired", "Slowness and poor responsiveness", "State of emotional shock and stress, unspecified", "Strange and inexplicable behavior", "Uncooperative", "Unspecified coma" -->
  <xsl:template match="n:eExam.19[. = ('3519031', '3519033', '3519035', '3519037', '3519039', '3519041', '3519043', '3519045', '3519047', '3519049')]"/>

  <!-- eExam.20: Map "Status Seizure", "Other Seizures" to "Seizures" -->
  <xsl:template match="n:eExam.20[. = ('3520026', '3520055')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>3520025</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eProtocols.02: Insert if missing -->
  <xsl:template match="n:eProtocols.ProtocolGroup[not(n:eProtocols.02)]">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
      <eProtocols.02 xsi:nil="true" NV="7701003"/>
    </xsl:copy>
  </xsl:template>

  <!-- eProtocols.02/@NV: Map "Not Reporting" to "Not Recorded" -->
  <xsl:template match="n:eProtocols.02/@NV[. = '7701005']">
    <xsl:attribute name="NV">7701003</xsl:attribute>
  </xsl:template>

  <!-- eMedications.03/@PN, eProcedures.03/@PN: Map "Order Criteria Not Met" to "Contraindication Noted". -->
  <!-- JL: Check -->
  <xsl:template match="n:eMedications.03/@PN[. = ('8801027')] |
                       n:eProcedures.03/@PN[. = ('8801027')]">
    <xsl:attribute name="PN">8801001</xsl:attribute>
  </xsl:template>

  <!-- eMedications.04: Remove if empty -->
  <xsl:template match="n:eMedications.04[. = '']"/>

  <!-- eMedications.05, eMedications.06: Convert "Milligrams per Hour (mg/hr)" to "Milligrams per Minute (mg/min)" -->
  <xsl:template match="n:eMedications.DosageGroup[n:eMedications.06 = '3706055']">
    <xsl:copy>
      <eMedications.05>
        <xsl:apply-templates select="@*"/>
        <xsl:if test="n:eMedications.05 != ''">
          <xsl:value-of select="xs:decimal(n:eMedications.05) * 1000"/>
        </xsl:if>
      </eMedications.05>
      <eMedications.06>3706037</eMedications.06>
    </xsl:copy>
  </xsl:template>

  <!-- eMedications.10, eProcedures.10: Map "Emergency Medical Technician - Intermediate" to "EMT-Intermediate" -->
  <xsl:template match="n:eMedications.10[. = '9905002'] | 
                       n:eProcedures.10[. = '9905002']">
    <xsl:copy>9905011</xsl:copy>
  </xsl:template>

  <!-- eMedications.10, eProcedures.10: Map "Patient", "Lay Person", "Family Member" to "Patient/Lay Person" -->
  <xsl:template match="n:eMedications.10[. = ('9905043', '9905045', '9905049')] | 
                       n:eProcedures.10[. = ('9905043', '9905045', '9905049')]">
    <xsl:copy>9905023</xsl:copy>
  </xsl:template>

  <!-- eMedications.10, eProcedures.10: Map "Law Enforcement", "Fire Personnel (non EMS)" to "Other Non-Healthcare Professional" -->
  <!-- JL: Check -->
  <xsl:template match="n:eMedications.10[. = ('9905047', '9905051')] | 
                       n:eProcedures.10[. = ('9905047', '9905051')]">
    <xsl:copy>9905021</xsl:copy>
  </xsl:template>

  <!-- eProcedures.13: Map "Wrist-Left", to "Hand-Left" -->
  <!-- JL: Check. Forearm-Left also an option. -->
  <xsl:template match="n:eProcedures.13[. = '3913079']">
    <xsl:copy>3913021</xsl:copy>
  </xsl:template>

  <!-- eProcedures.13: Map "Wrist-Right", to "Hand-Right" -->
  <!-- JL: Check. Forearm-Right also an option. -->
  <xsl:template match="n:eProcedures.13[. = '3913081']">
    <xsl:copy>3913023</xsl:copy>
  </xsl:template>

  <!-- eAirway.04: Map "Chest Rise" to "Other" -->
  <xsl:template match="n:eAirway.04[. = '4004021']">
    <xsl:copy>4004015</xsl:copy>
  </xsl:template>

  <!-- eAirway.05: Remove instances with value less than 8 -->
  <xsl:template match="n:eAirway.05[xs:integer(.) &lt; 8]"/>

  <!-- eDisposition.IncidentDispositionGroup: Map to eDisposition.12 -->
  <xsl:template match="n:eDisposition.IncidentDispositionGroup">
    <eDisposition.12>
      <xsl:choose>
        <!-- Patient Contact Made -->
        <xsl:when test="n:eDisposition.27 = '4227001'">
          <xsl:choose>
            <!-- Patient Evaluated and Care Provided, Patient Support Services Provided, empty -->
            <xsl:when test="n:eDisposition.28 = ('4228001', '4228009', '')">
              <xsl:choose>
                <!-- Against Medical Advice => Patient Treated, Released (AMA) -->
                <xsl:when test="n:eDisposition.31 = '4231001'">4212027</xsl:when>
                <!-- Released Following Protocol Guidelines => Patient Treated, Released (per protocol) -->
                <xsl:when test="n:eDisposition.31 = '4231005'">4212029</xsl:when>
                <!-- Released to Law Enforcement => Patient Treated, Transported by Law Enforcement -->
                <xsl:when test="n:eDisposition.31 = '4231007'">4212035</xsl:when>
                <!-- Patient/Guardian States Intent to Transport by Other Means => Patient Treated, Transported by Private Vehicle -->
                <xsl:when test="n:eDisposition.31 = '4231009'">4212037</xsl:when>
                <!-- DNR, Medical/Physician Orders for Life Sustaining Treatment and Transport By... => Patient Dead at Scene-Resuscitation Attempted (With Transport) -->
                <xsl:when test="n:eDisposition.31 = ('4231011', '9931013') and
                                n:eDisposition.30 = ('4230001', '4230003', '4230005', '4230007')">4212017</xsl:when>
                <!-- DNR, Medical/Physician Orders for Life Sustaining Treatment and No Transport => Patient Dead at Scene-Resuscitation Attempted (Without Transport) -->
                <xsl:when test="n:eDisposition.31 = ('4231011', '9931013') and
                                n:eDisposition.30 = '4230013'">4212019</xsl:when>
                <!-- Initiated Primary Care and Transferred to Another EMS Crew => Patient Treated, Transferred Care to Another EMS Unit -->
                <xsl:when test="n:eDisposition.29 = '4229003'">4212031</xsl:when>
                <!-- Transport by This EMS Unit... => Patient Treated, Transported by this EMS Unit -->
                <xsl:when test="n:eDisposition.30 = ('4230001', '4230003')">4212033</xsl:when>
                <!-- Transport by Another EMS Unit... => Patient Treated, Transferred Care to Another EMS Unit -->
                <xsl:when test="n:eDisposition.30 = ('4230005', '4230007')">4212031</xsl:when>
                <!-- Patient Refused Transport => Patient Treated, Released (AMA) -->
                <xsl:when test="n:eDisposition.30 = '4230009'">4212027</xsl:when>
                <!-- Otherwise => Patient Treated, Released Per Protocol -->
                <xsl:otherwise>4212029</xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <!-- Patient Evaluated and Refused Care, Patient Refused Evaluation/Care -->
            <xsl:when test="n:eDisposition.28 = ('4228003', '4228007')">
              <xsl:choose>
                <!-- Transport by... => Patient Refused Evaluation/Care (With Transport) -->
                <xsl:when test="n:eDisposition.30 = ('4230001', '4230003', '4230005', '4230007')">4212023</xsl:when>
                <!-- Otherwise => Patient Refused Evaluation/Care (Without Transport) -->
                <xsl:otherwise>4212025</xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <!-- Patient Evaluated, No Care Required -->
            <xsl:when test="n:eDisposition.28 = '4228005'">
              <xsl:choose>
                <!-- DNR, Medical/Physician Orders for Life Sustaining Treatment and Transport By... => Patient Dead at Scene-No Resuscitation Attempted (With Transport) -->
                <xsl:when test="n:eDisposition.31 = ('4231011', '9931013') and
                                n:eDisposition.30 = ('4230001', '4230003', '4230005', '4230007')">4212013</xsl:when>
                <!-- DNR, Medical/Physician Orders for Life Sustaining Treatment and No Transport... => Patient Dead at Scene-No Resuscitation Attempted (Without Transport) -->
                <xsl:when test="n:eDisposition.31 = ('4231011', '9931013') and
                                n:eDisposition.30 = '4230013'">4212015</xsl:when>
                <!-- Otherwise => Patient Evaluated, No Treatment/Transport Required -->
                <xsl:otherwise>4212021</xsl:otherwise>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>
        </xsl:when>
        <!-- Cancelled on Scene => Canceled on Scene (No Patient Contact) -->
        <xsl:when test="n:eDisposition.27 = '4227003'">4212009</xsl:when>
        <!-- Cancelled Prior to Arrival at Scene => Canceled (Prior to Arrival At Scene) -->
        <xsl:when test="n:eDisposition.27 = '4227005'">4212007</xsl:when>
        <!-- No Patient Contact, No Patient Found, Non-Patient Incident (Not Otherwise Listed) -->
        <xsl:when test="n:eDisposition.27 = ('4227007', '4227009', '4227011')">
          <xsl:choose>
            <!-- Non-Patient Transport (Not Otherwise Listed) => Transport Non-Patient, Organs, etc. -->
            <xsl:when test="n:eDisposition.30 = '4230011'">4212043</xsl:when>
            <!-- Back in Service... => Standby-No Services or Support Provided -->
            <xsl:when test="n:eDisposition.29 = ('4229011', '4229013')">4212039</xsl:when>
            <!-- Otherwise => Standby-Public Safety, Fire, or EMS Operational Support Provided -->
            <xsl:otherwise>4212041</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
      </xsl:choose>
    </eDisposition.12>
  </xsl:template>

  <!-- eDisposition.15 (first instance): Remove @CorrelationID -->
  <xsl:template match="n:eDisposition.15[1]">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <!-- eDisposition.15 (instances after first instance): Remove -->
  <xsl:template match="n:eDisposition.15"/>

  <!-- eDisposition.19: Map "Dead with Resuscitation Efforts (Black)", to "Dead without Resuscitation Efforts (Black)" -->
  <!-- JL: Check -->
  <xsl:template match="n:eDisposition.19[. = '4219009']">
    <xsl:copy>4219007</xsl:copy>
  </xsl:template>

  <!-- eDisposition.19: Map "Non-Acute/Routine" to "Lower Acuity (Green)" -->
  <!-- JL: Check -->
  <xsl:template match="n:eDisposition.19[. = '4219011']">
    <xsl:copy>4219005</xsl:copy>
  </xsl:template>

  <!-- eDisposition.21: Map "Assisted Living Facility", "Nursing Home" to "Nursing Home/Assisted Living Facility" -->
  <xsl:template match="n:eDisposition.21[. = ('4221029', '4221033')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>4221011</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!--  eDisposition.21: Map "Dialysis Center", "Diagnostic Services", "Mental Health Facility", "Other Recurring Care Center", "Physical Rehabilitation Facility", "Drug and/or Alcohol Rehabilitation Facility", "Skilled Nursing Facility" to "Other" -->
  <!-- JL: Check -->
  <xsl:template match="n:eDisposition.21[. = ('4221025', '4221027', '4221031', '4221035', '4221037', '4221039', '4221041')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>4221013</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eDisposition.23: Copy first non-empty supported instance -->
  <xsl:template match="n:eDisposition.23[1]">
    <xsl:choose>
      <!-- If value is blank, "Cancer Center", or "Labor and Delivery"... -->
      <xsl:when test=". = ('', '9908045', '9908047')">
        <xsl:choose>
          <!-- If there are other instances with a supported value, map the first instance -->
          <xsl:when test="../n:eDisposition.23[not(. = ('', '9908045', '9908047'))]">
            <xsl:apply-templates select="../n:eDisposition.23[not(. = ('', '9908045', '9908047'))][1]" mode="eDisposition23"/>
          </xsl:when>
          <!-- "Cancer", "Labor and Delivery": Map to "Hospital (General)" -->
          <xsl:when test=". = ('9908045', '9908047')">
            <eDisposition.23>9908007</eDisposition.23>
          </xsl:when>
          <!-- Empty: Copy  -->
          <xsl:otherwise>
            <xsl:apply-templates select="." mode="eDisposition23"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="eDisposition23"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- eDisposition.23: Map "Stroke-..." to "Stroke Center" -->
  <xsl:template match="n:eDisposition.23[. = ('9908037', '9908039', '9908041', '9908043')]" mode="eDisposition23">
    <!-- @CorrelationID: Remove -->
    <xsl:copy>
      <xsl:text>9908017</xsl:text>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="n:eDisposition.23" mode="eDisposition23">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- eDisposition.23/@CorrelationID: Remove -->
  <xsl:template match="n:eDisposition.23/@CorrelationID" mode="eDisposition23"/>

  <!-- eDisposition.23: Remove instances after first instance -->
  <xsl:template match="n:eDisposition.23"/>

  <!-- eDisposition.24: Map "Yes-Sepsis", to "Yes-Other" -->
  <xsl:template match="n:eDisposition.24[. = '4224019']">
    <xsl:copy>4224009</xsl:copy>
  </xsl:template>

  <!-- eDisposition.32: Remove -->
  <xsl:template match="n:eDisposition.32"/>

  <!-- eOutcome.09: Un-enclose -->
  <xsl:template match="n:eOutcome.EmergencyDepartmentProceduresGroup">
    <xsl:apply-templates select="n:eOutcome.09"/>
    <!-- eOutcome.19: Remove -->
  </xsl:template>

  <!-- eOutcome.09: Remove if empty -->
  <xsl:template match="n:eOutcome.09[. = '']"/>

  <!-- eOutcome.10: Remove if empty -->
  <xsl:template match="n:eOutcome.10[. = '']"/>

  <!-- eOutcome.11: Remove if empty -->
  <xsl:template match="n:eOutcome.11[. = '']"/>

  <!-- eOutcome.12: Un-enclose -->
  <xsl:template match="n:eOutcome.HospitalProceduresGroup">
    <xsl:apply-templates select="n:eOutcome.12"/>
    <!-- eOutcome.20: Remove -->
  </xsl:template>

  <!-- eOutcome.12: Remove if empty -->
  <xsl:template match="n:eOutcome.12[. = '']"/>

  <!-- eOutcome.13: Remove if empty -->
  <xsl:template match="n:eOutcome.13[. = '']"/>

  <!-- eOutcome.16: Remove if empty -->
  <xsl:template match="n:eOutcome.16[. = '']"/>

  <!-- eOutcome.18: Remove -->
  <xsl:template match="n:eOutcome.18"/>

  <!-- eCustomResults.01: Map to "Not Recorded" if @PN is "Not Immunized", "Order Criteria Not Present", "Symptom Not Present" -->
  <xsl:template match="n:eCustomResults.01[@PN = ('8801025', '8801027', '8801031')]">
    <xsl:copy use-attribute-sets="NotRecorded"/>
  </xsl:template>

  <!-- eCustomResults.01/@PN: Remove "Approximate" -->
  <xsl:template match="n:eCustomResults.01/@PN[. = '8801029']"/>

  <!-- eOther: Insert if missing -->
  <xsl:template match="n:PatientCareReport[not(n:eOther)]">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
    <eOther>
      <eOther.EMSCrewMemberGroup>
        <eOther.05 xsi:nil="true" NV="7701003"/>
      </eOther.EMSCrewMemberGroup>
    </eOther>
  </xsl:template>

  <!-- eOther.EMSCrewMemberGroup: Insert if missing -->
  <xsl:template match="n:eOther[not(n:eOther.EMSCrewMemberGroup)]">
    <xsl:copy>
      <xsl:apply-templates select="n:eOther.01"/>
      <xsl:apply-templates select="n:eOther.02"/>
      <eOther.EMSCrewMemberGroup>
        <eOther.05 xsi:nil="true" NV="7701003"/>
      </eOther.EMSCrewMemberGroup>
      <xsl:apply-templates select="n:eOther.07"/>
      <xsl:apply-templates select="n:eOther.08"/>
      <xsl:apply-templates select="n:eOther.FileGroup"/>
      <xsl:apply-templates select="n:eOther.SignatureGroup"/>
    </xsl:copy>
  </xsl:template>

  <!-- eOther.05: Insert if missing -->
  <xsl:template match="n:eOther.EMSCrewMemberGroup[not(n:eOther.05)]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="n:eOther.03"/>
      <xsl:apply-templates select="n:eOther.04"/>
      <eOther.05 xsi:nil="true" NV="7701003"/>
      <xsl:apply-templates select="n:eOther.06"/>
    </xsl:copy>
  </xsl:template>

  <!-- eOther.05/@NV: Map "Not Reporting" to "Not Recorded" -->
  <xsl:template match="n:eOther.05/@NV[. = '7701005']">
    <xsl:attribute name="NV">7701003</xsl:attribute>
  </xsl:template>

  <!-- eOther.07: Map "Earthquake", "Flood", "Land Slide", "Winter Storm", "Tornado", "Hurricane" to "Weather" -->
  <!-- JL: Check "Earthquake" -->
  <xsl:template match="n:eOther.07[. = ('4507029', '4507031', '4507033', '4507035', '4507037', '4507039')]">
    <xsl:copy>4507027</xsl:copy>
  </xsl:template>

  <!-- eOther.09: Map "DNR", "Living Will" to "DNR/Living Will" -->
  <xsl:template match="n:eOther.09[. = ('4509006', '4509008')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>4509007</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eOther.09: Map "ePCR" to "Other Healthcare Record" -->
  <xsl:template match="n:eOther.09[. = '4509027']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:text>4509013</xsl:text>
    </xsl:copy>
  </xsl:template>

  <!-- eOther.15: Map "Not Signed-Illiterate (Unable to Read)" to "Not Signed - Language Barrier" -->
  <xsl:template match="n:eOther.15[. = '4515035']">
    <xsl:copy>4515011</xsl:copy>
  </xsl:template>

  <!-- eOther.15: Map "Not Signed-Restrained" to "Not Signed - Physical Impairment of Extremities" -->
  <xsl:template match="n:eOther.15[. = '4515037']">
    <xsl:copy>4515017</xsl:copy>
  </xsl:template>

  <!-- eOther.15: Map "Not Signed-Combative or Uncooperative" to "Not Signed - Due to Distress Level" -->
  <xsl:template match="n:eOther.15[. = '4515039']">
    <xsl:copy>4515005</xsl:copy>
  </xsl:template>

  <!-- eOther.22: Remove -->
  <xsl:template match="n:eOther.22"/>

</xsl:stylesheet>
