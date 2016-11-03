select 
--id2reckey(bib_record_item_record_link.bib_record_id),
--id2reckey(bib_record_order_record_link.order_record_id),
--id2reckey(bib_record_item_record_link.item_record_id),
vb.field_content Title,
CAST (order_record_paid.paid_amount as numeric(30,2)),
order_record_cmf.fund_code

FROM 
order_record,
bib_record,
bib_record_order_record_link,
bib_record_item_record_link,
item_record,
varfield vb,
order_record_paid,
order_record_cmf 

WHERE
bib_record.id = bib_record_order_record_link.bib_record_id
AND order_record.id = bib_record_order_record_link.order_record_id
AND order_record.ocode1 = 'h'
AND received_date_gmt > '2016-04-10'
AND item_record.id = bib_record_item_record_link.item_record_id
and bib_record.id = bib_record_item_record_link.bib_record_id
AND vb.record_id = bib_record.id
AND vb.varfield_type_code = 't'
AND order_record_paid.order_record_id = order_record.id
AND order_record.id = order_record_cmf.order_record_id