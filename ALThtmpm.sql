 --requires privileged account to access iiirecord schema.
--select * from (
--Stuck on pulling the 001 with ^o at the same time as marc_tag=300 and field_content Doesn't have p in it...
SELECT distinct
  varfield.field_content,
  -- case when varfield.marc_tag = '001' then varfield.field_content else NULL end as ocnum,
  'b' || record_metadata.record_num as record_num
--  bib_record_view.bcode1 as mat_type,
--  bib_record_view.bcode2 as source,
--  bib_record_view.bcode3 as bib_status,
--  bib_record_view.cataloging_date
FROM 
  (select * from iiirecord.bib_record where 
  --bib_record.bcode3 ~ '[^cdefgijklnopqrstuvw]' -- bib status not within c-g or i-l or n-w
  bib_record.bcode3 in ('-','h','m','u','x')
  AND bib_record.bcode1 = 'a' -- bib mat type = a
  ) as bib_record
  --iiirecord.bib_record
  join iiirecord.record_metadata on bib_record.id = record_metadata.id AND record_metadata.record_type = 'b'
  join (select * from iiirecord.varfield where (varfield.marc_tag = '001' or varfield.marc_tag = '300')) as varfield on varfield.record_id = bib_record.id 
  join iiirecord.leader_field on leader_field.record_id = bib_record.id
  join iiirecord.bib_record_item_record_link on bib_record.id = bib_record_item_record_link.bib_record_id
  join iiirecord.bib_record_holding_record_link on bib_record.id = bib_record_holding_record_link.bib_record_id,
  iiirecord.item_record,
  iiirecord.holding_record,
  iiirecord.holding_record_location
WHERE 
  item_record.id = bib_record_item_record_link.item_record_id
  AND holding_record.id = holding_record_location.holding_record_id
  AND (item_record.status = 'h' OR holding_record_location.location_code != 'none')
  AND leader_field.record_type_code = 'a' --bib rec type = a
  AND leader_field.bib_level_code = 'm'--bib levl = m
--   AND bib_record.bcode3 ~ '[^cdefgijklnopqrstuvw]' -- bib status not within c-g or i-l or n-w
--   AND bib_record.bcode1 = 'a' -- bib mat type = a
--   AND bib_record.bcode2 ~ '[^cdefg]' -- bib source not within c and g.
-- AND bib_record.bcode2 not in ('c','d','e','f','g')
  AND (varfield.marc_tag = '001' AND (varfield.field_content ~ '^o' OR varfield.field_content ~ '^[\d]+$'))
  AND EXISTS (	Select 1 
		from iiirecord.varfield 
		where
		varfield.marc_tag = '300' 
		and not varfield.field_content like 'p'
		and varfield.record_id = bib_record.id)
 --AND -- (item status = h or checkin loc != 'none')
