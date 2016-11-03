Select
id2reckey(bib_record.id),
id2reckey(item_record.id),
--vi.field_content,
vb.field_content

from
bool_set,
bib_record_item_record_link,
bib_record,
item_record,
varfield vb inner join 
--varfield vi

where
bool_info_id = '203'
AND bool_set.record_metadata_id = bib_record_item_record_link.item_record_id
AND item_record.id = bib_record_item_record_link.item_record_id
AND bib_record.id = bib_record_item_record_link.bib_record_id
AND bib_record.id = vb.record_id
AND vb.varfield_type_code = 'c'
--AND item_record.id = vi.record_id
--AND vi.varfield_type_code = 'c'