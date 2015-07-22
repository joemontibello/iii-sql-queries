select distinct
'i' || record_metadata.record_num || 'a' as record_num,
bib_record_property.best_title,
item_record.checkout_total,
item_record.year_to_date_checkout_total,
item_record.last_year_to_date_checkout_total,
item_record.save_checkout_total
from
sierra_view.item_record join sierra_view.bib_record_item_record_link on item_record.id = bib_record_item_record_link.item_record_id,
sierra_view.bib_record_property,
sierra_view.record_metadata
--sierra_view.varfield
where
--varfield.record_id = item_record.id
--and (select not exists(select 1 from sierra_view.varfield where varfield.varfield_type_code = 'r'))
item_record.checkout_total < (item_record.year_to_date_checkout_total + item_record.last_year_to_date_checkout_total)
and bib_record_property.bib_record_id = bib_record_item_record_link.bib_record_id
and (record_metadata.record_type_code = 'i'and record_metadata.id = item_record.id)
and item_record.save_checkout_total is not distinct from null