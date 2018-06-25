Select id2reckey(foo.bibid) from
(SELECT bib_record.id as bibid, varfield_view.id as varid
FROM sierra_view.varfield_view JOIN sierra_view.bib_record on varfield_view.record_id = bib_record.id
WHERE 
varfield_type_code = 'c')as foo JOIN sierra_view.varfield_view on foo.varid = varfield_view.id
where 
varfield_view.varfield_type_code = 'y'
