SELECT 
  bib_record.record_id,
  record_metadata.record_num
FROM
  sierra_view.bib_record,
  sierra_view.record_metadata
WHERE
  bib_record.record_id = record_metadata.id
  and record_metadata.record_type_code = 'b'
  and record_metadata.record_num = '4451800'