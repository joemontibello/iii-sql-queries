-- look for Millennium Media Mgmt files having the
-- 'qtl' file extension.

SELECT distinct
  '.b' || bib_view.record_num AS bib_rec_num,
 bib_view.title,
 varfield.field_content,
 '.r' || course_view.record_num AS course_rec_num
FROM 
  sierra_view.bib_view, 
  sierra_view.bib_record_item_record_link, 
  sierra_view.course_view, 
  sierra_view.course_record_item_record_link, 
  sierra_view.item_record, 
  sierra_view.varfield
WHERE 
  bib_record_item_record_link.bib_record_id = bib_view.id AND
  bib_record_item_record_link.item_record_id = item_record.id AND
  course_record_item_record_link.item_record_id = item_record.id AND
  course_record_item_record_link.course_record_id = course_view.id AND
  varfield.record_id = bib_view.id AND
  varfield.varfield_type_code = 'y' AND 
  varfield.field_content ~ 'qtl'
  ;
