-- Find subfield tags that are not 
-- a-z or 0-9, and return record numbers.

SELECT id2reckey(record_id) recnum,
marc_tag,
tag,
content

FROM 
sierra_view.subfield s 
WHERE
s.tag !~ '[a-z 0-9]'
ORDER BY recnum