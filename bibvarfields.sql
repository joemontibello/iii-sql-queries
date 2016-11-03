SELECT varfield.* from 
sierra_view.bib_record inner join sierra_view.varfield on bib_record.id = varfield.record_id
WHERE
bib_record.id = (Select reckey2id('b1312824') )