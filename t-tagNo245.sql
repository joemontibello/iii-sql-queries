--Look for records that have titles with the Sierra tag 't' on them
--but not the MARC tag 245.

Select record_type_code || record_num
FROM sierra_view.varfield_view
where varfield_type_code = 't'
AND marc_tag ='   '
