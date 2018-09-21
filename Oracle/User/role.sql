--创建用户user02
create user user02 identified by pass02;
 
--创建角色
create role manager;
 
--给角色赋予创建表、创建视图的权限
grant create table, create view to manager;
 
--给角色manager授权给用户
grant manager to user02;
 
--回收角色权限
revoke select,update,insert on scott.emp from manager01;
 
--回收对象权限
revoke manager from user02;
 
--删除角色
drop role manager;

