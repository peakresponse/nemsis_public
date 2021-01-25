@echo off
rem Windows batch file to configure paths to programs used in the Schematron Development Kit

rem Version: 3.5.0.191130CP1_210121
rem Revision Date: January 21, 2021

rem This product is provided by the NEMIS TAC, without charge, to facilitate development
rem of NEMSIS Schematron schemas.

rem Update the paths to these programs to reflect their actual location

rem Jing is used for RelaxNG validation of Schematron schemas
rem https://relaxng.org/jclark/jing.html

set jing="C:\Program Files\Jing-Trang\jing-20091111\bin\jing.jar"

rem Saxon is used for XSL transformations (the method used for implementing Schematron validation of 
rem NEMSIS XML documents)
rem https://www.saxonica.com/

set saxon="C:\Program Files\Saxonica\Saxon9HE\Saxon9he.jar"

rem xmllint (from the LibXML2 package) is used for XML Schema (XSD) validation of NEMSIS XML documents
rem http://xmlsoft.org/

set xmllint="C:\Program Files\xmlsoft\libxml2\bin\xmllint"
