--创建用户
create user yan identified by test default tablespace test1_tablespace temporary tablespace temptest1_tablespace;
CREATE USER CMDB_DUMP IDENTIFIED BY Admin_1234 default tablespace CUSTOMER_DUMP ACCOUNT UNLOCK;
CREATE USER c##PHOENIX2016_YMIN IDENTIFIED BY "Admin_1234" DEFAULT TABLESPACE UCMDB_ROOT TEMPORARY TABLESPACE temp QUOTA UNLIMITED ON UCMDB_ROOT;
 
--查看创建的用户
select username from dba_users;
 
--给刚创建的用户授权
grant connect to yan;
ALTER USER CMDB_DUMP QUOTA UNLIMITED ON CUSTOMER_DUMP;
grant connect, create session, imp_full_database to CMDB_DUMP;
 
--如果想更改用户的密码，我们可以通过
alter user yan identified by t123;
 
--如果管理员不希望某用户登录， 但又不打算删除某用户，可以将此用户锁定
alter user yan account lock;
 
--给scott用户解锁
alter user scott account unlock
 
--如果这个用户不用了，想删除这个用户，可以用drop
select sid,serial#,username from v$session;
select sid,serial# from v$session where username = 'ENI_TEST';
alter system kill session '1135,62156';
drop user ENI_TEST cascade;
 
--dba_users针对管理员级别的数据字典，用于查看数据库所有用户的用户信息
select username,default_tablespace,temporary_tablespace from dba_users;
 
--user_users针对普通用户级别的数据字典，用于查看当前登录用户的用户信息
select username,default_tablespace,temporary_tablespace from user_users;
 
--all_users针对当前用户有权访问的所有用户的基本信息
select * from all_users;
