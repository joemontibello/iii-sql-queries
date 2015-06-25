SELECT 
  '   * ('||iii_user_permission_myuser.permission_num || ') '||iii_user_permission_myuser.permission_name
FROM 
  sierra_view.iii_user_permission_myuser, 
  sierra_view.iii_user
WHERE 
  iii_user_permission_myuser.iii_user_id = iii_user.id
  AND iii_user.name = 'jhm'
ORDER BY name, permission_num;
