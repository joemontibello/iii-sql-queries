select id2reckey(order_record.id)

from 
order_record FULL OUTER JOIN bib_record_order_record_link ON order_record.id = bib_record_order_record_link.order_record_id,
order_record orrec FULL OUTER JOIN resource_record_order_record_link ON orrec.id = resource_record_order_record_link.order_record_id
where
bib_record_order_record_link.order_record_id IS NOT DISTINCT FROM NULL
AND resource_record_order_record_link.order_record_id IS NOT DISTINCT FROM NULL
