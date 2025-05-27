/* NEMSIS Case Definition */
/* Motor Vehicle Crash - Pedestrian */
/* May 27, 2025 */
proc sql;
  create table MotorVehicleCrashPedestrianKey as
  select distinct pcrKey from
    (
      select pcrKey from memsis.factPcrCauseOfInjury where prxmatch('/^((V0[2-4](\.[19].*)?)|(V09\.2([019].*)?)|(V09\.3.*))$/', eInjury_01)
    )
  ;
quit;
