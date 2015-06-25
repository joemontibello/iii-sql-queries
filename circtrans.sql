--Working from the circ_transaction table to pull data on what has been checked out recently.
--problems: breaking things out by subject doesn't work at this point because the 
--call numbers are not all in one table. Also, the data spans the past two weeks or so -
--we'd want more than that (at least one month).
SELECT
bib_view.title,
bib_view.record_num,
item_record_property.call_number,
item_record_property.call_number_norm,
varfield_view.field_content
FROM 
sierra_view.circ_trans,
sierra_view.item_record_property,
sierra_view.item_record,
sierra_view.bib_record_item_record_link,
sierra_view.bib_view,
sierra_view.varfield_view
WHERE
circ_trans.item_record_id = item_record.id
AND item_record.id = bib_record_item_record_link.item_record_id
AND bib_view.id = bib_record_item_record_link.bib_record_id
AND item_record.id = item_record_property.item_record_id
AND varfield_view.record_type_code = 'b'
AND varfield_view.record_id = bib_view.id
AND varfield_view.varfield_type_code = 'c'
--AND pcode3 = '89'
limit 100;