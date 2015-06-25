 --requires privileged account to access iiirecord schema.
select * from (
SELECT
    varfield.field_content,
  'b' || record_metadata.record_num as record_num
--  bib_record_property.bib_level_code,
--  bib_record_view.bcode1 as mat_type,
--  bib_record_view.bcode2 as source,
--  bib_record_view.bcode3 as bib_status,
--  bib_record_view.cataloging_date
 
FROM 
  iiirecord.bib_record
  inner join iiirecord.record_metadata on bib_record.id = record_metadata.id
  inner join iiirecord.varfield on bib_record.id = varfield.record_id 
  inner join iiirecord.bib_record_property on bib_record_property.bib_record_id = bib_record.id
  inner join iiirecord.leader_field on leader_field.record_id = bib_record.id
WHERE 
  leader_field.bib_level_code = 'm'
  AND bib_record.bcode3 ~ '[-ahijklmxyz]' -- bib status not within b-g and not within n-w
  AND bib_record.bcode1 ~ '[at]' -- bib mat type = (a or t)
  AND bib_record.bcode2 ~ '[^cg]' -- bib source not c or g.
  AND varfield.marc_tag = '001'
  AND varfield.field_content ~ '^o'
  AND bib_record.cataloging_date is not null -- add cat date not blank
  )
	as foo
--  order by record_num
 ;