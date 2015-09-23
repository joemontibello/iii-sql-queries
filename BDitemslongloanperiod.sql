--Used this to look for Borrow Direct items that had more than 90 days 
--between their out date and their due date. I found only a few, and 
--none more than 95 days different.
SELECT * 
from 
  iiirecord.item_record,
  iiirecord.checkout,
  iiirecord.patron_record,
  iiirecord.patron_record_fullname
where
patron_record.id = patron_record_fullname.patron_record_id AND
checkout.patron_record_id = patron_record.id AND
checkout.item_record_id = item_record.id AND
item_record.virtual_type is distinct from null AND
date(checkout.due_gmt) - date(checkout.checkout_gmt) > 90