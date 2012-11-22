<?xml version="1.0" encoding="utf-8"?>
<!-- Data Dictionary Version 3.3.0.121121 -->
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

<iso:pattern is-a="nationalStructureRule4" id="eResponse.02_State_Required" description="eResponse.02(EMS Agency Name) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Agency Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.03_State_Required" description="eResponse.03(Incident Number) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.04_State_Required" description="eResponse.04(EMS Response Number) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Response Number is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.08_State_Required" description="eResponse.08(Type of Dispatch Delay) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Dispatch Delay is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.09_State_Required" description="eResponse.09(Type of Response Delay) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Response Delay is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.10_State_Required" description="eResponse.10(Type of Scene Delay) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Scene Delay is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.11_State_Required" description="eResponse.11(Type of Transport Delay) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Transport Delay is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.12_State_Required" description="eResponse.12(Type of Turn-Around Delay) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Turn-Around Delay is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eResponse.24_State_Required" description="eResponse.24(Additional Response Mode Descriptors) is missing NV attribute"><iso:param name="realElem" value="nem:eResponse.24"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Additional Response Mode Descriptors is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDispatch.02_State_Required" description="eDispatch.02(EMD Performed) is missing NV attribute"><iso:param name="realElem" value="nem:eDispatch.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMD Performed is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eCrew.01_State_Required" description="eCrew.01(Crew Member ID) is missing NV attribute"><iso:param name="realElem" value="nem:eCrew.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Crew Member ID is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eCrew.02_State_Required" description="eCrew.02(Crew Member Level) is missing NV attribute"><iso:param name="realElem" value="nem:eCrew.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Crew Member Level is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eCrew.03_State_Required" description="eCrew.03(Crew Member Response Role) is missing NV attribute"><iso:param name="realElem" value="nem:eCrew.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Crew Member Response Role is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.01_State_Required" description="eTimes.01(PSAP Call Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: PSAP Call Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.05_State_Required" description="eTimes.05(Unit En Route Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Unit En Route Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.06_State_Required" description="eTimes.06(Unit Arrived on Scene Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Unit Arrived on Scene Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.07_State_Required" description="eTimes.07(Arrived at Patient Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Arrived at Patient Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.08_State_Required" description="eTimes.08(Transfer of EMS Patient Care Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Transfer of EMS Patient Care Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.09_State_Required" description="eTimes.09(Unit Left Scene Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Unit Left Scene Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.11_State_Required" description="eTimes.11(Patient Arrived at Destination Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient Arrived at Destination Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eTimes.12_State_Required" description="eTimes.12(Destination Patient Transfer of Care Date/Time) is missing NV attribute"><iso:param name="realElem" value="nem:eTimes.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination Patient Transfer of Care Date/Time is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="ePatient.02_PN_NV_Nil" description="ePatient.02(Last Name) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:ePatient.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Last Name attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="ePatient.03_PN_NV_Nil" description="ePatient.03(First Name) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:ePatient.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: First Name attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.07_State_Required" description="ePatient.07(Patient's Home County) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient's Home County is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.08_State_Required" description="ePatient.08(Patient's Home State) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient's Home State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.09_State_Required" description="ePatient.09(Patient's Home ZIP Code) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient's Home ZIP Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.13_State_Required" description="ePatient.13(Gender) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.13"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Gender is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.14_State_Required" description="ePatient.14(Race) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Race is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.15_State_Required" description="ePatient.15(Age) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.15"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Age is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePatient.16_State_Required" description="ePatient.16(Age Units) is missing NV attribute"><iso:param name="realElem" value="nem:ePatient.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Age Units is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="ePatient.17_PN_NV_Nil" description="ePatient.17(Date of Birth) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:ePatient.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Date of Birth attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePayment.01_State_Required" description="ePayment.01(Primary Method of Payment) is missing NV attribute"><iso:param name="realElem" value="nem:ePayment.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Primary Method of Payment is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="ePayment.50_State_Required" description="ePayment.50(CMS Service Level) is missing NV attribute"><iso:param name="realElem" value="nem:ePayment.50"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: CMS Service Level is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.01_State_Required" description="eScene.01(First EMS Unit on Scene) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: First EMS Unit on Scene is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.06_State_Required" description="eScene.06(Number of Patients at Scene) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Number of Patients at Scene is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.07_State_Required" description="eScene.07(Mass Casualty Incident) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Mass Casualty Incident is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.08_State_Required" description="eScene.08(Triage Classification for MCI Patient) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Triage Classification for MCI Patient is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.09_State_Required" description="eScene.09(Incident Location Type) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident Location Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.10_State_Required" description="eScene.10(Incident Facility Code) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident Facility Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.14_State_Required" description="eScene.14(Mile Post or Major Roadway) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Mile Post or Major Roadway is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.15_State_Required" description="eScene.15(Incident Street Address) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.15"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident Street Address is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.16_State_Required" description="eScene.16(Incident Apartment, Suite, or Room) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident Apartment, Suite, or Room is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.17_State_Required" description="eScene.17(Incident City) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident City is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.18_State_Required" description="eScene.18(Incident State) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.18"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.19_State_Required" description="eScene.19(Incident ZIP Code) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.19"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident ZIP Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.20_State_Required" description="eScene.20(Scene Cross Street or Directions) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.20"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Scene Cross Street or Directions is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eScene.21_State_Required" description="eScene.21(Incident County) is missing NV attribute"><iso:param name="realElem" value="nem:eScene.21"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Incident County is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.01_State_Required" description="eSituation.01(Date/Time of Symptom Onset/Last Normal) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time of Symptom Onset/Last Normal is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.02_State_Required" description="eSituation.02(Possible Injury) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Possible Injury is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.03_State_Required" description="eSituation.03(Complaint Type) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Complaint Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.04_State_Required" description="eSituation.04(Complaint) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Complaint is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.05_State_Required" description="eSituation.05(Duration of Complaint) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Duration of Complaint is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.06_State_Required" description="eSituation.06(Time Units of Duration of Complaint) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Time Units of Duration of Complaint is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.07_State_Required" description="eSituation.07(Chief Complaint Anatomic Location) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Chief Complaint Anatomic Location is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.08_State_Required" description="eSituation.08(Chief Complaint Organ System) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Chief Complaint Organ System is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.09_State_Required" description="eSituation.09(Primary Symptom) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Primary Symptom is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.10_State_Required" description="eSituation.10(Other Associated Symptoms) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Other Associated Symptoms is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.11_State_Required" description="eSituation.11(Provider's Primary Impression) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Provider's Primary Impression is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.12_State_Required" description="eSituation.12(Provider's Secondary Impressions) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Provider's Secondary Impressions is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.13_State_Required" description="eSituation.13(Initial Patient Acuity) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.13"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Initial Patient Acuity is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.14_State_Required" description="eSituation.14(Work-Related Illness/Injury) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Work-Related Illness/Injury is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eSituation.17_State_Required" description="eSituation.17(Patient Activity) is missing NV attribute"><iso:param name="realElem" value="nem:eSituation.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient Activity is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eInjury.01_State_Required" description="eInjury.01(Cause of Injury) is missing NV attribute"><iso:param name="realElem" value="nem:eInjury.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Cause of Injury is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eInjury.02_State_Required" description="eInjury.02(Mechanism of Injury) is missing NV attribute"><iso:param name="realElem" value="nem:eInjury.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Mechanism of Injury is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eInjury.03_State_Required" description="eInjury.03(Trauma Center Criteria) is missing NV attribute"><iso:param name="realElem" value="nem:eInjury.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Trauma Center Criteria is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eInjury.04_PN_NV_Nil" description="eInjury.04(Vehicular, Pedestrian, or Other Injury Risk Factor) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eInjury.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Vehicular, Pedestrian, or Other Injury Risk Factor attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eInjury.07_State_Required" description="eInjury.07(Use of Occupant Safety Equipment) is missing NV attribute"><iso:param name="realElem" value="nem:eInjury.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Use of Occupant Safety Equipment is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.01_State_Required" description="eArrest.01(Cardiac Arrest) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Cardiac Arrest is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.02_State_Required" description="eArrest.02(Cardiac Arrest Etiology) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Cardiac Arrest Etiology is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.03_State_Required" description="eArrest.03(Resuscitation Attempted By EMS) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Resuscitation Attempted By EMS is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.04_State_Required" description="eArrest.04(Arrest Witnessed By) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Arrest Witnessed By is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.05_State_Required" description="eArrest.05(CPR Care Provided Prior to EMS Arrival) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: CPR Care Provided Prior to EMS Arrival is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.07_State_Required" description="eArrest.07(AED Use Prior to EMS Arrival) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: AED Use Prior to EMS Arrival is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.09_State_Required" description="eArrest.09(Type of CPR Provided) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of CPR Provided is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.10_State_Required" description="eArrest.10(Therapeutic Hypothermia Initiated) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Therapeutic Hypothermia Initiated is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.11_State_Required" description="eArrest.11(First Monitored Arrest Rhythm of the Patient) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: First Monitored Arrest Rhythm of the Patient is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.12_State_Required" description="eArrest.12(Any Return of Spontaneous Circulation) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Any Return of Spontaneous Circulation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.14_State_Required" description="eArrest.14(Date/Time of Cardiac Arrest) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time of Cardiac Arrest is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.15_State_Required" description="eArrest.15(Date/Time Resuscitation Discontinued) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.15"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time Resuscitation Discontinued is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.16_State_Required" description="eArrest.16(Reason CPR/Resuscitation Discontinued) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Reason CPR/Resuscitation Discontinued is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.17_State_Required" description="eArrest.17(Cardiac Rhythm on Arrival at Destination) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Cardiac Rhythm on Arrival at Destination is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eArrest.18_State_Required" description="eArrest.18(End of EMS Cardiac Arrest Event) is missing NV attribute"><iso:param name="realElem" value="nem:eArrest.18"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: End of EMS Cardiac Arrest Event is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eHistory.01_State_Required" description="eHistory.01(Barriers to Patient Care) is missing NV attribute"><iso:param name="realElem" value="nem:eHistory.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Barriers to Patient Care is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eHistory.05_State_Required" description="eHistory.05(Advance Directives) is missing NV attribute"><iso:param name="realElem" value="nem:eHistory.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Advance Directives is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eHistory.06_PN_NV_Nil" description="eHistory.06(Medication Allergies) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eHistory.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Medication Allergies attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eHistory.08_PN_NV_Nil" description="eHistory.08(Medical/Surgical History) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eHistory.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Medical/Surgical History attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eHistory.12_PN_NV_Nil" description="eHistory.12(Current Medications) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eHistory.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Current Medications attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eHistory.17_PN_NV_Nil" description="eHistory.17(Alcohol/Drug Use Indicators) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eHistory.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Alcohol/Drug Use Indicators attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eNarrative.01_State_Required" description="eNarrative.01(Patient Care Report Narrative) is missing NV attribute"><iso:param name="realElem" value="nem:eNarrative.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Patient Care Report Narrative is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.01_State_Required" description="eVitals.01(Date/Time Vital Signs Taken) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time Vital Signs Taken is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.02_State_Required" description="eVitals.02(Obtained Prior to this Unit's EMS Care) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Obtained Prior to this Unit's EMS Care is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.03_PN_NV_Nil" description="eVitals.03(Cardiac Rhythm / Electrocardiography (ECG)) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Cardiac Rhythm / Electrocardiography (ECG) attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.04_State_Required" description="eVitals.04(ECG Type) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: ECG Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.05_State_Required" description="eVitals.05(Method of ECG Interpretation) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Method of ECG Interpretation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.06_PN_NV_Nil" description="eVitals.06(SBP (Systolic Blood Pressure)) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: SBP (Systolic Blood Pressure) attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.07_PN_NV_Nil" description="eVitals.07(DBP (Diastolic Blood Pressure)) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: DBP (Diastolic Blood Pressure) attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.08_State_Required" description="eVitals.08(Method of Blood Pressure Measurement) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Method of Blood Pressure Measurement is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.10_PN_NV_Nil" description="eVitals.10(Heart Rate) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Heart Rate attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.12_PN_NV_Nil" description="eVitals.12(Pulse Oximetry) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.12"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Pulse Oximetry attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.14_PN_NV_Nil" description="eVitals.14(Respiratory Rate) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.14"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Respiratory Rate attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.16_PN_NV_Nil" description="eVitals.16(Carbon Dioxide (CO2)) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Carbon Dioxide (CO2) attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.17_PN_NV_Nil" description="eVitals.17(Carbon Monoxide (CO)) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Carbon Monoxide (CO) attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.18_PN_NV_Nil" description="eVitals.18(Blood Glucose Level) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.18"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Blood Glucose Level attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.19_PN_NV_Nil" description="eVitals.19(Glasgow Coma Score-Eye) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.19"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Glasgow Coma Score-Eye attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.20_PN_NV_Nil" description="eVitals.20(Glasgow Coma Score-Verbal) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.20"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Glasgow Coma Score-Verbal attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.21_PN_NV_Nil" description="eVitals.21(Glasgow Coma Score-Motor) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.21"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Glasgow Coma Score-Motor attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.22_State_Required" description="eVitals.22(Glasgow Coma Score-Qualifier) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.22"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Glasgow Coma Score-Qualifier is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.23_PN_NV_Nil" description="eVitals.23(Total Glasgow Coma Score) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.23"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Total Glasgow Coma Score attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.24_PN_NV_Nil" description="eVitals.24(Temperature) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.24"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Temperature attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.26_State_Required" description="eVitals.26(Level of Responsiveness (AVPU)) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.26"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Level of Responsiveness (AVPU) is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.27_PN_NV_Nil" description="eVitals.27(Pain Score) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.27"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Pain Score attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.28_State_Required" description="eVitals.28(Pain Scale Type) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.28"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Pain Scale Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.29_PN_NV_Nil" description="eVitals.29(Stroke Scale Score) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.29"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Stroke Scale Score attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eVitals.30_State_Required" description="eVitals.30(Stroke Scale Type) is missing NV attribute"><iso:param name="realElem" value="nem:eVitals.30"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Stroke Scale Type is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eVitals.31_PN_NV_Nil" description="eVitals.31(Reperfusion Checklist) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eVitals.31"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Reperfusion Checklist attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eExam.01_PN_NV_Nil" description="eExam.01(Estimated Body Weight in Kilograms) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eExam.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Estimated Body Weight in Kilograms attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule2" id="eExam.02_PN_NV_Nil" description="eExam.02(Length Based Tape Measure) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eExam.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 2 violation: Length Based Tape Measure attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProtocols.01_State_Required" description="eProtocols.01(Protocols Used) is missing NV attribute"><iso:param name="realElem" value="nem:eProtocols.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Protocols Used is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProtocols.02_State_Required" description="eProtocols.02(Protocol Age Category) is missing NV attribute"><iso:param name="realElem" value="nem:eProtocols.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Protocol Age Category is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.01_State_Required" description="eMedications.01(Date/Time Medication Administered) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time Medication Administered is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.02_State_Required" description="eMedications.02(Medication Administered Prior to this Unit's EMS Care) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medication Administered Prior to this Unit's EMS Care is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule1" id="eMedications.03_PN_NV_Nil" description="eMedications.03(Medication Given) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eMedications.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 1 violation: Medication Given attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.05_State_Required" description="eMedications.05(Medication Dosage) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medication Dosage is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.06_State_Required" description="eMedications.06(Medication Dosage Units) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medication Dosage Units is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.07_State_Required" description="eMedications.07(Response to Medication) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Response to Medication is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.08_State_Required" description="eMedications.08(Medication Complication) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medication Complication is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.09_State_Required" description="eMedications.09(Medication Crew (Healthcare Professionals) ID) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Medication Crew (Healthcare Professionals) ID is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eMedications.10_State_Required" description="eMedications.10(Role/Type of Person Administering Medication) is missing NV attribute"><iso:param name="realElem" value="nem:eMedications.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Role/Type of Person Administering Medication is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.01_State_Required" description="eProcedures.01(Date/Time Procedure Performed) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time Procedure Performed is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.02_State_Required" description="eProcedures.02(Procedure Performed Prior to this Unit's EMS Care) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Procedure Performed Prior to this Unit's EMS Care is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule1" id="eProcedures.03_PN_NV_Nil" description="eProcedures.03(Procedure) PN/NV/NIL combination not valid"><iso:param name="realElem" value="nem:eProcedures.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 1 violation: Procedure attributes PN/NV/NIL combination not valid."/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.05_State_Required" description="eProcedures.05(Number of Procedure Attempts) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Number of Procedure Attempts is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.06_State_Required" description="eProcedures.06(Procedure Successful) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Procedure Successful is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.07_State_Required" description="eProcedures.07(Procedure Complication) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Procedure Complication is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.08_State_Required" description="eProcedures.08(Response to Procedure) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Response to Procedure is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.09_State_Required" description="eProcedures.09(Procedure Crew Members ID) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.09"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Procedure Crew Members ID is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.10_State_Required" description="eProcedures.10(Role/Type of Person Performing the Procedure) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.10"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Role/Type of Person Performing the Procedure is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eProcedures.13_State_Required" description="eProcedures.13(Vascular Access Location) is missing NV attribute"><iso:param name="realElem" value="nem:eProcedures.13"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Vascular Access Location is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.01_State_Required" description="eAirway.01(Indications for Invasive Airway) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Indications for Invasive Airway is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.02_State_Required" description="eAirway.02(Date/Time Airway Device Placement Confirmation) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time Airway Device Placement Confirmation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.03_State_Required" description="eAirway.03(Airway Device Being Confirmed) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.03"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Airway Device Being Confirmed is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.04_State_Required" description="eAirway.04(Airway Device Placement Confirmed Method) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.04"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Airway Device Placement Confirmed Method is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.06_State_Required" description="eAirway.06(Type of Individual Confirming Airway Device Placement) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Individual Confirming Airway Device Placement is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.07_State_Required" description="eAirway.07(Crew Member ID) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Crew Member ID is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eAirway.08_State_Required" description="eAirway.08(Airway Complications Encountered) is missing NV attribute"><iso:param name="realElem" value="nem:eAirway.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Airway Complications Encountered is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.01_State_Required" description="eDisposition.01(Destination/Transferred To, Name) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination/Transferred To, Name is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.02_State_Required" description="eDisposition.02(Destination/Transferred To, Code) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination/Transferred To, Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.05_State_Required" description="eDisposition.05(Destination State) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination State is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.06_State_Required" description="eDisposition.06(Destination County) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination County is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.07_State_Required" description="eDisposition.07(Destination ZIP Code) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.07"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination ZIP Code is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.11_State_Required" description="eDisposition.11(Number of Patients Transported in this EMS Unit) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.11"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Number of Patients Transported in this EMS Unit is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.16_State_Required" description="eDisposition.16(EMS Transport Method) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.16"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: EMS Transport Method is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.17_State_Required" description="eDisposition.17(Transport Mode from Scene) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.17"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Transport Mode from Scene is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.18_State_Required" description="eDisposition.18(Additional Transport Mode Descriptors) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.18"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Additional Transport Mode Descriptors is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.19_State_Required" description="eDisposition.19(Condition of Patient at Destination) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.19"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Condition of Patient at Destination is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.20_State_Required" description="eDisposition.20(Reason for Choosing Destination) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.20"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Reason for Choosing Destination is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.21_State_Required" description="eDisposition.21(Type of Destination) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.21"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Type of Destination is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.22_State_Required" description="eDisposition.22(Hospital In-Patient Destination) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.22"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Hospital In-Patient Destination is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.23_State_Required" description="eDisposition.23(Hospital Designation) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.23"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Hospital Designation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.24_State_Required" description="eDisposition.24(Destination Team Pre-Arrival Activation) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.24"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Destination Team Pre-Arrival Activation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eDisposition.25_State_Required" description="eDisposition.25(Date/Time of Destination Prearrival Activation) is missing NV attribute"><iso:param name="realElem" value="nem:eDisposition.25"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Date/Time of Destination Prearrival Activation is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eOutcome.01_State_Required" description="eOutcome.01(Emergency Department Disposition) is missing NV attribute"><iso:param name="realElem" value="nem:eOutcome.01"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Emergency Department Disposition is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eOutcome.02_State_Required" description="eOutcome.02(Hospital Disposition) is missing NV attribute"><iso:param name="realElem" value="nem:eOutcome.02"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Hospital Disposition is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eOther.05_State_Required" description="eOther.05(Suspected EMS Work Related Exposure, Injury, or Death) is missing NV attribute"><iso:param name="realElem" value="nem:eOther.05"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Suspected EMS Work Related Exposure, Injury, or Death is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eOther.06_State_Required" description="eOther.06(The Type of Work-Related Injury, Death or Suspected Exposure) is missing NV attribute"><iso:param name="realElem" value="nem:eOther.06"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: The Type of Work-Related Injury, Death or Suspected Exposure is missing NV attribute"/></iso:pattern>

<iso:pattern is-a="nationalStructureRule4" id="eOther.08_State_Required" description="eOther.08(Crew Member Completing this Report) is missing NV attribute"><iso:param name="realElem" value="nem:eOther.08"/><iso:param name="PREFIX" value="[FATAL] National Schematron structure rule 4 violation: Crew Member Completing this Report is missing NV attribute"/></iso:pattern>

</iso:schema>