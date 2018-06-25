--rewritten for use without elevated privilege 5/25/2016.
--time to run query: 21s
--rows returned: 41038
--would need to include varfields from item and holdings records in order to provide	"enumeration chronology information."
SELECT
  distinct varfield.field_content,
  id2reckey(bib_record.id) as record_num
FROM 
  sierra_view.bib_record
  join sierra_view.varfield on bib_record.id = varfield.record_id 
  join sierra_view.leader_field on leader_field.record_id = bib_record.id
  join sierra_view.bib_record_item_record_link on bib_record.id = bib_record_item_record_link.bib_record_id
  join sierra_view.bib_record_holding_record_link on bib_record.id = bib_record_holding_record_link.bib_record_id,
  sierra_view.item_record,
  sierra_view.holding_record,
  sierra_view.holding_record_location
WHERE 
  item_record.id = bib_record_item_record_link.item_record_id
  AND holding_record.id = bib_record_holding_record_link.holding_record_id
  AND holding_record.id = holding_record_location.holding_record_id
  AND (item_record.item_status_code = 'h' OR holding_record_location.location_code != 'none')
  AND (leader_field.record_type_code = 'a' --bib rec type = a
  AND leader_field.bib_level_code = 'm') --bib levl = m
  AND bib_record.bcode3 ~ '[-adjmwxz]' -- bib status not within c-g or i-l or n-w
  AND bib_record.bcode1 = 'a' -- bib mat type = a
  AND bib_record.bcode2 ~ '[dnopr]' -- bib source not within c and g.
  AND varfield.marc_tag = '001'
  AND (varfield.field_content NOT ILIKE 'b%' AND varfield.field_content NOT ILIKE 'r%' AND varfield.field_content NOT ILIKE 's%' AND varfield.field_content NOT ILIKE 'e%' AND varfield.field_content NOT LIKE '%-%')
  AND EXISTS (	Select 1 
		from sierra_view.varfield 
		where
		varfield.marc_tag = '300' 
		and not (varfield.field_content ~ '%p.%' OR varfield.field_content ~ '%pages%')
		and varfield.record_id = bib_record.id)
ORDER BY field_content;