
SELECT distinct
  bib_record.record_id
FROM 
  sierra_view.bib_record,
  sierra_view.varfield
  -- sierra_view.bib_record_item_record_link, 
--   sierra_view.item_view
WHERE 
  bib_record.record_id > 6104293 and
  (
  (varfield.record_id = bib_record.record_id)
  OR
  (to_char((date (bib_record.cataloging_date_gmt)), 'YYMMDD') > to_char((date 'now'), 'YYMMDD') AND
  --bib_record_item_record_link.bib_record_id = bib_view.id AND
  bib_record.bcode2 != 'g' AND 
  bib_record.bcode3 != 'b'))
LIMIT 2  ;
