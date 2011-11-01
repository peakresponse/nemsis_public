<?xml version="1.0" encoding="utf-8"?>
<!-- Data Dictionary Version 3.1.0 -->
<!-- Schematron Version 1.1.0 -->
<iso:schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:nem="http://www.nemsis.org" queryBinding="xslt2">
    <iso:ns prefix="nem" uri="http://www.nemsis.org"/>
    <iso:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
    <iso:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <iso:title>NEMSIS National ISO schematron file.</iso:title>

<!-- This is the abstract pattern for elements having PN/NV/Nil attributes.
 1) xsi:nil=false then NV should not have a value
 2) xsi:nil=true then PN should not have a value -->
<iso:pattern abstract="true" id="national_1">
    <iso:rule context="$realElem" role="[FATAL]">
        <iso:let name="nvValue" value="normalize-space(@NV)" />
        <iso:let name="pnValue" value="normalize-space(@PN)" />
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />
        <iso:let name="selfValue" value="normalize-space(.)" />
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />
        <iso:let name="pnHasValue" value="if (normalize-space(@PN)) then true() else false()" />
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />
        <iso:assert role="[FATAL]" test="if (($nilRealValue and $pnHasValue) or (not($nilRealValue) and $nvHasValue)) then false else true()">
            $PREFIX: the PN, NV, NIL combination for element <iso:name/> is not valid.
            NV has value of '<iso:value-of select="$nvValue" />';
            PN has value of '<iso:value-of select="$pnValue" />';
            NIL has value of '<iso:value-of select="$nilValue" />';
            Element value is '<iso:value-of select="$selfValue" />';
            position is '<iso:value-of select="position()" />';
        </iso:assert>
    </iso:rule>
</iso:pattern>

<!-- This is the abstract pattern for elements having PN/NV/Nil attributes.
 1) xsi:nil=false then NV should not have a value
 2) xsi:nil=false then PN should not have a value
 2) xsi:nil=true then PN or NV should have a value but not both-->
<iso:pattern abstract="true" id="national_2">
    <iso:rule context="$realElem" role="[FATAL]">
        <iso:let name="nvValue" value="normalize-space(@NV)" />
        <iso:let name="pnValue" value="normalize-space(@PN)" />
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />
        <iso:let name="selfValue" value="normalize-space(.)" />
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />
        <iso:let name="pnHasValue" value="if (normalize-space(@PN)) then true() else false()" />
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />
        <iso:assert role="[FATAL]" test="if ((not($nilRealValue) and $pnHasValue) or (not($nilRealValue) and $nvHasValue) or ($pnHasValue and $nvHasValue)) then false else true()">
            $PREFIX: the PN, NV, NIL combination for element <iso:name/> is not valid.
            NV has value of '<iso:value-of select="$nvValue" />';
            PN has value of '<iso:value-of select="$pnValue" />';
            NIL has value of '<iso:value-of select="$nilValue" />';
            Element value is '<iso:value-of select="$selfValue" />';
            position is '<iso:value-of select="position()" />';
        </iso:assert>
    </iso:rule>
</iso:pattern>

<!-- This is the abstract pattern for any element having only NV/Nil attributes.
1) xsi:nil=false then NV should not have a value -->
<iso:pattern abstract="true" id="national_3">
    <iso:rule context="$realElem" role="[FATAL]">
        <iso:let name="nvValue" value="normalize-space(@NV)" />
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />
        <iso:let name="selfValue" value="normalize-space(.)" />
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />

        <iso:assert role="[FATAL]" test="if ((not($nilRealValue) and $nvHasValue)) then false() else true()">
             $PREFIX: <iso:name/> is an element having NV/Nil attributes. When it has value (Nil not true), NV attribute must not be specified.
            NV has value of '<iso:value-of select="$nvValue" />';
            NIL has value of '<iso:value-of select="$nilValue" />';
            Element value is '<iso:value-of select="$selfValue" />';
            position is '<iso:value-of select="position()" />';
        </iso:assert>
    </iso:rule>
</iso:pattern>

<!-- This is the abstract pattern for state required/recommended elements having only NV/Nil attributes:
 1) xsi:nil=true then NV must be specified 
 1) xsi:nil=false then NV should not have a value -->
<iso:pattern abstract="true" id="national_4">
    <iso:rule context="$realElem" role="[FATAL]" >
        <iso:let name="nvValue" value="normalize-space(@NV)" />
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />
        <iso:let name="selfValue" value="normalize-space(.)" />
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />

        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />

        <iso:assert role="[FATAL]" test="if ($nilRealValue and not($nvHasValue))then false() else true()">
            $PREFIX: <iso:name/> is a required/recommended state element. When its value is Nill, NV attribute must be specified.
            NV has value of '<iso:value-of select="$nvValue" />';
            NIL has value of '<iso:value-of select="$nilValue" />';
            Element value is '<iso:value-of select="$selfValue" />';
            position is '<iso:value-of select="position()" />';
        </iso:assert>
        <iso:assert role="[FATAL]" test="if ((not($nilRealValue) and $nvHasValue)) then false() else true()">
             $PREFIX: <iso:name/> is an element having NV/Nil attributes. When it has value (Nil not true), NV attribute must not be specified.
            NV has value of '<iso:value-of select="$nvValue" />';
            NIL has value of '<iso:value-of select="$nilValue" />';
            Element value is '<iso:value-of select="$selfValue" />';
            position is '<iso:value-of select="position()" />';
        </iso:assert>
    </iso:rule>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.07_State_Required" description="dAgency.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.08_State_Required" description="dAgency.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.16_State_Required" description="dAgency.16 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.16"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.17_State_Required" description="dAgency.17 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.17"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.18_State_Required" description="dAgency.18 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.18"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.19_State_Required" description="dAgency.19 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.19"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.20_State_Required" description="dAgency.20 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.20"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.21_State_Required" description="dAgency.21 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.21"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.25_State_Required" description="dAgency.25 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.25"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dAgency.26_State_Required" description="dAgency.26 is missing NV attribute">
    <iso:param name="realElem" value="nem:dAgency.26"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dConfiguration.03_State_Required" description="dConfiguration.03 is missing NV attribute">
    <iso:param name="realElem" value="nem:dConfiguration.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dConfiguration.04_State_Required" description="dConfiguration.04 is missing NV attribute">
    <iso:param name="realElem" value="nem:dConfiguration.04"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="dConfiguration.05_State_Required" description="dConfiguration.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:dConfiguration.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.01_State_Required" description="eArrest.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.02_State_Required" description="eArrest.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.03_State_Required" description="eArrest.03 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.04_State_Required" description="eArrest.04 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.04"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.05_State_Required" description="eArrest.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.07_State_Required" description="eArrest.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.09_State_Required" description="eArrest.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.10_State_Required" description="eArrest.10 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.11_State_Required" description="eArrest.11 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.11"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.12_State_Required" description="eArrest.12 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.12"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.14_State_Required" description="eArrest.14 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.14"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.16_State_Required" description="eArrest.16 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.16"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.17_State_Required" description="eArrest.17 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.17"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eArrest.18_State_Required" description="eArrest.18 is missing NV attribute">
    <iso:param name="realElem" value="nem:eArrest.18"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDispatch.02_State_Required" description="eDispatch.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDispatch.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.05_State_Required" description="eDisposition.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.06_State_Required" description="eDisposition.06 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.07_State_Required" description="eDisposition.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.16_State_Required" description="eDisposition.16 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.16"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.17_State_Required" description="eDisposition.17 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.17"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.18_State_Required" description="eDisposition.18 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.18"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.19_State_Required" description="eDisposition.19 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.19"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.20_State_Required" description="eDisposition.20 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.20"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.21_State_Required" description="eDisposition.21 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.21"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.22_State_Required" description="eDisposition.22 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.22"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.23_State_Required" description="eDisposition.23 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.23"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.24_State_Required" description="eDisposition.24 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.24"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eDisposition.25_State_Required" description="eDisposition.25 is missing NV attribute">
    <iso:param name="realElem" value="nem:eDisposition.25"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eHistory.01_State_Required" description="eHistory.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eHistory.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eHistory.17_PN_NV_Nil" description="eHistory.17 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eHistory.17"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eInjury.01_State_Required" description="eInjury.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eInjury.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eInjury.03_State_Required" description="eInjury.03 is missing NV attribute">
    <iso:param name="realElem" value="nem:eInjury.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eInjury.04_PN_NV_Nil" description="eInjury.04 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eInjury.04"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eMedications.01_State_Required" description="eMedications.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eMedications.02_State_Required" description="eMedications.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_1" id="eMedications.03_PN_NV_Nil" description="eMedications.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eMedications.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eMedications.05_State_Required" description="eMedications.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eMedications.06_State_Required" description="eMedications.06 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eMedications.07_State_Required" description="eMedications.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eMedications.08_State_Required" description="eMedications.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eMedications.10_State_Required" description="eMedications.10 is missing NV attribute">
    <iso:param name="realElem" value="nem:eMedications.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eOther.05_State_Required" description="eOther.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eOther.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eOutcome.01_State_Required" description="eOutcome.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eOutcome.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eOutcome.02_State_Required" description="eOutcome.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eOutcome.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.07_State_Required" description="ePatient.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.08_State_Required" description="ePatient.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.09_State_Required" description="ePatient.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.13_State_Required" description="ePatient.13 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.13"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.14_State_Required" description="ePatient.14 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.14"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.15_State_Required" description="ePatient.15 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.15"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePatient.16_State_Required" description="ePatient.16 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePatient.16"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePayment.01_State_Required" description="ePayment.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePayment.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="ePayment.50_State_Required" description="ePayment.50 is missing NV attribute">
    <iso:param name="realElem" value="nem:ePayment.50"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.01_State_Required" description="eProcedures.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.02_State_Required" description="eProcedures.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_1" id="eProcedures.03_PN_NV_Nil" description="eProcedures.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eProcedures.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eProcedures.05_State_Required" description="eProcedures.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.06_State_Required" description="eProcedures.06 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.07_State_Required" description="eProcedures.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.08_State_Required" description="eProcedures.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProcedures.10_State_Required" description="eProcedures.10 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProcedures.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProtocols.01_State_Required" description="eProtocols.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProtocols.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eProtocols.02_State_Required" description="eProtocols.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eProtocols.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.03_State_Required" description="eResponse.03 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.04_State_Required" description="eResponse.04 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.04"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.08_State_Required" description="eResponse.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.09_State_Required" description="eResponse.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.10_State_Required" description="eResponse.10 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.11_State_Required" description="eResponse.11 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.11"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.12_State_Required" description="eResponse.12 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.12"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eResponse.24_State_Required" description="eResponse.24 is missing NV attribute">
    <iso:param name="realElem" value="nem:eResponse.24"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.01_State_Required" description="eScene.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.06_State_Required" description="eScene.06 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.07_State_Required" description="eScene.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.08_State_Required" description="eScene.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.09_State_Required" description="eScene.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.18_State_Required" description="eScene.18 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.18"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.19_State_Required" description="eScene.19 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.19"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eScene.21_State_Required" description="eScene.21 is missing NV attribute">
    <iso:param name="realElem" value="nem:eScene.21"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.01_State_Required" description="eSituation.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.02_State_Required" description="eSituation.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.07_State_Required" description="eSituation.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.08_State_Required" description="eSituation.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.09_State_Required" description="eSituation.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.10_State_Required" description="eSituation.10 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.11_State_Required" description="eSituation.11 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.11"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.12_State_Required" description="eSituation.12 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.12"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eSituation.13_State_Required" description="eSituation.13 is missing NV attribute">
    <iso:param name="realElem" value="nem:eSituation.13"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.01_State_Required" description="eTimes.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.05_State_Required" description="eTimes.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.06_State_Required" description="eTimes.06 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.07_State_Required" description="eTimes.07 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.07"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.09_State_Required" description="eTimes.09 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.09"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.11_State_Required" description="eTimes.11 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.11"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eTimes.12_State_Required" description="eTimes.12 is missing NV attribute">
    <iso:param name="realElem" value="nem:eTimes.12"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eVitals.01_State_Required" description="eVitals.01 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.01"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eVitals.02_State_Required" description="eVitals.02 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.02"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eVitals.03_PN_NV_Nil" description="eVitals.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.03"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eVitals.04_State_Required" description="eVitals.04 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.04"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_4" id="eVitals.05_State_Required" description="eVitals.05 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.05"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eVitals.06_PN_NV_Nil" description="eVitals.06 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.06"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eVitals.08_State_Required" description="eVitals.08 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.08"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eVitals.10_PN_NV_Nil" description="eVitals.10 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.10"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.12_PN_NV_Nil" description="eVitals.12 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.12"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.14_PN_NV_Nil" description="eVitals.14 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.14"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.16_PN_NV_Nil" description="eVitals.16 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.16"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.18_PN_NV_Nil" description="eVitals.18 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.18"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.19_PN_NV_Nil" description="eVitals.19 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.19"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.20_PN_NV_Nil" description="eVitals.20 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.20"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.21_PN_NV_Nil" description="eVitals.21 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.21"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eVitals.22_State_Required" description="eVitals.22 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.22"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_1" id="eVitals.26_PN_NV_Nil" description="eVitals.26 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.26"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.27_PN_NV_Nil" description="eVitals.27 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.27"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_2" id="eVitals.29_PN_NV_Nil" description="eVitals.29 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.29"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

<iso:pattern is-a="national_4" id="eVitals.30_State_Required" description="eVitals.30 is missing NV attribute">
    <iso:param name="realElem" value="nem:eVitals.30"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>

<iso:pattern is-a="national_2" id="eVitals.31_PN_NV_Nil" description="eVitals.31 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.31"/>
    <iso:param name="PREFIX" value="[FATAL] National Schematron Rule Violation"/>
</iso:pattern>                                          

</iso:schema>