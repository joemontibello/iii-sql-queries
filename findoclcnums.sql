SELECT "record_num", "record_type_code", "content" AS "oclc"
FROM sierra_view.subfield_view
WHERE record_type_code = 'b' 
AND ("marc_tag" IN ('001', '019', '035'))
LIMIT 10000
