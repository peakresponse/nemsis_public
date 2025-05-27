/* NEMSIS Case Definition */
/* Motor Vehicle Crash - Pedal Cycle */
/* May 27, 2025 */
proc sql;
  create table MotorVehicleCrashPedalCycleKey as
  select distinct pcrKey from
    (
      select pcrKey from memsis.factPcrCauseOfInjury where prxmatch('/^((V12(\.[345].*)?)|(V13(\.[3459].*)?)|(V14(\.[3459].*)?)|(V19\.4([09].*)?)|(V19\.5([09].*)?)|(V19\.6([09].*)?)|(V19\.9.*)|(V22\.[3459]1.*)|(V23\.[3459]1.*)|(V24\.[3459]1.*)|(V29\.[456][09]1.*)|(V29\.91.*))$/', eInjury_01)
    )
  ;
quit;
