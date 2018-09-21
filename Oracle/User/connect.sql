--监听器
lsnrctl status/start/stop

--进入sqlplus界面但不登录
sqlplus  /nolog
 
--连接数据库的命令connect，用于切换连接用户，简写形式conn
--语法格式：conn 用户名/密码
conn yanln/yanln
conn /as sysdba                                    --不用指定用户名和密码，直接以sysdba的身份登录数据库
conn sys/oracle @orcl as sysdba                    --sys用户以sysdba的身份连接数据库，连接时指定数据库连接标识符@orcl
conn sys/oracle as sysdba                          --sys用户以sysdba的身份连接数据库，连接时没有指定数据库连接标识符，此时将连接默认的数据库
 
shutdown immediate
startup
 
--显示当前登录的用户
show user
 
--执行操作系统的命令
host mkdir d:\testOracle
 
--导出记录到文本
spool d:\testOracle\test.txt
spool off
 
--清屏
clear screen
 
--执行文件系统中的sql语句
start d:\test.sql
 
--显示表结构，命令describe，简写形式desc
desc student
 
--显示错误信息
show error
 
--退出
exit

 
 
--DDL	create
--DCL	grant
--DML	insert  select
--TCL	commit
