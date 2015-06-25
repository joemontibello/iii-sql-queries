SELECT 
--  bib_record.record_id as bid, -- We need this id to connect bib_record to record_metadata
  '.b' || record_metadata.record_num || 'a' as bnum,  -- I added in the '.b' at the beginning and 'a' (in place of the check digit) at the end so it looks more like a normal bib rec number. 
  bib_record_location.location_code as bloc,
--  bib_record_location.display_order, -- we need this value because (I think) we want the first bib location listed. In records I checked, "multi" was the first displayed bib location
--  order_record.record_id as oid, - We need this id to connect bib_record through order_record to order_record_cmf
  order_record_cmf.copies,
  order_record_cmf.location_code || '(' || order_record_cmf.copies || ')' as LocCopy, -- concatenating fields to format the column's data
  varfield.field_content as varcontent -- this is the data from whatever field is specified in the last line of the where statements (z field or n field)
  
FROM
  sierra_view.bib_record, -- the bib record
  sierra_view.record_metadata, -- has record_num that we need for the lookup
  sierra_view.bib_record_location, --bib location field
  sierra_view.order_record, -- needed to connect to order_record_cmf
  sierra_view.bib_record_order_record_link, --connects bib and order records
  sierra_view.order_record_cmf, -- has the location/copy data we want
  sierra_view.varfield --has the (z or n) field 
WHERE
  bib_record.record_id = record_metadata.id
  and record_metadata.record_type_code = 'b'
--  and record_metadata.record_num = '4451800'
  and bib_record_location.bib_record_id = bib_record.record_id
  and bib_record_location.display_order = '0'
  and bib_record_order_record_link.bib_record_id = bib_record.record_id
  and bib_record_order_record_link.order_record_id = order_record.record_id 
  and order_record_cmf.order_record_id = order_record.record_id
  and varfield.record_id = order_record.record_id
  and varfield.varfield_type_code = 'n' -- change to 'z' for Eddie's original question. If the (z or n) field is empty the query doesn't return a record.
  and order_record.order_status_code = 'o'
