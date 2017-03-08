--Query pulls a list of records that should have 
--EZProxy but don't have it.

SELECT id2reckey(b.id),
s.content

FROM
sierra_view.subfield_view s INNER JOIN sierra_view.bib_record b ON b.id = s.record_id
WHERE
b.bcode1 = 'w'
AND s.record_type_code = 'b'
AND s.marc_tag = '856'
AND b.bcode3 = '-'
AND s.tag = 'u'
AND s.content NOT LIKE '%idm%'
and s.content NOT LIKE '%ddlp%'
and s.content NOT LIKE 'http://ieeexplore.ieee.org/servlet/opac?punumber=%'
and s.content NOT LIKE 'http://digital.casalini.it/%'
ORDER BY s.content
