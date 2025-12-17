/* NEMSIS Case Definition */
/* STEMI */
/* December 17, 2025 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table StemiKey as
  select distinct pcrKey from
    (
      select pcrKey from nemsis.factPcrPrimarySymptom where prxmatch('/^((I21.0)|(I21.1)|(I21.2)|(I21.3))/', eSituation_09)
      union
      select pcrKey from nemsis.factPcrAdditionalSymptom where prxmatch('/^((I21.0)|(I21.1)|(I21.2)|(I21.3))/', eSituation_10)
      union
      select pcrKey from nemsis.factPcrPrimaryImpression where prxmatch('/^((I21.0)|(I21.1)|(I21.2)|(I21.3))/', eSituation_11)
      union
      select pcrKey from nemsis.factPcrSecondaryImpression where prxmatch('/^((I21.0)|(I21.1)|(I21.2)|(I21.3))/', eSituation_12)
      union
      select pcrKey from nemsis.factPcrVital where pcrVitalKey in
        (
          select vitalKey from nemsis.pcrVitalEcgGroup where eVitals_03 in ('9901051', '9901053', '9901055', '9901057')
        )
      union
      select pcrKey from nemsis.factPcrVital where pcrVitalKey in
        (
          select vitalKey from nemsis.pcrVitalEcgGroup where eVitals_03 = '9901021'
        )
        and pcrKey in
        (
          select pcrKey from nemsis.factPcrPrimarySymptom where eSituation_09 in ('I21', 'I20.0', 'I20.9')
          union
          select pcrKey from nemsis.factPcrAdditionalSymptom where eSituation_10 in ('I21', 'I20.0', 'I20.9')
          union
          select pcrKey from nemsis.factPcrPrimaryImpression where eSituation_11 in ('I21', 'I20.0', 'I20.9')
          union
          select pcrKey from nemsis.factPcrSecondaryimpression where eSituation_12 in ('I21', 'I20.0', 'I20.9')
        )
      union
      select pcrKey from nemsis.factPcrProtocol where eProtocol_01 = '9914143'
      union
      select pcrKey from nemsis.factPcrDestinationTeam where eDisposition_24 = '4224013'
    )
  ;
quit;
