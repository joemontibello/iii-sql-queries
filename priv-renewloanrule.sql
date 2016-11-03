-- Requires elevated permissions - I'm using the "write access" login
-- Replace '81' with the loanrule number extracted from the item record via the API.
-- Returns number of renewals allowed.

SELECT 
circ_loan_rule.max_renewal_num

FROM
public.circ_loan_rule

WHERE
circ_loan_rule.loan_rule_num = '81'