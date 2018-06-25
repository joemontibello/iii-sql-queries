SELECT id2reckey(bib_record_id), items FROM
(Select bib_record_id, count (item_record_id) as items
from
sierra_view.bib_record_item_record_link

Group by bib_record_id
) as foo
WHERE items > 500
order by items desc