xquery version '1.0';
declare default element namespace 'http://www.nemsis.org';
(: NEMSIS Case Definition :)
(: Motor Vehicle Crash - Pedestrian :)
(: May 27, 2025 :)
for
  $dataset in doc('/path/to/EMSDataSetDocument.xml')
let
  $records := $dataset/EMSDataSet/Header/PatientCareReport
  [
    eInjury/eInjury.01[matches(., '^((V0[2-4](\.[19].*)?)|(V09\.2([019].*)?)|(V09\.3.*))$')]
  ]
return
  count($records)
