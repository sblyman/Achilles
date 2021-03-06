select c1.concept_id as concept_id,
	num.stratum_2 as x_calendar_month,
	round(1000*(1.0*num.count_value/denom.count_value),5) as y_prevalence_1000pp
from 
	(select * from @results_database_schema.ACHILLES_results where analysis_id = 902) num
	inner join
	(select * from @results_database_schema.ACHILLES_results where analysis_id = 117) denom
	on num.stratum_2 = denom.stratum_1  
	inner join
	@cdm_database_schema.concept c1
	on num.stratum_1 = CAST(c1.concept_id as VARCHAR)
