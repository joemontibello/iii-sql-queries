SELECT bib_view.record_num --Need more data fields
FROM sierra_view.bib_view, sierra_view.varfield
WHERE
bib_view.id = varfield.record_id AND
varfield.varfield_type_code = 'b'AND
(( bib_view.bcode2 != 'g' AND -- bib source
bib_view.bcode3 != 'b' AND -- bib status
date(bib_view.cataloging_date_gmt) = current_date - 1) OR  --cat date - need to change this to run as current date and schedule it before end of day.
(varfield.marc_tag ='955' AND
varfield.field_content LIKE '|u+l 150226') OR -- after |u+l allow for zero or more digits before the space.
(varfield.marc_tag = '950' AND
varfield.field_content LIKE '|i150226')) ; --doesn't sort
