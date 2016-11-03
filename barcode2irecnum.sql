-- replace the barcode in the last line with the barcode you want to search for
-- and you'll get the record number for that record. Might be useful
-- if used repetitively to iterate over a file of barcodes (from a scanner),
-- then import the record numbers into a review file.
SELECT
record_metadata.record_num
FROM
sierra_view.item_record_property,
sierra_view.record_metadata
WHERE
record_metadata.id = item_record_property.item_record_id
AND item_record_property.barcode = '|z33312001032689'
