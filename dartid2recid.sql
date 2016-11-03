-- given the "Univ Id" number, look up the patron record id.

SELECT
patron_record.id
FROM
sierra_view.patron_record,
sierra_view.varfield
WHERE
patron_record.id = varfield.record_id
AND varfield_type_code = 'u'
AND varfield.field_content ILIKE '35915a'
