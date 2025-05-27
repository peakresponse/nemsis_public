xquery version '1.0';
declare default element namespace 'http://www.nemsis.org';
(: NEMSIS Case Definition :)
(: Motor Vehicle Crash - Car, Truck, or Bus :)
(: May 27, 2025 :)
for
  $dataset in doc('/path/to/EMSDataSetDocument.xml')
let
  $records := $dataset/EMSDataSet/Header/PatientCareReport
  [
    eInjury/eInjury.01[matches(., '^((V[3-7][0-8](\.[45679].*)?)|(V[3-7]9(\.[45689].*)?)|(V8[3-6](\.[0-3].*)?)|(V87(\.[0-8].*)?)|(V89\.2.*)|(X82(\.[0128].*)?)|(Y02\.0.*)|(Y03\.[08].*))$')]
  ]
return
  count($records)
