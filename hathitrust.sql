-- Hathi Trust records
-- first, the serials!

SELECT distinct
  varfield.field_content as OCLCNUM,
  bib_record.bcode1 AS 	MATTYPE, bib_record.bcode3 as bibstatus
  --, bib_record.bcode2 as bibsource
FROM 
  iiirecord.bib_record, 
  iiirecord.varfield,
  iiirecord.bib_record_holding_record_link
WHERE 
varfield.record_id = bib_record.record_id AND
bib_record.record_id = bib_record_holding_record_link.bib_record_id --should find things with holdings records
AND  (bcode1 = 'a' OR bcode1 = 'c' OR bcode1 = 'd' OR bcode1 = 't')
AND varfield.marc_tag = '001'
AND varfield.field_content ~ '^o'

limit 1000;
