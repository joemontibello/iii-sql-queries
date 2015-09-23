SELECT distinct
'b' || bib_view.record_num || 'a' AS record_num,
bib_view.cataloging_date_gmt

FROM
sierra_view.bib_view,
sierra_view.order_view,
sierra_view.bib_record_order_record_link,
sierra_view.order_record_cmf,
sierra_view.fund_master
WHERE
bib_view.id = bib_record_order_record_link.bib_record_id
AND order_view.id = bib_record_order_record_link.order_record_id
AND bib_view.bcode3 = '-'
AND order_view.id = order_record_cmf.order_record_id
AND cast (order_record_cmf.fund_code AS INTEGER) = fund_master.code_num
AND (fund_master.code = 'hscix' OR fund_master.code = 'shsci')
--AND bib_view.cataloging_date_gmt > current_timestamp - interval '720 hours'

ORDER BY record_num DESC

LIMIT 200
