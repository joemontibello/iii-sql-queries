--Working from the circ_transaction table to pull data on what has been checked out recently.

SELECT
id2reckey(item_record.id) recnum,
COUNT(item_record.id)


FROM 
sierra_view.circ_trans,
sierra_view.item_record_property,
sierra_view.item_record,
sierra_view.bib_record_item_record_link,
sierra_view.bib_record,
sierra_view.varfield_view
WHERE
circ_trans.item_record_id = item_record.id
AND circ_trans.op_code = 'o'
AND item_location_code NOT LIKE 'rs%'
AND item_record.id = bib_record_item_record_link.item_record_id
AND bib_record.id = bib_record_item_record_link.bib_record_id
AND item_record.id = item_record_property.item_record_id
AND varfield_view.record_type_code = 'b'
AND varfield_view.record_id = bib_record.id
AND varfield_view.varfield_type_code = 'c'
GROUP BY recnum
ORDER BY count desc
