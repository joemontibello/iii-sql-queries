--all patron fines.
--see http://techdocs.iii.com/sierradna/Home.html?viewGroupName=Circulation#fine
--for list of what each charge_code means

SELECT r.id,
fn.last_name,
fn.first_name,
f.charge_code,
f.item_charge_amt,
f.processing_fee_amt,
f.billing_fee_amt,
f.item_charge_amt + f.processing_fee_amt + f.billing_fee_amt as total

FROM 
sierra_view.fine f JOIN sierra_view.patron_record r on f.patron_record_id = r.id
JOIN sierra_view.patron_record_fullname fn on fn.patron_record_id = r.id
ORDER BY id

