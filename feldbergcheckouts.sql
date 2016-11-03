select

distinct item_location_code,
transaction_gmt
--op_code,
--itype_code_num,




FROM 
sierra_view.circ_trans

WHERE
stat_group_code_num > '599'
AND stat_group_code_num < '700'
AND op_code = 'o'

ORDER BY item_location_code asc
