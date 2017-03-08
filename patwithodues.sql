--get all patrons with overdue fines.
SELECT id2reckey(r.id) as pnum,
fn.last_name,
fn.first_name,
f.item_charge_amt,
f.processing_fee_amt,
f.billing_fee_amt,
f.item_charge_amt + f.processing_fee_amt + f.billing_fee_amt as total

FROM 
sierra_view.fine f JOIN sierra_view.patron_record r on f.patron_record_id = r.id
JOIN sierra_view.patron_record_fullname fn on fn.patron_record_id = r.id
WHERE 
f.charge_code = '2'