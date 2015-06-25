SELECT  
  bib_view.title,
  bib_view.record_num,
  leader_field.bib_level_code
FROM 
  sierra_view.leader_field, 
  sierra_view.bib_view
WHERE 
  leader_field.record_id = bib_view.id AND
  leader_field.bib_level_code = 's'

LIMIT 10;
