SELECT 'i' || record_num || 'a' 
FROM sierra_view.item_view
WHERE barcode not like '|z%'
and barcode != ''
