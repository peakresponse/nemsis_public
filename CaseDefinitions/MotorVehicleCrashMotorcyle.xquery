xquery version '1.0';
declare default element namespace 'http://www.nemsis.org';
(: NEMSIS Case Definition :)
(: Motor Vehicle Crash - Motorcycle :)
(: May 27, 2025 :)
for
  $dataset in doc('/path/to/EMSDataSetDocument.xml')
let
  $records := $dataset/EMSDataSet/Header/PatientCareReport
  [
    eInjury/eInjury.01[matches(., '^((V2[0-8](\.[3459](9.*)?)?)|(V29(\.[456]([09](8.*)?)?)?)|(V29\.8([18](8.*)?)?)|(V29\.9(9.*)?))$')]
  ]
return
  count($records)
