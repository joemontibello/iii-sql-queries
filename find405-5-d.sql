SELECT 
  varfield.record_id, 
  varfield.varfield_type_code, 
  varfield.field_content
FROM 
  sierra_view.varfield

WHERE 
  (  	record_id=(select recid2hash('i1608022'))
	AND varfield.varfield_type_code='y'
 	AND varfield.marc_tag='950'
 	AND varfield.field_content LIKE '|s%');
