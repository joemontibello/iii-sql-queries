SELECT
bv.title,
bv.record_num AS bib_num,
ct.*,
irp.call_number
FROM
sierra_view.circ_trans ct,
sierra_view.item_record_property irp,
sierra_view.bib_view bv
WHERE bv.id = ct.bib_record_id 
AND irp.item_record_id = ct.item_record_id
AND ct.op_code = 'o'
AND irp.call_number LIKE '|aBF%'
ORDER BY transaction_gmt