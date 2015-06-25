--Here's a query to find locations that are not used in any records. These probably need to be cleaned up.

SELECT  location.code

FROM    sierra_view.location

LEFT JOIN sierra_view.item_record ON sierra_view.item_record.location_code = sierra_view.location.code
LEFT JOIN sierra_view.bib_record_location ON sierra_view.bib_record_location.location_code = sierra_view.location.code
LEFT JOIN sierra_view.order_record_cmf ON sierra_view.order_record_cmf.location_code = sierra_view.location.code
LEFT JOIN sierra_view.holding_record_location on sierra_view.holding_record_location.location_code = sierra_view.location.code
LEFT JOIN sierra_view.course_view ON sierra_view.course_view.location_code = sierra_view.location.code
LEFT JOIN sierra_view.hold ON sierra_view.hold.pickup_location_code = sierra_view.location.code
LEFT JOIN sierra_view.patron_record ON sierra_view.patron_record.home_library_code = sierra_view.location.code

WHERE   sierra_view.item_record.location_code IS NULL
AND sierra_view.bib_record_location.location_code IS NULL
AND sierra_view.order_record_cmf.location_code IS NULL 
AND sierra_view.holding_record_location.location_code IS NULL 
AND sierra_view.course_view.location_code IS NULL
AND sierra_view.hold.pickup_location_code IS NULL
AND sierra_view.patron_record.home_library_code IS NULL 

ORDER BY location.code