-- this file searches for library staff members whose logins
-- have been assigned printer numbers 3 and/or 4.
select iii_user.name,
iii_user.full_name,
iii_user_printer_myuser.name
 from
sierra_view.iii_user_printer_myuser left join sierra_view.iii_user on iii_user_id = id

Where printer_code_num > '2' and printer_code_num <= '4'
