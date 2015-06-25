SELECT 
  iii_user.name, 
  iii_user.iii_user_group_code, 
  iii_user.full_name
FROM 
  sierra_view.iii_user
ORDER BY
  iii_user.iii_user_group_code ASC;
