--find bib records with more than 100 items attached
SELECT distinct
b.record_id,
COUNT(l.item_record_id)
FROM
sierra_view.bib_record_item_record_link l join sierra_view.bib_view b ON l.bib_record_id = b.id 
GROUP BY b.record_id
HAVING
COUNT(l.item_record_id) > 100
order by count
