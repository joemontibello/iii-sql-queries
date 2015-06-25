

SELECT
  record_type_code,
  varfield_type_code as "field_group_tag",
  display_order,
  name
FROM sierra_view.phrase_type
  JOIN sierra_view.phrase_type_name ON phrase_type_name.phrase_type_id = phrase_type.id
ORDER by 1, 2
