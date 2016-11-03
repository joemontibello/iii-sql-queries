-- Requires elevated privilege.
-- this file searches for library staff members whose logins
-- have been assigned printer numbers 3 and/or 4.
select iii_user.name,
iii_user.full_name,
--printer_name.name,
printer_name.*,
iii_user_printer.*
 from
iiienv.iii_user_printer left join sierra_view.iii_user on iii_user_printer.iii_user_id = iii_user.id,
iiienv.printer_name

Where iii_user_printer.printer_code_num = printer_name.printer_id

--Where printer_code_num > '2' and printer_code_num <= '4'

ORDER by printer_code_num