SELECT 
  bib_record.id

FROM
  sierra_view.bib_record,
  sierra_view.item_record,
  sierra_view.order_record,
  sierra_view.bib_record_item_record_link,
  sierra_view.bib_record_order_record_link  

WHERE
  bib_record.id = bib_record_item_record_link.bib_record_id
  AND bib_record.id = bib_record_order_record_link.bib_record_id
  AND item_record.id = bib_record_item_record_link.item_record_id
  AND order_record.id = bib_record_order_record_link.order_record_id
  AND order_record_cmf.order_record_id = order_record.id
  AND bib_record.bcode3 = '-' -- bcode3 = BIB STATUS
