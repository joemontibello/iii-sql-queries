SELECT record_metadata.*

FROM 
bool_set,
record_metadata
WHERE
bool_set.bool_info_id = '6'
AND bool_set.record_metadata_id = record_metadata.id

ORDER BY record_metadata.record_last_updated_gmt