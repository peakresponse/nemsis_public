<?xml version="1.0" encoding="utf-8"?>                                                                                                                            
<iso:schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:nem="http://www.nemsis.org" queryBinding="xslt2">    
    <iso:ns prefix="nem" uri="http://www.nemsis.org"/>                                                                                                                   
    <iso:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>                                                                                                    
    <iso:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>                                                                                               
    <iso:title>NEMSIS National ISO schematron file.</iso:title>

<!-- This is the abstract pattern for elements having PN/NV/Nil attributes -->                                                                       
<iso:pattern abstract="true" id="national_1">                                                                                                    
    <iso:rule context="$realElem" role="[ERROR]">                                                                                                
        <iso:let name="nvValue" value="normalize-space(@NV)" />                                                                                  
        <iso:let name="pnValue" value="normalize-space(@PN)" />                                                                                  
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />                                                                            
        <iso:let name="selfValue" value="normalize-space(.)" />                                                                                  
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />                                                 
        <iso:let name="pnHasValue" value="if (normalize-space(@PN)) then true() else false()" />                                                 
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />                                 
        <iso:assert role="[ERROR]" test="if (($nilRealValue and $pnHasValue) or (not($nilRealValue) and $nvHasValue)) then false else true()">   
            $PREFIX: the PN, NV, NIL combination for element <iso:name/> is not valid.                                                               
            NV has value of '<iso:value-of select="$nvValue" />';                                                                                  
            PN has value of '<iso:value-of select="$pnValue" />';                                                                                  
            NIL has value of '<iso:value-of select="$nilValue" />';                                                                                
            Element value is '<iso:value-of select="$selfValue" />';                                                                               
            position is '<iso:value-of select="position()" />';                                                                                    
        </iso:assert>                                                                                                                                
    </iso:rule>                                                                                                                                      
</iso:pattern>                                                                                                                                       

<!-- This is the abstract pattern for any element having only NV/Nil attributes: if Nil==false, NV should not have value -->  
<iso:pattern abstract="true" id="national_2">                                                                                        
    <iso:rule context="$realElem" role="[ERROR]">                                                                                    
        <iso:let name="nvValue" value="normalize-space(@NV)" />                                                                      
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />                                                                
        <iso:let name="selfValue" value="normalize-space(.)" />                                                                      
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />                                     
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />                     
                                                                                                                                         
        <iso:assert role="[ERROR]" test="if ((not($nilRealValue) and $nvHasValue)) then false() else true()">                        
            $PREFIX: <iso:name/> is a required/recommended state element. When its value is Nill, NV attribute must be specified.        
            NV has value of '<iso:value-of select="$nvValue" />';                                                                      
            NIL has value of '<iso:value-of select="$nilValue" />';                                                                    
            Element value is '<iso:value-of select="$selfValue" />';                                                                   
            position is '<iso:value-of select="position()" />';                                                                        
        </iso:assert>                                                                                                                    
    </iso:rule>                                                                                                                          
</iso:pattern>                                                                                                                           

<!-- This is the abstract pattern for state required/recommended elements having only NV/Nil attributes:                      
        if Nil is true, then NV must be specified                                                                                        
-->                                                                                                                                      
<iso:pattern abstract="true" id="national_3">                                                                                        
    <iso:rule context="$realElem" role="[ERROR]" >                                                                                   
        <iso:let name="nvValue" value="normalize-space(@NV)" />                                                                      
        <iso:let name="nilValue" value="normalize-space(@xsi:nil)" />                                                                
        <iso:let name="selfValue" value="normalize-space(.)" />                                                                      
        <iso:let name="nvHasValue" value="if (normalize-space(@NV)) then true() else false()" />                                     
                                                                                                                                         
        <iso:let name="nilRealValue" value="if (normalize-space(@xsi:nil) = 'true') then true() else false()" />                     
                                                                                                                                         
        <iso:assert role="[ERROR]" test="if ($nilRealValue and not($nvHasValue))then false() else true()">                           
            $PREFIX: <iso:name/> is a required/recommended state element. When its value is Nill, NV attribute must be specified.        
            NV has value of '<iso:value-of select="$nvValue" />';                                                                      
            NIL has value of '<iso:value-of select="$nilValue" />';                                                                    
            Element value is '<iso:value-of select="$selfValue" />';                                                                   
            position is '<iso:value-of select="position()" />';                                                                        
        </iso:assert>                                                                                                                    
    </iso:rule>                                                                                                                          
</iso:pattern>

<iso:pattern is-a="national_2" id="dAgency.03_General_NV" description="dAgency.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.03_State_Required" description="dAgency.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.07_General_NV" description="dAgency.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.07_State_Required" description="dAgency.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.10_General_NV" description="dAgency.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.10_State_Required" description="dAgency.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.16_General_NV" description="dAgency.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.16_State_Required" description="dAgency.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.17_General_NV" description="dAgency.17 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.17.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.17_State_Required" description="dAgency.17 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.17"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.18_General_NV" description="dAgency.18 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.18.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.18_State_Required" description="dAgency.18 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.18"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.19_General_NV" description="dAgency.19 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.19.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.19_State_Required" description="dAgency.19 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.19"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.20_General_NV" description="dAgency.20 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.20.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.20_State_Required" description="dAgency.20 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.20"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.21_General_NV" description="dAgency.21 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.21.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.21_State_Required" description="dAgency.21 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.21"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.22_General_NV" description="dAgency.22 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.22.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.22_State_Required" description="dAgency.22 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.22"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.25_General_NV" description="dAgency.25 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.25.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.25_State_Required" description="dAgency.25 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.25"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dAgency.26_General_NV" description="dAgency.26 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dAgency.26.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dAgency.26_State_Required" description="dAgency.26 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dAgency.26"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.01_General_NV" description="dContact.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.01_State_Required" description="dContact.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.02_General_NV" description="dContact.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.02_State_Required" description="dContact.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.03_General_NV" description="dContact.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.03_State_Required" description="dContact.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.05_General_NV" description="dContact.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.05_State_Required" description="dContact.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.06_General_NV" description="dContact.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.06_State_Required" description="dContact.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.07_General_NV" description="dContact.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.07_State_Required" description="dContact.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.08_General_NV" description="dContact.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.08_State_Required" description="dContact.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.10_General_NV" description="dContact.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.10_State_Required" description="dContact.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.11_General_NV" description="dContact.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.11_State_Required" description="dContact.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.12_General_NV" description="dContact.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.12_State_Required" description="dContact.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.13_General_NV" description="dContact.13 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.13.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.13_State_Required" description="dContact.13 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.13"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dContact.14_General_NV" description="dContact.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dContact.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dContact.14_State_Required" description="dContact.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dContact.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dConfiguration.03_General_NV" description="dConfiguration.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dConfiguration.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dConfiguration.03_State_Required" description="dConfiguration.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dConfiguration.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dConfiguration.04_General_NV" description="dConfiguration.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dConfiguration.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dConfiguration.04_State_Required" description="dConfiguration.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dConfiguration.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dConfiguration.05_General_NV" description="dConfiguration.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dConfiguration.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dConfiguration.05_State_Required" description="dConfiguration.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dConfiguration.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dConfiguration.14_General_NV" description="dConfiguration.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dConfiguration.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dConfiguration.14_State_Required" description="dConfiguration.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dConfiguration.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dVehicle.01_General_NV" description="dVehicle.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dVehicle.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dVehicle.01_State_Required" description="dVehicle.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dVehicle.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dVehicle.04_General_NV" description="dVehicle.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dVehicle.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dVehicle.04_State_Required" description="dVehicle.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dVehicle.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dVehicle.10_General_NV" description="dVehicle.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dVehicle.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dVehicle.10_State_Required" description="dVehicle.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dVehicle.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.11_General_NV" description="dPersonnel.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.11_State_Required" description="dPersonnel.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.12_General_NV" description="dPersonnel.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.12_State_Required" description="dPersonnel.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.13_General_NV" description="dPersonnel.13 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.13.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.13_State_Required" description="dPersonnel.13 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.13"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.22_General_NV" description="dPersonnel.22 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.22.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.22_State_Required" description="dPersonnel.22 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.22"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.23_General_NV" description="dPersonnel.23 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.23.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.23_State_Required" description="dPersonnel.23 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.23"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.24_General_NV" description="dPersonnel.24 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.24.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.24_State_Required" description="dPersonnel.24 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.24"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.31_General_NV" description="dPersonnel.31 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.31.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.31_State_Required" description="dPersonnel.31 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.31"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.32_General_NV" description="dPersonnel.32 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.32.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.32_State_Required" description="dPersonnel.32 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.32"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.34_General_NV" description="dPersonnel.34 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.34.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.34_State_Required" description="dPersonnel.34 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.34"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="dPersonnel.35_General_NV" description="dPersonnel.35 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:dPersonnel.35.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="dPersonnel.35_State_Required" description="dPersonnel.35 is missing NV attribute">           
    <iso:param name="realElem" value="nem:dPersonnel.35"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.02_General_NV" description="eResponse.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.02_State_Required" description="eResponse.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.03_General_NV" description="eResponse.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.03_State_Required" description="eResponse.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.04_General_NV" description="eResponse.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.04_State_Required" description="eResponse.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.08_General_NV" description="eResponse.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.08_State_Required" description="eResponse.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.09_General_NV" description="eResponse.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.09_State_Required" description="eResponse.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.10_General_NV" description="eResponse.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.10_State_Required" description="eResponse.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.11_General_NV" description="eResponse.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.11_State_Required" description="eResponse.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.12_General_NV" description="eResponse.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.12_State_Required" description="eResponse.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eResponse.23_General_NV" description="eResponse.23 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eResponse.23.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eResponse.23_State_Required" description="eResponse.23 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eResponse.23"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDispatch.02_General_NV" description="eDispatch.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDispatch.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDispatch.02_State_Required" description="eDispatch.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDispatch.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eCrew.01_General_NV" description="eCrew.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eCrew.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eCrew.01_State_Required" description="eCrew.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eCrew.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eCrew.02_General_NV" description="eCrew.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eCrew.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eCrew.02_State_Required" description="eCrew.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eCrew.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eCrew.03_General_NV" description="eCrew.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eCrew.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eCrew.03_State_Required" description="eCrew.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eCrew.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.01_General_NV" description="eTimes.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.01_State_Required" description="eTimes.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.05_General_NV" description="eTimes.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.05_State_Required" description="eTimes.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.06_General_NV" description="eTimes.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.06_State_Required" description="eTimes.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.07_General_NV" description="eTimes.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.07_State_Required" description="eTimes.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.08_General_NV" description="eTimes.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.08_State_Required" description="eTimes.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.09_General_NV" description="eTimes.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.09_State_Required" description="eTimes.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.11_General_NV" description="eTimes.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.11_State_Required" description="eTimes.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eTimes.12_General_NV" description="eTimes.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eTimes.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eTimes.12_State_Required" description="eTimes.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eTimes.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="ePatient.02_PN_NV_Nil" description="ePatient.02 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:ePatient.02"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="ePatient.02_General_NV" description="ePatient.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.02_State_Required" description="ePatient.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="ePatient.03_PN_NV_Nil" description="ePatient.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:ePatient.03"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="ePatient.03_General_NV" description="ePatient.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.03_State_Required" description="ePatient.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.07_General_NV" description="ePatient.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.07_State_Required" description="ePatient.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.08_General_NV" description="ePatient.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.08_State_Required" description="ePatient.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.09_General_NV" description="ePatient.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.09_State_Required" description="ePatient.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.13_General_NV" description="ePatient.13 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.13.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.13_State_Required" description="ePatient.13 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.13"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.14_General_NV" description="ePatient.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.14_State_Required" description="ePatient.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.15_General_NV" description="ePatient.15 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.15.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.15_State_Required" description="ePatient.15 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.15"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePatient.16_General_NV" description="ePatient.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePatient.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePatient.16_State_Required" description="ePatient.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePatient.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePayment.01_General_NV" description="ePayment.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePayment.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePayment.01_State_Required" description="ePayment.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePayment.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="ePayment.50_General_NV" description="ePayment.50 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:ePayment.50.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="ePayment.50_State_Required" description="ePayment.50 is missing NV attribute">           
    <iso:param name="realElem" value="nem:ePayment.50"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.01_General_NV" description="eScene.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.01_State_Required" description="eScene.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.06_General_NV" description="eScene.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.06_State_Required" description="eScene.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.07_General_NV" description="eScene.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.07_State_Required" description="eScene.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.08_General_NV" description="eScene.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.08_State_Required" description="eScene.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.09_General_NV" description="eScene.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.09_State_Required" description="eScene.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.16_General_NV" description="eScene.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.16_State_Required" description="eScene.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.17_General_NV" description="eScene.17 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.17.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.17_State_Required" description="eScene.17 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.17"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.18_General_NV" description="eScene.18 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.18.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.18_State_Required" description="eScene.18 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.18"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eScene.20_General_NV" description="eScene.20 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eScene.20.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eScene.20_State_Required" description="eScene.20 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eScene.20"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.01_General_NV" description="eSituation.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.01_State_Required" description="eSituation.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.02_General_NV" description="eSituation.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.02_State_Required" description="eSituation.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.03_General_NV" description="eSituation.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.03_State_Required" description="eSituation.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.04_General_NV" description="eSituation.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.04_State_Required" description="eSituation.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.05_General_NV" description="eSituation.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.05_State_Required" description="eSituation.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.06_General_NV" description="eSituation.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.06_State_Required" description="eSituation.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.07_General_NV" description="eSituation.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.07_State_Required" description="eSituation.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.08_General_NV" description="eSituation.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.08_State_Required" description="eSituation.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.09_General_NV" description="eSituation.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.09_State_Required" description="eSituation.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.10_General_NV" description="eSituation.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.10_State_Required" description="eSituation.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.11_General_NV" description="eSituation.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.11_State_Required" description="eSituation.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.12_General_NV" description="eSituation.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.12_State_Required" description="eSituation.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.13_General_NV" description="eSituation.13 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.13.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.13_State_Required" description="eSituation.13 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.13"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eSituation.14_General_NV" description="eSituation.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eSituation.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eSituation.14_State_Required" description="eSituation.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eSituation.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eInjury.01_General_NV" description="eInjury.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eInjury.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eInjury.01_State_Required" description="eInjury.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eInjury.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eInjury.02_General_NV" description="eInjury.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eInjury.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eInjury.02_State_Required" description="eInjury.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eInjury.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eInjury.03_General_NV" description="eInjury.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eInjury.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eInjury.03_State_Required" description="eInjury.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eInjury.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eInjury.04_PN_NV_Nil" description="eInjury.04 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eInjury.04"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eInjury.04_General_NV" description="eInjury.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eInjury.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eInjury.04_State_Required" description="eInjury.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eInjury.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eInjury.07_General_NV" description="eInjury.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eInjury.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eInjury.07_State_Required" description="eInjury.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eInjury.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.01_General_NV" description="eArrest.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.01_State_Required" description="eArrest.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.02_General_NV" description="eArrest.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.02_State_Required" description="eArrest.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.03_General_NV" description="eArrest.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.03_State_Required" description="eArrest.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.04_General_NV" description="eArrest.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.04_State_Required" description="eArrest.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.05_General_NV" description="eArrest.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.05_State_Required" description="eArrest.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.07_General_NV" description="eArrest.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.07_State_Required" description="eArrest.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.09_General_NV" description="eArrest.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.09_State_Required" description="eArrest.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.10_General_NV" description="eArrest.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.10_State_Required" description="eArrest.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.11_General_NV" description="eArrest.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.11_State_Required" description="eArrest.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.12_General_NV" description="eArrest.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.12_State_Required" description="eArrest.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.14_General_NV" description="eArrest.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.14_State_Required" description="eArrest.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.15_General_NV" description="eArrest.15 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.15.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.15_State_Required" description="eArrest.15 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.15"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.16_General_NV" description="eArrest.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.16_State_Required" description="eArrest.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.17_General_NV" description="eArrest.17 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.17.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.17_State_Required" description="eArrest.17 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.17"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eArrest.18_General_NV" description="eArrest.18 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eArrest.18.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eArrest.18_State_Required" description="eArrest.18 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eArrest.18"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eHistory.01_General_NV" description="eHistory.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eHistory.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eHistory.01_State_Required" description="eHistory.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eHistory.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eHistory.05_General_NV" description="eHistory.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eHistory.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eHistory.05_State_Required" description="eHistory.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eHistory.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eHistory.06_PN_NV_Nil" description="eHistory.06 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eHistory.06"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eHistory.06_General_NV" description="eHistory.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eHistory.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eHistory.06_State_Required" description="eHistory.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eHistory.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eHistory.12_PN_NV_Nil" description="eHistory.12 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eHistory.12"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eHistory.12_General_NV" description="eHistory.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eHistory.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eHistory.12_State_Required" description="eHistory.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eHistory.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eHistory.17_PN_NV_Nil" description="eHistory.17 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eHistory.17"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eHistory.17_General_NV" description="eHistory.17 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eHistory.17.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eHistory.17_State_Required" description="eHistory.17 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eHistory.17"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eNarrative.01_General_NV" description="eNarrative.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eNarrative.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eNarrative.01_State_Required" description="eNarrative.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eNarrative.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.01_General_NV" description="eVitals.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.01_State_Required" description="eVitals.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.02_General_NV" description="eVitals.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.02_State_Required" description="eVitals.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.03_PN_NV_Nil" description="eVitals.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.03"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.03_General_NV" description="eVitals.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.03_State_Required" description="eVitals.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.04_General_NV" description="eVitals.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.04_State_Required" description="eVitals.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.05_General_NV" description="eVitals.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.05_State_Required" description="eVitals.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.06_PN_NV_Nil" description="eVitals.06 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.06"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.06_General_NV" description="eVitals.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.06_State_Required" description="eVitals.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.07_PN_NV_Nil" description="eVitals.07 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.07"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.07_General_NV" description="eVitals.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.07_State_Required" description="eVitals.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.08_General_NV" description="eVitals.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.08_State_Required" description="eVitals.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.10_PN_NV_Nil" description="eVitals.10 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.10"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.10_General_NV" description="eVitals.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.10_State_Required" description="eVitals.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.12_PN_NV_Nil" description="eVitals.12 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.12"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.12_General_NV" description="eVitals.12 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.12.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.12_State_Required" description="eVitals.12 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.12"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.14_PN_NV_Nil" description="eVitals.14 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.14"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.14_General_NV" description="eVitals.14 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.14.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.14_State_Required" description="eVitals.14 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.14"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.16_PN_NV_Nil" description="eVitals.16 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.16"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.16_General_NV" description="eVitals.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.16_State_Required" description="eVitals.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.18_PN_NV_Nil" description="eVitals.18 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.18"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.18_General_NV" description="eVitals.18 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.18.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.18_State_Required" description="eVitals.18 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.18"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.19_PN_NV_Nil" description="eVitals.19 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.19"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.19_General_NV" description="eVitals.19 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.19.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.19_State_Required" description="eVitals.19 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.19"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.20_PN_NV_Nil" description="eVitals.20 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.20"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.20_General_NV" description="eVitals.20 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.20.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.20_State_Required" description="eVitals.20 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.20"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.21_PN_NV_Nil" description="eVitals.21 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.21"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.21_General_NV" description="eVitals.21 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.21.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.21_State_Required" description="eVitals.21 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.21"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.22_General_NV" description="eVitals.22 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.22.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.22_State_Required" description="eVitals.22 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.22"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.23_PN_NV_Nil" description="eVitals.23 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.23"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.23_General_NV" description="eVitals.23 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.23.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.23_State_Required" description="eVitals.23 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.23"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.24_PN_NV_Nil" description="eVitals.24 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.24"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.24_General_NV" description="eVitals.24 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.24.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.24_State_Required" description="eVitals.24 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.24"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.26_PN_NV_Nil" description="eVitals.26 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.26"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.26_General_NV" description="eVitals.26 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.26.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.26_State_Required" description="eVitals.26 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.26"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.27_PN_NV_Nil" description="eVitals.27 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.27"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.27_General_NV" description="eVitals.27 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.27.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.27_State_Required" description="eVitals.27 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.27"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.28_General_NV" description="eVitals.28 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.28.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.28_State_Required" description="eVitals.28 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.28"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.29_PN_NV_Nil" description="eVitals.29 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.29"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.29_General_NV" description="eVitals.29 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.29.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.29_State_Required" description="eVitals.29 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.29"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eVitals.30_General_NV" description="eVitals.30 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.30.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.30_State_Required" description="eVitals.30 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.30"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eVitals.31_PN_NV_Nil" description="eVitals.31 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eVitals.31"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eVitals.31_General_NV" description="eVitals.31 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eVitals.31.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eVitals.31_State_Required" description="eVitals.31 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eVitals.31"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eExam.01_PN_NV_Nil" description="eExam.01 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eExam.01"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eExam.01_General_NV" description="eExam.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eExam.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eExam.01_State_Required" description="eExam.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eExam.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eExam.02_PN_NV_Nil" description="eExam.02 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eExam.02"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eExam.02_General_NV" description="eExam.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eExam.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eExam.02_State_Required" description="eExam.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eExam.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eExam.03_General_NV" description="eExam.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eExam.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eExam.03_State_Required" description="eExam.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eExam.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProtocols.01_General_NV" description="eProtocols.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProtocols.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProtocols.01_State_Required" description="eProtocols.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProtocols.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProtocols.02_General_NV" description="eProtocols.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProtocols.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProtocols.02_State_Required" description="eProtocols.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProtocols.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.01_General_NV" description="eMedications.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.01_State_Required" description="eMedications.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.02_General_NV" description="eMedications.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.02_State_Required" description="eMedications.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eMedications.03_PN_NV_Nil" description="eMedications.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eMedications.03"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eMedications.03_General_NV" description="eMedications.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.03_State_Required" description="eMedications.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.05_General_NV" description="eMedications.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.05_State_Required" description="eMedications.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.06_General_NV" description="eMedications.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.06_State_Required" description="eMedications.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.07_General_NV" description="eMedications.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.07_State_Required" description="eMedications.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.08_General_NV" description="eMedications.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.08_State_Required" description="eMedications.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.09_General_NV" description="eMedications.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.09_State_Required" description="eMedications.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eMedications.10_General_NV" description="eMedications.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eMedications.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eMedications.10_State_Required" description="eMedications.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eMedications.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.01_General_NV" description="eProcedures.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.01_State_Required" description="eProcedures.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.02_General_NV" description="eProcedures.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.02_State_Required" description="eProcedures.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_1" id="eProcedures.03_PN_NV_Nil" description="eProcedures.03 PN/NV/NIL combination not valid">
    <iso:param name="realElem" value="nem:eProcedures.03"/>                                                                
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                 

<iso:pattern is-a="national_2" id="eProcedures.03_General_NV" description="eProcedures.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.03_State_Required" description="eProcedures.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.05_General_NV" description="eProcedures.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.05_State_Required" description="eProcedures.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.06_General_NV" description="eProcedures.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.06_State_Required" description="eProcedures.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.07_General_NV" description="eProcedures.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.07_State_Required" description="eProcedures.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.08_General_NV" description="eProcedures.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.08_State_Required" description="eProcedures.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.09_General_NV" description="eProcedures.09 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.09.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.09_State_Required" description="eProcedures.09 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.09"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.10_General_NV" description="eProcedures.10 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.10.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.10_State_Required" description="eProcedures.10 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.10"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eProcedures.13_General_NV" description="eProcedures.13 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eProcedures.13.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eProcedures.13_State_Required" description="eProcedures.13 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eProcedures.13"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.01_General_NV" description="eAirway.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.01_State_Required" description="eAirway.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.02_General_NV" description="eAirway.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.02_State_Required" description="eAirway.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.03_General_NV" description="eAirway.03 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.03.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.03_State_Required" description="eAirway.03 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.03"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.04_General_NV" description="eAirway.04 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.04.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.04_State_Required" description="eAirway.04 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.04"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.06_General_NV" description="eAirway.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.06_State_Required" description="eAirway.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.07_General_NV" description="eAirway.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.07_State_Required" description="eAirway.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eAirway.08_General_NV" description="eAirway.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eAirway.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eAirway.08_State_Required" description="eAirway.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eAirway.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.01_General_NV" description="eDisposition.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.01_State_Required" description="eDisposition.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.02_General_NV" description="eDisposition.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.02_State_Required" description="eDisposition.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.05_General_NV" description="eDisposition.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.05_State_Required" description="eDisposition.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.06_General_NV" description="eDisposition.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.06_State_Required" description="eDisposition.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.07_General_NV" description="eDisposition.07 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.07.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.07_State_Required" description="eDisposition.07 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.07"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.11_General_NV" description="eDisposition.11 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.11.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.11_State_Required" description="eDisposition.11 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.11"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.16_General_NV" description="eDisposition.16 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.16.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.16_State_Required" description="eDisposition.16 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.16"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.17_General_NV" description="eDisposition.17 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.17.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.17_State_Required" description="eDisposition.17 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.17"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.18_General_NV" description="eDisposition.18 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.18.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.18_State_Required" description="eDisposition.18 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.18"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.19_General_NV" description="eDisposition.19 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.19.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.19_State_Required" description="eDisposition.19 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.19"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.20_General_NV" description="eDisposition.20 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.20.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.20_State_Required" description="eDisposition.20 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.20"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.21_General_NV" description="eDisposition.21 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.21.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.21_State_Required" description="eDisposition.21 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.21"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.22_General_NV" description="eDisposition.22 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.22.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.22_State_Required" description="eDisposition.22 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.22"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.23_General_NV" description="eDisposition.23 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.23.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.23_State_Required" description="eDisposition.23 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.23"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.24_General_NV" description="eDisposition.24 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.24.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.24_State_Required" description="eDisposition.24 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.24"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eDisposition.25_General_NV" description="eDisposition.25 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eDisposition.25.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eDisposition.25_State_Required" description="eDisposition.25 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eDisposition.25"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eOutcome.01_General_NV" description="eOutcome.01 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eOutcome.01.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eOutcome.01_State_Required" description="eOutcome.01 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eOutcome.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eOutcome.02_General_NV" description="eOutcome.02 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eOutcome.02.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eOutcome.02_State_Required" description="eOutcome.02 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eOutcome.02"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eOther.05_General_NV" description="eOther.05 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eOther.05.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eOther.05_State_Required" description="eOther.05 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eOther.05"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eOther.06_General_NV" description="eOther.06 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eOther.06.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eOther.06_State_Required" description="eOther.06 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eOther.06"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

<iso:pattern is-a="national_2" id="eOther.08_General_NV" description="eOther.08 should not have NV when it is not Nil"> 
    <iso:param name="realElem" value="nem:eOther.08.01"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  
<iso:pattern is-a="national_3" id="eOther.08_State_Required" description="eOther.08 is missing NV attribute">           
    <iso:param name="realElem" value="nem:eOther.08"/>                                                                     
    <iso:param name="PREFIX" value="[ERROR] National Schematron Rule Violation"/>                                           
</iso:pattern>                                                                                                                  

</iso:schema>