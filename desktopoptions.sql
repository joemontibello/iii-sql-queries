-- This query was used to find everyone who had a specific value set for a specific desktop option.
SELECT 
  iii_user.name, 
  iii_user.full_name
--   iiienv.iii_user_desktop_option.desktop_option_id, 
--   iiienv.iii_user_desktop_option.value, 
--   desktop_option.code, 
--   iiienv.iii_user_desktop_option.value, 
--   desktop_option.default_value
FROM 
  sierra_view.iii_user, 
  iiienv.iii_user_desktop_option, 
  iiienv.desktop_option
WHERE 
  iiienv.iii_user_desktop_option.iii_user_id = iii_user.id AND
  iii_user.id = iiienv.iii_user_desktop_option.iii_user_id AND
  desktop_option.id = iiienv.iii_user_desktop_option.desktop_option_id AND
--   iii_user.name = 'jhm' and
  desktop_option.code = 'LimitPickupToHoldshelfmap' AND
  iii_user_desktop_option.value != 'true'
ORDER BY full_name
  ;
