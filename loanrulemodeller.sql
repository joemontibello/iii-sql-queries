SELECT distinct
  circ_loan_rule.loan_rule_num,
  circ_loan_rule_name.name as loan_rule_name,
  circ_loan_rule_determiner.display_order as determiner_order
FROM 
  public.circ_loan_rule, 
  public.circ_loan_rule_determiner, 
  public.circ_loan_rule_determiner_itype_property,
  public.circ_loan_rule_determiner_location, 
  public.circ_loan_rule_determiner_ptype_property, 
  public.circ_loan_rule_name,
  public.location,
  public.location_name,
  public.itype_property_name,
  public.itype_property,
  public.ptype,
  public.ptype_desc,
  public.branch,
  public.branch_name
WHERE 
  branch_name.branch_id = branch.id 
  AND location.branch_code_num = branch.code_num 
  AND circ_loan_rule_determiner_location.location_id = location.id
  AND circ_loan_rule_determiner_location.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id 
  AND ptype_desc.ptype_id = ptype.id 
  AND itype_property_name.itype_property_id = itype_property.id 
  AND circ_loan_rule_determiner.loan_rule_id = circ_loan_rule.id 
  AND itype_property.id = circ_loan_rule_determiner_itype_property.itype_property_id 
  AND circ_loan_rule_determiner_itype_property.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id 
  AND ptype.id = circ_loan_rule_determiner_ptype_property.ptype_property_id
  AND circ_loan_rule_determiner_ptype_property.circ_loan_rule_determiner_id = circ_loan_rule_determiner.id 
  AND circ_loan_rule_name.loan_rule_id = circ_loan_rule.id
  AND circ_loan_rule_determiner_location.location_id = location.id
  AND circ_loan_rule_determiner_itype_property.itype_property_id = itype_property.id

  AND ptype.value = '1'
  AND itype_property.code_num = '0'
  AND location.code ='bmaj'
  
  ORDER BY determiner_order DESC NULLS LAST
  LIMIT 1;
  
