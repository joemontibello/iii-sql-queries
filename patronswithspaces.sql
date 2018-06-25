Select varfield_view.field_content, 'p' || patron_view.record_num || 'a'

From 
sierra_view.patron_view join sierra_view.varfield_view on patron_view.id = varfield_view.record_id

Where

varfield_view.varfield_type_code = 'z'
AND varfield_view.field_content like '% '
