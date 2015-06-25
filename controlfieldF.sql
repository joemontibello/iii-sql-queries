select 
record_metadata.record_num,
control_field.p28
from iiirecord.bib_record, iiirecord.control_field, iiirecord.record_metadata
where bib_record.record_id = control_field.record_id
and bib_record.record_id = record_metadata.id
and record_metadata.record_type = 'b'
and control_field.p28 = 'f'
limit 20