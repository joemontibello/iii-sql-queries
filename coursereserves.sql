Select 
sierra_view.id2reckey(course_view.id) as course_record_id,
course_view.begin_date,
course_view.end_date,
course_record_item_record_link.item_record_id,
bib_record_item_record_link.bib_record_id,
iv.varfield_type_code,
iv.field_content

from 
sierra_view.course_view, 
sierra_view.course_record_item_record_link,
sierra_view.bib_record_item_record_link,
--sierra_view.bib_view,
sierra_view.varfield_view cv,
sierra_view.varfield_view iv

Where
bib_record_item_record_link.item_record_id = course_record_item_record_link.item_record_id
AND course_view.id = cv.record_id
AND course_view.id = course_record_item_record_link.course_record_id
AND cv.varfield_type_code = 'p'
AND cv.field_content = 'Hartov, Alex'
--Now lets find item info:
AND iv.record_id = course_record_item_record_link.item_record_id
--AND iv.varfield_type_code = 'i701'
order by iv.varfield_type_code
