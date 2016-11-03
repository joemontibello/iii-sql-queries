SELECT 
'i' || item_view.record_num as item_num

FROM
sierra_view.bib_record_item_record_link,
sierra_view.bib_view,
sierra_view.item_view

WHERE
bib_view.id = bib_record_item_record_link.bib_record_id
AND item_view.id = bib_record_item_record_link.item_record_id
AND bib_view.record_num = '4352044'