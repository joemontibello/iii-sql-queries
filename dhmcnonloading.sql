SELECT id2reckey(pr.id) 

FROM
sierra_view.patron_record pr JOIN varfield v on pr.id = v.record_id
WHERE
pr.pcode1 = 'h'
AND v.varfield_type_code = 'l'
AND v.field_content IS DISTINCT FROM NULL 
AND 'Employee' || to_char(current_timestamp, 'YYYYMMDD') != field_content