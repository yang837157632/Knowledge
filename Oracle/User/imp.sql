--在SQLPLUS中执行如下命令
--导入
--将备份文件导入到数据库
imp scott/tiger1@orcl file=c:\oracle_bak\scott_bak.dmp ignore=y
 
--将scott用户的备份文件导入到yanln用户中
imp yanln/yanln@orcl fromuser=scott touser=yanln file=c:\oracle_bak\scott_bak.dmp
