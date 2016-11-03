--look for 
select
bib_view.title, 
innerquery.mc
FROM
sierra_view.bib_view,
sierra_view.bib_record_item_record_link,
(select 
item_record_id, count(item_record_id) as mc
from
report.circ_trans
Where 
date_part('month', transaction_gmt) = '9'
group by item_record_id
order by mc desc) as innerquery
WHERE
innerquery.item_record_id = bib_record_item_record_link.item_record_id
AND bib_view.id = bib_record_item_record_link.bib_record_id