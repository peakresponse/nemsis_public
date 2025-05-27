/* NEMSIS Case Definition */
/* Motor Vehicle Crash - Car, Truck, or Bus */
/* May 27, 2025 */
proc sql;
  create table MotorVehicleCrashCarTruckBusKey as
  select distinct pcrKey from
    (
      select pcrKey from memsis.factPcrCauseOfInjury where prxmatch('/^((V[3-7][0-8](\.[45679].*)?)|(V[3-7]9(\.[45689].*)?)|(V8[3-6](\.[0-3].*)?)|(V87(\.[0-8].*)?)|(V89\.2.*)|(X82(\.[0128].*)?)|(Y02\.0.*)|(Y03\.[08].*))$/', eInjury_01)
    )
  ;
quit;
