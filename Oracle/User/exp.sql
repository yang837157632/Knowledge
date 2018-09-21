--在SQLPLUS中执行如下命令
--导出
--将数据库orcl完全导出
exp system/oracle@orcl file=c:\oracle_bak\orcl_bak.dmp full=y

--将数据库中scott用户的所有对象导出
exp scott/tiger1@orcl file=c:\oracle_bak\scott_bak.dmp owner=scott

--将scott用户中表emp，dept导出
exp scott/tiger1@orcl file=c:\oracle_bak\table_bak.dmp tables=(emp,dept)
