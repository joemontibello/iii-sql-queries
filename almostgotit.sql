SELECT 
  order_record_cmf.fund_code, 
  order_record_cmf.order_record_id, 
  bib_view.title
FROM 
  sierra_view.order_record_cmf, 
  sierra_view.fund_master, 
  sierra_view.order_record, 
  sierra_view.bib_record_order_record_link, 
  sierra_view.bib_view
WHERE 
  CAST (order_record_cmf.fund_code AS INTEGER) = fund_master.code_num AND
  order_record.record_id = order_record_cmf.order_record_id AND
  order_record.record_id = bib_record_order_record_link.order_record_id AND
  bib_record_order_record_link.bib_record_id = bib_view.id AND
  fund_master.code LIKE '1920';
