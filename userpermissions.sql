-- replace jhm with user login name to get listing of 
-- user permissions for that login. Output format is 
-- doctored slightly to allow easy copy / paste into a
-- Twiki page where we keep lists of what permissions 
-- users had once we delete their accounts.
SELECT 
  '   * ('||iii_user_permission_myuser.permission_num || ') '||iii_user_permission_myuser.permission_name
FROM 
  sierra_view.iii_user_permission_myuser, 
  sierra_view.iii_user
WHERE 
  iii_user_permission_myuser.iii_user_id = iii_user.id
  AND iii_user.name = 'jhm'
ORDER BY name, permission_num;
