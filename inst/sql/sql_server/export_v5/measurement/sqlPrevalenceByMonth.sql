select c1.concept_id as CONCEPT_ID,  --all rows for all concepts, but you may split by conceptid
	c1.concept_name as CONCEPT_NAME,
	num.stratum_2 as X_CALENDAR_MONTH,   -- calendar year, note, there could be blanks
	round(1000*(1.0*num.count_value/denom.count_value),5) as Y_PREVALENCE_1000PP  --prevalence, per 1000 persons
from 
	(select * from @results_database_schema.ACHILLES_results where analysis_id = 1802) num
	inner join
	(select * from @results_database_schema.ACHILLES_results where analysis_id = 117) denom on num.stratum_2 = denom.stratum_1  --calendar year
	inner join @cdm_database_schema.concept c1 on num.stratum_1 = CAST(c1.concept_id as VARCHAR)

