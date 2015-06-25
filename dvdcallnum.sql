SELECT 
  varfield_view.record_num, 
  item_view.barcode
FROM 
  sierra_view.item_view, 
  sierra_view.varfield_view
WHERE 
  item_view.id = varfield_view.record_id AND
  varfield_view.marc_tag = '950' AND 
  varfield_view.field_content LIKE '|b' AND 
  varfield_view.varfield_type_code = 'c';
