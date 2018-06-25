-- trying to gather info across active course records

SELECT field_content

FROM

(SELECT FOO.record_id course, 
course_record_item_record_link.item_record_id item,
course_record_bib_record_link.bib_record_id bib

FROM 
(SELECT course_record.record_id

FROM sierra_view.course_record
WHERE
now() > course_record.begin_date
and now() < course_record.end_date) AS FOO JOIN sierra_view.course_record_item_record_link on FOO.record_id = course_record_item_record_link.course_record_id
JOIN sierra_view.course_record_bib_record_link on FOO.record_id = course_record_bib_record_link.course_record_id) AS BAR JOIN sierra_view.varfield on varfield.record_id = BAR.course
