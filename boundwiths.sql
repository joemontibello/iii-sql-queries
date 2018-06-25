Select distinct id2reckey(item_record_id)
FROM
sierra_view.bib_record_item_record_link
Group by item_record_id
HAVING count(bib_record_id) > 1
Order by id2reckey(item_record_id)