SELECT marc_tag, record_type_code, count(marc_tag)
FROM 
sierra_view.varfield_view 
WHERE 
(record_type_code = 'b' OR record_type_code = 'i' or record_type_code = 'o' or record_type_code = 'c')
AND marc_tag IS DISTINCT FROM NULL
GROUP BY marc_tag, record_type_code
ORDER BY marc_tag
