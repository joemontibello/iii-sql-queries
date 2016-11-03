-- find records with more than one subfield b on the 245. subfield b
-- is not supposed to be repeatable.
select bib_view.record_num,
count(tag = 'b') > 1
from sierra_view.subfield_view,
sierra_view.bib_view
where
subfield_view.record_id = bib_view.id
AND subfield_view.marc_tag = '245' 
Group by bib_view.record_num

