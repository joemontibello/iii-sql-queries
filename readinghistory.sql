SELECT reading_history.*

FROM
patron_record,
reading_history

WHERE
reading_history.patron_record_metadata_id = patron_record.id
AND patron_record.id = reckey2id('p1103365')