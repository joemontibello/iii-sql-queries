--Query pulls together things that have an LPatron value for a patron that has ptype 34
--so all things where the previous checkout was to a BD library should be pulled.

SELECT 
  patron_record_fullname.last_name, 
  bib_view.title, 
  bib_view.record_num AS bibrecordnumber, 
  item_record.last_checkin_gmt as lastcheckin,
  item_circ_history.patron_record_metadata_id as Currentpatron
FROM 
  sierra_view.item_record, 
  sierra_view.record_metadata, 
  sierra_view.patron_view, 
  sierra_view.patron_record_fullname, 
  sierra_view.bib_record_item_record_link, 
  sierra_view.bib_view,
  sierra_view.item_circ_history
WHERE 
  item_record.last_patron_record_metadata_id = record_metadata.id AND
  patron_view.record_num = record_metadata.record_num AND
  patron_record_fullname.patron_record_id = patron_view.id AND
  bib_record_item_record_link.item_record_id = item_record.record_id AND
  bib_record_item_record_link.bib_record_id = bib_view.id AND
  patron_view.ptype_code = '34'AND
  cast (last_checkin_gmt as date) > cast ('2015-04-01' as date)
  
ORDER BY
  item_record.last_checkin_gmt DESC;
