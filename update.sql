UPDATE 
  iiirecord.varfield 

SET
  field_content='|s405-5-d testing'

WHERE
  ( record_id=(select recid2hash('i1608022')) AND field_type_tag='y' AND marc_tag='950' AND field_content LIKE '|s%');
