select item_view.barcode
FROM
sierra_view.item_view 
LEFT JOIN sierra_view.varfield ON item_view.id = varfield.record_id

WHERE
item_view.location_code LIKE '_x%'
AND varfield.marc_tag = '950'
AND varfield.varfield_type_code = 's'
AND varfield.field_content = '|s'