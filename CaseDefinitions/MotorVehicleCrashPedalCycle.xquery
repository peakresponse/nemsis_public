xquery version '1.0';
declare default element namespace 'http://www.nemsis.org';
(: NEMSIS Case Definition :)
(: Motor Vehicle Crash - Pedal Cycle :)
(: August 26, 2021 :)
for
  $dataset in doc('/path/to/EMSDataSetDocument.xml')
let
  $records := $dataset/EMSDataSet/Header/PatientCareReport
  [
    eInjury/eInjury.01[matches(., '^(V12)|(V12\.3.*)|(V12\.4.*)|(V12\.5.*)|(V12\.9.*)|(V13)|(V13\.3.*)|(V13\.4.*)|(V13\.5.*)|(V13\.9.*)|(V14)|(V14\.3.*)|(V14\.4.*)|(V14\.5.*)|(V14\.9.*)|(V19\.4)|(V19\.40.*)|(V19\.49.*)|(V19\.5)|(V19\.50.*)|(V19\.59.*)|(V19\.6)|(V19\.60.*)|(V19\.69.*)|(V19\.9.*)$')]
  ]
return
  count($records)
