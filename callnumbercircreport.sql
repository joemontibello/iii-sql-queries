
SELECT 
index_entry callNumber,
id2reckey(bib_record.id) bibnumber,
id2reckey(item_record.id) itemnumber,
bib_record.cataloging_date_gmt catdate,
item_record.year_to_date_checkout_total,
item_record.last_year_to_date_checkout_total,
item_record.checkout_total,
item_record.last_checkout_gmt,
item_record.location_code

FROM
sierra_view.phrase_entry,
sierra_view.bib_record,
sierra_view.bib_record_item_record_link,
sierra_view.item_record

WHERE
--phrase_rule_rule_num = '2'
phrase_entry.index_tag = 'c'
AND index_entry ~ '^b\s+\d+.*'
AND phrase_entry.record_id = bib_record_item_record_link.bib_record_id
AND bib_record.id = bib_record_item_record_link.bib_record_id
AND item_record.record_id = bib_record_item_record_link.item_record_id

ORDER by callnumber
