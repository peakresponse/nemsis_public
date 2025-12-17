/* NEMSIS Case Definition */
/* Stroke */
/* December 17, 2025 */
/* The NEMSIS public release research dataset does not include the Pertinent Negative attribute on 
   eSituation.10 - Other Associated Symptoms, which was added in NEMSIS version 3.5, so the SAS 
   code will select some records where a symptom was actually documented as "Symptom Not Present." 
   This is estimated to affect less than 3% of v3.5 records. */
proc sql;
  create table StrokeKey as
  select distinct pcrKey from
    (
      select pcrKey from nemsis.factPcrPrimarySymptom where prxmatch('/^((G45)|(G46)|(I60)|(I61)|(I63))/', eSituation_09)
      union
      select pcrKey from nemsis.factPcrAdditionalSymptom where prxmatch('/^((G45)|(G46)|(I60)|(I61)|(I63))/', eSituation_10)
      union
      select pcrKey from nemsis.factPcrPrimaryImpression where prxmatch('/^((G45)|(G46)|(I60)|(I61)|(I63))/', eSituation_11)
      union
      select pcrKey from nemsis.factPcrSecondaryImpression where prxmatch('/^((G45)|(G46)|(I60)|(I61)|(I63))/', eSituation_12)
      union
      select pcrKey from nemsis.factPcrVital where eVitals_29 ='3329005'
      union
      select pcrKey from nemsis.factPcrProtocol where eProtocol_01 = '9914145'
      union
      select pcrKey from nemsis.factPcrDestinationTeam where eDisposition_24 = '4224015'
    )
  ;
quit;
