SELECT record_num

FROM
(SELECT distinct
'b' || bib_view.record_num || 'a' AS record_num,
bib_view.cataloging_date_gmt

FROM
sierra_view.bib_view,
sierra_view.control_field,
sierra_view.bib_record_item_record_link,
sierra_view.item_record

WHERE
bib_view.bcode3 = E'-' --bib status
AND bib_view.id = control_field.record_id 
AND bib_view.language_code = E'spa'
AND ((control_field.control_num = 6 AND control_field.p05 || control_field.p06 = E'g') OR (bib_view.bcode1 = E'g')) --mat type or "Project"
AND bib_view.cataloging_date_gmt IS DISTINCT FROM NULL
AND CAST (bib_view.cataloging_date_gmt AS DATE) < CURRENT_DATE - INTERVAL '1 day'
AND item_record.id = bib_record_item_record_link.item_record_id
AND bib_view.id = bib_record_item_record_link.bib_record_id
ORDER BY bib_view.cataloging_date_gmt desc, record_num desc
limit 200
) AS foo
