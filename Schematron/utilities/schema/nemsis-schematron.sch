<?xml version="1.0" encoding="UTF-8"?>
<!--
  Distributed by the NEMSIS Technical Assistance Center
 -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xml:lang="en" queryBinding="xslt2">

  <sch:title>Schema for Additional Constraints in NEMSIS Schematron</sch:title>

  <sch:ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron" />
  
  <sch:p>
    This schema supplies some constraints in addition to those given in
    the ISO/IEC 19757-2 (RELAX NG Compact Syntax) and ISO/IEC 19757-3 
    (Schematron) Schemas for Schematron. Schematron files distributed 
    for use in NEMSIS-compliant systems must meet these additional 
    constraints.
  </sch:p>
  
  <sch:pattern>

    <sch:rule context="sch:schema">

      <sch:assert role="[FATAL]" test="not(@defaultPhase)">
        In schema, @defaultPhase MUST be undefined.
      </sch:assert>

      <sch:assert role="[WARNING]" test="@id = ('DEMDataSet', 'EMSDataSet')">
        In schema, @id SHOULD be DEMDataSet or EMSDataSet.
      </sch:assert>

      <sch:assert role="[FATAL]" test="@queryBinding = 'xslt2'">
        In schema, @queryBinding MUST be xslt2.
      </sch:assert>

      <sch:assert role="[WARNING]" test="matches(@schemaVersion, '^3\.\d+\.\d+\.\d{6}(_.*)?$')">
        In schema, @schemaVersion SHOULD be the full NEMSIS release version the schema is intended 
        to validate (for example, 3.3.3.130926), which MAY be followed by an underscore and a 
        version number specific to the Schematron file itself.
      </sch:assert>

      <sch:assert role="[FATAL]" test="sch:diagnostics/sch:diagnostic[@id = 'nemsisDiagnostic']">
        In schema, diagnostics MUST exist and MUST contain a diagnostic with @id of nemsisDiagnostic.
      </sch:assert>

    </sch:rule>

    <sch:rule context="sch:pattern">
      
      <sch:assert role="[FATAL]" test="sch:title">
        In pattern, title MUST exist.
      </sch:assert>
      
    </sch:rule>

    <sch:rule context="sch:rule">

      <sch:assert role="[FATAL]" test="not(@role)">
        In rule, @role MUST NOT exist.
      </sch:assert>

      <sch:assert role="[WARNING]" test="@abstract='true' or sch:let[@name = ('nemsisElements', 'nemsisElementsMissing')] or (sch:extends and //sch:rule[@id = current()/sch:extends/@rule]/sch:let[@name = ('nemsisElements', 'nemsisElementsMissing')])">
        In rule, let, with @name of nemsisElements or nemsisElementsMissing, SHOULD exist.
      </sch:assert>

    </sch:rule>

    <sch:rule context="sch:assert | sch:report">

      <sch:assert role="[FATAL]" test="@diagnostics = 'nemsisDiagnostic' or starts-with(@diagnostics, 'nemsisDiagnostic ') or ends-with(@diagnostics, ' nemsisDiagnostic') or contains(@diagnostics, ' nemsisDiagnostic ')">
        In assert or report, @diagnostics MUST exist and MUST consist of a space-delimited list containing at least the value nemsisDiagnostic.
      </sch:assert>

      <sch:assert role="[FATAL]" test="@role = ('[FATAL]', '[ERROR]', '[WARNING]')">
        In assert or report, @role MUST exist and MUST be [FATAL], [ERROR], or [WARNING].
      </sch:assert>
      
    </sch:rule>

    <sch:rule context="sch:diagnostic[@id='nemsisDiagnostic']">

      <sch:let name="nemsisDiagnostic" value="document('../../rules/includes/diagnostic_nemsisDiagnostic.xml')/sch:diagnostic"/>
      
      <sch:assert role="[FATAL]" test="deep-equal(., $nemsisDiagnostic)">
        diagnostic with id of nemsisDiagnostic MUST be the diagnostic supplied by the NEMSIS TAC.
      </sch:assert>

    </sch:rule>

  </sch:pattern>
  
</sch:schema>
