SELECT 
  patron_record_fullname.patron_record_id, 
  patron_record_fullname.last_name, 
  patron_record_fullname.first_name, 
  fine.assessed_gmt, 
  fine.item_charge_amt
FROM 
  sierra_view.fine, 
  sierra_view.patron_record_fullname, 
  sierra_view.patron_view, 
  sierra_view.mblock_property
WHERE 
  patron_record_fullname.patron_record_id = fine.patron_record_id AND
  patron_view.mblock_code = mblock_property.code AND
  fine.item_charge_amt > 25 AND 
  current_date - fine.assessed_gmt > interval'31';
