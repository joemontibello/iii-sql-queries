SELECT id2reckey(item_record.id)

FROM
sierra_view.item_record JOIN sierra_view.varfield on item_record.id = varfield.record_id

WHERE
varfield_type_code = 'r'
AND field_content LIKE '%RESERVE%'
