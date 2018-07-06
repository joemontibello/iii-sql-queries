-- find records with multiples of a given MARC tag.

select 'b' || bib_view.record_num || 'a'

from sierra_view.varfield_view,
sierra_view.bib_view
where
varfield_view.record_id = bib_view.id
AND varfield_view.marc_tag = '948' 
Group by bib_view.record_num
Having count(marc_tag = '948') > 1
ORDER BY bib_view.record_num
