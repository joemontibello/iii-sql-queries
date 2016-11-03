--candalaria's query
SELECT
id2reckey(bib_record.id),
field.marc_tag,
field.marc_ind1,
field.marc_ind2,
field.field_content
FROM
sierra_view.bib_record 
INNER JOIN sierra_view.varfield AS field 
ON field.record_id = bib_record.id
 
WHERE
bib_record.id IN 
(
SELECT DISTINCT(sierra_view.bib_record.id)
FROM 
sierra_view.bib_record
INNER JOIN sierra_view.bib_record_location 
ON sierra_view.bib_record_location.bib_record_id =sierra_view.bib_record.id 
INNER JOIN sierra_view.bib_record_property
ON sierra_view.bib_record_property.bib_record_id =sierra_view.bib_record.id
WHERE 
bcode3 != 'n' AND
bcode3 != 'f' AND
bcode3 != 'p' AND
bcode3 != 'e' AND
bcode3 != 's' AND
bcode3 != 'x' AND
(
material_code = 'a' OR
material_code = 'l' OR
material_code = '@' OR
material_code = 'i' OR
material_code = 'r' OR
material_code = 'g' OR
material_code = 's'
) AND
(
location_code = 'w' OR
location_code = 'wac' OR
location_code = 'wbc' OR
(location_code > 'b' AND location_code < 'bzzzz') 
)
)
ORDER BY
bib_record.id, marc_tag;