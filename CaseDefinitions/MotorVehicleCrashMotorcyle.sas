/* NEMSIS Case Definition */
/* Motor Vehicle Crash - Motorcycle */
/* May 27, 2025 */
proc sql;
  create table MotorVehicleCrashMotorcycleKey as
  select distinct pcrKey from
    (
      select pcrKey from memsis.factPcrCauseOfInjury where prxmatch('/^((V2[0-8](\.[3459](9.*)?)?)|(V29(\.[456]([09](8.*)?)?)?)|(V29\.8([18](8.*)?)?)|(V29\.9(9.*)?))$/', eInjury_01)
    )
  ;
quit;
