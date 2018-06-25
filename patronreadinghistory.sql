--Pulls all patrons who have a reading history

SELECT distinct id2reckey(patron_record_metadata_id)

FROM
sierra_view.reading_history