SELECT distinct
'b' || bib_view.record_num || 'a' as record_num

FROM
sierra_view.bib_view,
sierra_view.control_field

WHERE
bib_view.bcode3 = '-' --bib status
AND bib_view.id = control_field.record_id 
AND bib_view.language_code = 'spa'
AND ((control_field.control_num = '6' AND control_field.p05 = 'g') OR (bib_view.bcode1 = 'g')) --mat type

ORDER BY record_num