<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/html/schematronHtml.xsl"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            queryBinding="xslt2"
            id="DEMDataSet"
            schemaVersion="3.5.0.230317CP4_compliance_pretesting_2024">
   <sch:title>NEMSIS ISO Schematron file for DEMDataSet for compliance pre-testing (2024, v3.5.0)</sch:title>
   <sch:ns prefix="nem" uri="http://www.nemsis.org"/>
   <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
   <!-- "Initialize" variables used by nemsisDiagnostic. -->
   <sch:let name="nemsisElements" value="()"/>
   <sch:let name="nemsisElementsMissing" value="''"/>
   <sch:let name="nemsisElementsMissingContext" value="()"/>
   <!-- PHASES -->
   <!-- No phases used. -->
   <!-- PATTERNS -->
   <sch:pattern id="compliance_dispatchVolume">
      <sch:title>EMS Dispatch Volume Per Year shouldn't be too high compared to Total Service Area Population</sch:title>
      <sch:rule id="compliance_dispatchVolume_rule"
                context="nem:dAgency.AgencyYearGroup[nem:dAgency.17 != '' and nem:dAgency.19 != '']">
         <sch:let name="nemsisElements" value="nem:dAgency.17, nem:dAgency.19"/>
         <!-- To test: Increase dAgency.19 EMS Dispatch Volume Per Year to be more than 25% of dAgency.17 Total Service Area Population. -->
         <sch:assert id="compliance_dispatchVolume_assert"
                     role="[WARNING]"
                     diagnostics="nemsisDiagnostic"
                     test="xs:integer(nem:dAgency.19) &lt;= xs:integer(nem:dAgency.17) * 0.25">
        EMS Dispatch Volume Per Year should not be more than 25% of Total Service Area Population. This is a validation message for compliance pre-testing for 2024 for NEMSIS v3.5.0.
      </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern id="compliance_locationPhone">
      <sch:title>Location phone number must be consistent with location county</sch:title>
      <sch:rule id="compliance_locationPhone_rule"
                context="nem:dLocation.12[. != '' and ../nem:dLocation.10 = '08069']">
         <sch:let name="nemsisElements" value="., ../nem:dLocation.10"/>
         <!-- To test: Change the first three digits of dLocation.12 EMS Location Phone Number to a value other than "970" for the location that is in Larimer County, Colorado -->
         <sch:assert id="compliance_locationPhone_assert"
                     role="[ERROR]"
                     diagnostics="nemsisDiagnostic"
                     test="starts-with(., '970')">
        EMS Location Phone Number must start with "970" when EMS Location County is Larimer County, Colorado. This is a validation message for compliance pre-testing for 2024 for NEMSIS v3.5.0.
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
