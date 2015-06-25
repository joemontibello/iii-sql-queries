SELECT
  bib_record.record_id, 
  varfield.marc_tag, 
  varfield.marc_ind1, 
  varfield.marc_ind2, 
  varfield.occ_num, 
  varfield.field_content
FROM 
  sierra_view.bib_record left join sierra_view.varfield on (varfield.record_id = bib_record.record_id), varfield_type
WHERE 
  varfield_type.record_type_code = 'b' AND
  varfield_type.record_type_code = varfield.varfield_type_code AND
  varfield.marc_tag IS DISTINCT FROM NULL

;
