SELECT 
  iii_user.last_password_change_gmt, 
  iii_user.name, 
  iii_user_desktop_option.desktop_option_id, 
  iii_user_desktop_option.value
FROM 
  sierra_view.iii_user_desktop_option, 
  sierra_view.iii_user
WHERE 
  iii_user_desktop_option.iii_user_id = iii_user.id AND
  iii_user.name = 'mcatmet'
ORDER BY
  iii_user_desktop_option.desktop_option_id ASC;
