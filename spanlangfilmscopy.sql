select bib_view.record_num, recids.cataloging_date_gmt, title
from 
sierra_view.bib_view,
sierra_view.bib_record_item_record_link,
sierra_view.item_record,
(( 
( SELECT DISTINCT(bib_record.id) AS recid, bib_record.cataloging_date_gmt 
 FROM sierra_view.bib_record JOIN sierra_view.control_field cf ON sierra_view.bib_record.id = cf.record_id 
 WHERE cf.control_num = 6 AND p05 || p06 = E'g'
 UNION (SELECT DISTINCT(sierra_view.bib_record.id) AS recid, bib_record.cataloging_date_gmt 
 FROM sierra_view.bib_record 
 WHERE sierra_view.bib_record.bcode1 = E'g' 
 ) ) 
 
 INTERSECT (SELECT DISTINCT(bib_record.id) AS recid, bib_record.cataloging_date_gmt 
 FROM sierra_view.bib_record
 WHERE bib_record.language_code = E'spa' 
  AND  bib_record.bcode3 = E'-' ) )) AS recids

WHERE bib_view.id = recids.recid
AND recids.cataloging_date_gmt IS DISTINCT FROM NULL
AND CAST (recids.cataloging_date_gmt AS DATE) < CURRENT_DATE - INTERVAL '1 day'
AND bib_view.id = bib_record_item_record_link.bib_record_id
AND item_record.id = bib_record_item_record_link.item_record_id

ORDER BY recids.cataloging_date_gmt desc, record_num desc

LIMIT 200
