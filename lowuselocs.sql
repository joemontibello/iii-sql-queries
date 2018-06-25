SELECT location_name.name, location_code, count (*)
FROM sierra_view.bib_record_location Join sierra_view.location on bib_record_location.location_code = location.code
Join sierra_view.location_name on location_name.location_id = sierra_view.location.id
group by location_code, name
order by count
