/* NEMSIS Case Definition */
/* Cardiac Arrest */
/* April 28, 2022 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table CardiacArrestKey as
  select distinct pcrKey from
    (
      (
        select pcrKey from nemsis.factPcrPrimarySymptom where substr(eSituation_09,1,3) = 'I46'
        union
        select pcrKey from nemsis.factPcrAdditionalSymptom where substr(eSituation_10,1,3) = 'I46'
        union
        select pcrKey from nemsis.factPcrPrimaryImpression where substr(eSituation_11,1,3) = 'I46'
        union
        select pcrKey from nemsis.factPcrSecondaryImpression where substr(eSituation_12,1,3) = 'I46'
      )
      intersect
      (
        select pcrKey from nemsis.pub_pcrEvents where eArrest_01 = '3001003' and eArrest_02 in ('3002001', '')
        union
        select pcrKey from nemsis.pub_pcrEvents where eArrest_01 = '3001005' and eArrest_02 = '3002001'
      )
    )
  ;
quit;
