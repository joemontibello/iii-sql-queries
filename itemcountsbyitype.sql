SELECT item_view.itype_code_num, itype_property_name.name, count(item_view.record_num)

FROM

sierra_view.item_view join sierra_view.itype_property on itype_property.code_num = item_view.itype_code_num
join sierra_view.itype_property_name on itype_property_name.itype_property_id = itype_property.id

Group By item_view.itype_code_num, itype_property_name.name
order by item_view.itype_code_num
