<?xml version="1.0" encoding="utf-8"?>
<!-- Data Dictionary Version 3.3.3.130926 -->
<iso:schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:nem="http://www.nemsis.org" queryBinding="xslt2">
    <iso:ns prefix="nem" uri="http://www.nemsis.org"/>
    <iso:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
    <iso:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <iso:title>NEMSIS National ISO schematron file.</iso:title>

<!-- This is the abstract pattern for elements having PN/NV/Nil attributes.
 1) xsi:nil=false then NV should not have a value
 2) xsi:nil=true then PN should not have a value -->
<iso:pattern abstract="true" id="nationalStructureRule1">
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
<iso:pattern abstract="true" id="nationalStructureRule2">
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
<iso:pattern abstract="true" id="nationalStructureRule3">
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
<iso:pattern abstract="true" id="nationalStructureRule4">
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

<iso:pattern is-a="nationalStructureRule4" id="dAgency.03_State_Required" description="dAgency.03(EMS Agency Name) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Agency Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.07_State_Required" description="dAgency.07(EMS Agency Census Tracts) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Agency Census Tracts is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.08_State_Required" description="dAgency.08(EMS Agency Service Area ZIP Codes) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Agency Service Area ZIP Codes is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.10_State_Required" description="dAgency.10(Other Types of Service) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Other Types of Service is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.16_State_Required" description="dAgency.16(Total Primary Service Area Size) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Total Primary Service Area Size is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.17_State_Required" description="dAgency.17(Total Service Area Population) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Total Service Area Population is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.18_State_Required" description="dAgency.18(911 EMS Call Center Volume per Year) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.18"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: 911 EMS Call Center Volume per Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.19_State_Required" description="dAgency.19(EMS Dispatch Volume per Year) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.19"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Dispatch Volume per Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.20_State_Required" description="dAgency.20(EMS Patient Transport Volume per Year) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.20"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Patient Transport Volume per Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.21_State_Required" description="dAgency.21(EMS Patient Contact Volume per Year) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.21"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Patient Contact Volume per Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.22_State_Required" description="dAgency.22(EMS Billable Calls per Year) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.22"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Billable Calls per Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.25_State_Required" description="dAgency.25(National Provider Identifier) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.25"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: National Provider Identifier is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dAgency.26_State_Required" description="dAgency.26(Fire Department ID Number) is missing NV attribute"><iso:param name="realElem" value="nem:dAgency.26"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Fire Department ID Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.01_State_Required" description="dContact.01(Agency Contact Type) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.02_State_Required" description="dContact.02(Agency Contact Last Name) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact Last Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.03_State_Required" description="dContact.03(Agency Contact First Name) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact First Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.05_State_Required" description="dContact.05(Agency Contact Address) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact Address is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.06_State_Required" description="dContact.06(Agency Contact City) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact City is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.07_State_Required" description="dContact.07(Agency Contact State) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.08_State_Required" description="dContact.08(Agency Contact ZIP Code) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact ZIP Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.10_State_Required" description="dContact.10(Agency Contact Phone Number) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact Phone Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.11_State_Required" description="dContact.11(Agency Contact Email Address) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Contact Email Address is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.12_State_Required" description="dContact.12(EMS Agency Contact Web Address) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Agency Contact Web Address is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.13_State_Required" description="dContact.13(Agency Medical Director Degree) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.13"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Medical Director Degree is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dContact.14_State_Required" description="dContact.14(Agency Medical Director Board Certification Type) is missing NV attribute"><iso:param name="realElem" value="nem:dContact.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Agency Medical Director Board Certification Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dConfiguration.03_State_Required" description="dConfiguration.03(Procedures Permitted by the State) is missing NV attribute"><iso:param name="realElem" value="nem:dConfiguration.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Procedures Permitted by the State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dConfiguration.04_State_Required" description="dConfiguration.04(Medications Permitted by the State) is missing NV attribute"><iso:param name="realElem" value="nem:dConfiguration.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medications Permitted by the State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dConfiguration.05_State_Required" description="dConfiguration.05(Protocols Permitted by the State) is missing NV attribute"><iso:param name="realElem" value="nem:dConfiguration.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Protocols Permitted by the State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dConfiguration.14_State_Required" description="dConfiguration.14(EMD Vendor) is missing NV attribute"><iso:param name="realElem" value="nem:dConfiguration.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMD Vendor is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dVehicle.01_State_Required" description="dVehicle.01(Unit/Vehicle Number) is missing NV attribute"><iso:param name="realElem" value="nem:dVehicle.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Unit/Vehicle Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dVehicle.04_State_Required" description="dVehicle.04(Vehicle Type) is missing NV attribute"><iso:param name="realElem" value="nem:dVehicle.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Vehicle Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dVehicle.10_State_Required" description="dVehicle.10(Vehicle Model Year) is missing NV attribute"><iso:param name="realElem" value="nem:dVehicle.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Vehicle Model Year is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.01_State_Required" description="dPersonnel.01(EMS Personnel's Last Name) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Last Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.02_State_Required" description="dPersonnel.02(EMS Personnel's First Name) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's First Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.03_State_Required" description="dPersonnel.03(EMS Personnel's Middle Name/Initial) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Middle Name/Initial is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.11_State_Required" description="dPersonnel.11(EMS Personnel's Date of Birth) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Date of Birth is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.12_State_Required" description="dPersonnel.12(EMS Personnel's Gender) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Gender is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.13_State_Required" description="dPersonnel.13(EMS Personnel's Race) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.13"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Race is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.22_State_Required" description="dPersonnel.22(EMS Personnel's State of Licensure) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.22"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's State of Licensure is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.23_State_Required" description="dPersonnel.23(EMS Personnel's State's Licensure ID Number) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.23"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's State's Licensure ID Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.24_State_Required" description="dPersonnel.24(EMS Personnel's State EMS Certification Licensure Level) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.24"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's State EMS Certification Licensure Level is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.31_State_Required" description="dPersonnel.31(EMS Personnel's Employment Status) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.31"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Employment Status is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.32_State_Required" description="dPersonnel.32(EMS Personnel's Employment Status Date) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.32"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Employment Status Date is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.34_State_Required" description="dPersonnel.34(EMS Personnel's Primary EMS Job Role) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.34"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Primary EMS Job Role is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="dPersonnel.35_State_Required" description="dPersonnel.35(EMS Personnel's Other Job Responsibilities) is missing NV attribute"><iso:param name="realElem" value="nem:dPersonnel.35"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Personnel's Other Job Responsibilities is missing NV attribute"/></iso:pattern>

</iso:schema>