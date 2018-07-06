--query adjusted to run without elevated privilege 5/25/2016.
--time to run query: 26s
--rows returned: 46161 
SELECT
  distinct varfield.field_content,
  id2reckey(bib_record.id)
FROM 
  sierra_view.bib_record 
  inner join sierra_view.varfield on bib_record.id = varfield.record_id 
  inner join sierra_view.leader_field on leader_field.record_id = bib_record.id
WHERE 
  leader_field.bib_level_code = 's'
  AND bib_record.bcode3 ~ '[-adhijklmwxyz]' -- bib status 
  AND bib_record.bcode1 ~ '[at]' -- bib mat type
  AND varfield.marc_tag = '001'
  AND (varfield.field_content NOT ILIKE 'b%' AND varfield.field_content NOT ILIKE 'r%' AND varfield.field_content NOT ILIKE 's%' AND varfield.field_content NOT LIKE '%-%')
  AND bib_record.cataloging_date_gmt is not null -- cat date not blank
ORDER BY field_content
 ;