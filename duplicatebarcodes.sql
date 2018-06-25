Select count(*), barcode
FROM sierra_view.item_view
GROUP by barcode
HAVING count(*)>1