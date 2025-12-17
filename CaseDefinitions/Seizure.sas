/* NEMSIS Case Definition */
/* Seizure */
/* December 17, 2025 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table SeizureKey as
  select distinct pcrKey from 
    (
      select pcrKey from nemsis.factPcrPrimarySymptom where prxmatch('/^((F44.5)|(G40)|(P90)|(R56))/', eSituation_09)
      union
      select pcrKey from nemsis.factPcrAdditionalSymptom where prxmatch('/^((F44.5)|(G40)|(P90)|(R56))/', eSituation_10)
      union
      select pcrKey from nemsis.factPcrPrimaryImpression where prxmatch('/^((F44.5)|(G40)|(P90)|(R56))/', eSituation_11)
      union
      select pcrKey from nemsis.factPcrSecondaryImpression where prxmatch('/^((F44.5)|(G40)|(P90)|(R56))/', eSituation_12)
      union
      select pcrKey from nemsis.factPcrProtocol where eProtocol_01 = '9914141'
    )
  ;
quit;
