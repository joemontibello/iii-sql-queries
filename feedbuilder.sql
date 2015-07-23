SELECT distinct bib_view.record_num FROM 
(SELECT 
  bib_record.id
  --fund_master.code
  
FROM
  sierra_view.bib_record,
  sierra_view.item_record,
  sierra_view.order_record,
  sierra_view.bib_record_item_record_link,
  sierra_view.bib_record_order_record_link,
  sierra_view.order_record_cmf,
  sierra_view.fund_master

WHERE
  bib_record.id = bib_record_item_record_link.bib_record_id
  AND bib_record.id = bib_record_order_record_link.bib_record_id
  AND item_record.id = bib_record_item_record_link.item_record_id
  AND order_record.id = bib_record_order_record_link.order_record_id
  AND order_record_cmf.order_record_id = order_record.id
  AND bib_record.bcode3 = '-' -- bcode3 = BIB STATUS
  AND cast (order_record_cmf.fund_code as integer) = fund_master.code_num
  AND (fund_master.code = 'engr1' or fund_master.code = 'sthay')
ORDER BY bib_record.cataloging_date_gmt desc
) as bibrecid, sierra_view.bib_view
 WHERE bib_view.id = bibrecid.id
limit 200