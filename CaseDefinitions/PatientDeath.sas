/* NEMSIS Case Definition */
/* Patient Death */
/* May 27, 2025 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table PatientDeathKey as
  select distinct pcrKey from 
    (
      select pcrKey from nemsis.pub_pcrEvents 
        where eScene_08 = '2708009'
        or eSituation_13 = '2813007'
        or eDisposition_12 in ('4212013', '4212015', '4212017', '4212019')
        or eDisposition_19 in ('4219007', '4219009')
        or eDisposition_21 = '4221009'
        or eArrest_18 = '3018003'
        or eArrest_16 in ('3016001', '3016005')
      union
      select pcrKey from nemsis.factPcrArrestResuscitation where eArrest_03 in ('3003007', '3003009')
      union
      select pcrKey from nemsis.FactPcrArrestRosc where eArrest_12 = '3012001'
      union
      select pcrKey from nemsis.factPcrArrestRhythmDestination where eArrest_17 = ('9901001', '9901003', '9901035', '9901067', '9901071')
      union
    	select pcrKey from nemsis.factPcrPrimarySymptom where eSituation_09 = 'R99'
      union
    	select pcrKey from nemsis.factPcrAdditionalSymptom where eSituation_10 = 'R99'
      union
    	select pcrKey from nemsis.factPcrPrimaryImpression where eSituation_11 = 'R99'
      union
    	select pcrKey from nemsis.factPcrSecondaryImpression where eSituation_12 = 'R99'
    )
  ;
quit;
