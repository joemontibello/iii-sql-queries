SELECT
  external_fund_property.code_num, 
  external_fund_property_name.name as CHARTSTRING, 
  invoice_record.invoice_number_text,
  invoice_record_line.paid_amt,
  invoice_record.posted_date
FROM 
  sierra_view.external_fund_property,  
  sierra_view.external_fund_property_name, 
  sierra_view.external_fund_property_myuser,
  iiirecord.invoice_record_line, 
  iiirecord.invoice_record
WHERE 
  sierra_view.external_fund_property_myuser.code = external_fund_property.code_num AND
  external_fund_property_name.external_fund_property_id = external_fund_property.id AND
  invoice_record_line.invoice_record_id = invoice_record.record_id and
  iiirecord.invoice_record_line.external_fund_code_num = sierra_view.external_fund_property.code_num and 
invoice_record.invoice_number_text = '10286584'

 ;