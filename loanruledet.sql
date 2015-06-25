
    DECLARE 
		patron_age integer;
		loanrule_number integer;
    BEGIN
	SELECT
		CASE
			WHEN patron_bdate IS NULL
				THEN null
			ELSE
				date_part('year', age(date(patron_bdate))) 
		END
		INTO patron_age;
	SELECT loanrule.loan_rule_num --, clrd.display_order, loanrule_name.name 
	FROM public.circ_loan_rule loanrule
	JOIN public.circ_loan_rule_determiner clrd
		ON clrd.loan_rule_id = loanrule.id
	JOIN public.circ_loan_rule_name loanrule_name
		ON loanrule_name.loan_rule_id = loanrule.id
	JOIN public.circ_loan_rule_determiner_itype_property clrd_itype
		ON clrd_itype.circ_loan_rule_determiner_id = clrd.id
	JOIN public.circ_loan_rule_determiner_ptype_property clrd_ptype
		ON clrd_ptype.circ_loan_rule_determiner_id = clrd.id
	JOIN public.circ_loan_rule_determiner_location clrd_location
		ON clrd_location.circ_loan_rule_determiner_id = clrd.id
	LEFT JOIN public.location AS location ON location.code = trim(item_location)
	LEFT JOIN public.itype_property AS itype ON itype.code_num = item_itype
	LEFT JOIN public.ptype AS ptype ON ptype.value = patron_ptype
	WHERE
	loanrule.period_uom != -1 -- No loanrule code to test as in the c-code
	AND loanrule.is_holdable = true
	AND clrd.is_active = true
	AND clrd_ptype.ptype_property_id = ptype.id
	AND clrd_itype.itype_property_id = itype.id
	AND clrd_location.location_id = location.id
	AND (
		CASE 
			WHEN patron_age IS NULL
				THEN true
			WHEN clrd.age_from = 0 AND clrd.age_to = 0
				THEN true
				WHEN (patron_age >= clrd.age_from AND patron_age <= clrd.age_to)
				THEN true
			ELSE false
		END
	)
	ORDER BY clrd.display_order DESC -- ruledet is read in reverse order
	LIMIT 1
	INTO loanrule_number;
	
	RETURN loanrule_number;
	END
    
