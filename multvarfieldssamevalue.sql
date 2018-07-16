-- find records with multiples of a given MARC tag.
SELECT DISTINCT ON (field_content)
field_content FROM
(select id2reckey(patron_record.id) as pid, field_content
FROM
sierra_view.patron_record join sierra_view.varfield ON patron_record.id = varfield.record_id

where
varfield.varfield_type_code = 'b') as foo
Group By field_content
HAVING count(field_content) > 1
