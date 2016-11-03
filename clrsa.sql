SELECT DISTINCT id2reckey(bib_record.id),
record_metadata.creation_date_gmt

FROM
sierra_view.order_record JOIN sierra_view.order_record_cmf ON order_record.id = order_record_cmf.order_record_id,
sierra_view.bib_record_order_record_link,
sierra_view.bib_record,
sierra_view.fund_master,
sierra_view.record_metadata
WHERE
bib_record.id = bib_record_order_record_link.bib_record_id
AND reckey2id('b' || CAST (record_metadata.record_num AS integer)) = order_record.id
AND order_record.id = bib_record_order_record_link.order_record_id
AND CAST (order_record_cmf.fund_code AS INTEGER) = fund_master.code_num
AND fund_master.code = 'clrsa'
