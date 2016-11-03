SELECT 
id2reckey(hold.patron_record_id) patron,
id2reckey(hold.record_id) recordID,
id2reckey(bib_record_item_record_link.item_record_id)

FROM 
sierra_view.hold,
sierra_view.bib_record_item_record_link

WHERE
status='0'
AND id2reckey(hold.record_id) LIKE 'b%'
AND hold.record_id = bib_record_item_record_link.bib_record_id

ORDER BY recordID