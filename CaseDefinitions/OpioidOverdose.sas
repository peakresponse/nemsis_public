/* NEMSIS Case Definition */
/* Opioid Overdose */
/* May 27, 2025 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table OpioidOverdoseKey as
  select distinct pcrKey from
    (
      select pcrKey from nemsis.factPcrPrimarySymptom where prxmatch('/^(F11.*)|(T40\.[0-3]X?[1-4]?A?)|(T40\.4.?[1-4]?A?)|(T40\.6[09]?[1-4]?A?)$/', eSituation_09)
      union
      select pcrKey from nemsis.factPcrAdditionalSymptom where prxmatch('/^(F11.*)|(T40\.[0-3]X?[1-4]?A?)|(T40\.4.?[1-4]?A?)|(T40\.6[09]?[1-4]?A?)$/', eSituation_10)
      union
      select pcrKey from nemsis.factPcrPrimaryImpression where prxmatch('/^(F11.*)|(T40\.[0-3]X?[1-4]?A?)|(T40\.4.?[1-4]?A?)|(T40\.6[09]?[1-4]?A?)$/', eSituation_11)
      union
      select pcrKey from nemsis.factPcrSecondaryImpression where prxmatch('/^(F11.*)|(T40\.[0-3]X?[1-4]?A?)|(T40\.4.?[1-4]?A?)|(T40\.6[09]?[1-4]?A?)$/', eSituation_12)
      union
      select pcrKey from nemsis.factPcrMedication where eMedications_03 in ('7242', '203192', '197117') and eMedications_07 = '9916001'
    )
  ;
quit;
