

SELECT id2reckey(record_id) recnum,
v.marc_tag || ' ' || v.field_content namedfield

FROM 
sierra_view.varfield v JOIN sierra_view.record_metadata r on v.record_id = r.id
 
WHERE
r.record_type_code = 'b'
AND v.marc_tag = '001'
OR v.marc_tag = '003'

ORDER by namedfield