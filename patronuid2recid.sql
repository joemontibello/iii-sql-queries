SELECT 
  patron_record.id
FROM 
  sierra_view.patron_record,
  sierra_view.varfield
WHERE 
  varfield.record_id = patron_record.id AND
  varfield.varfield_type_code = 'u' AND
  varfield.field_content ILIKE '35915a'
  
