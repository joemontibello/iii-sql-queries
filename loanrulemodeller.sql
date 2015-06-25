--usually runs in about 1 minute first run, 20 seconds subsequently
--estimate above based on cost of 758k
--estimate above is on the higher end. Early runs were limited to 50 rows.
--later iterations, eventually unlimited, running in about 20 seconds.
SELECT distinct 
  circ_loan_rule_determiner.display_order,
  circ_loan_rule_determiner_location.location_id,
  circ_loan_rule_determiner_ptype_property.ptype_property_id,
  circ_loan_rule.loan_rule_num

FROM 
  public.circ_loan_rule, 
  public.circ_loan_rule_determiner, 
  public.circ_loan_rule_determiner_itype_property, 
  public.circ_loan_rule_determiner_location, 
  public.circ_loan_rule_determiner_ptype_property, 
  public.circ_loan_rule_name
WHERE 
  circ_loan_rule_determiner.loan_rule_id = circ_loan_rule.id AND
  circ_loan_rule_determiner_itype_property.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id AND
  circ_loan_rule_determiner_location.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id AND
  circ_loan_rule_determiner_ptype_property.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id AND
  circ_loan_rule_name.loan_rule_id = circ_loan_rule.id
order by loan_rule_num
--Limit 50000;
