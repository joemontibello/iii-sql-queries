Select id2reckey(bib_record.id),
bib_record.skip_num,
varfield.marc_ind2

from 

bib_record,
varfield

where bib_record.id = varfield.record_id
and varfield.marc_tag = '245'
and varfield.marc_ind2 != CAST (bib_record.skip_num AS CHARACTER)

order by marc_ind2
