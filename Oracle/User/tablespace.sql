--查询表空间的容量
select tablespace_name,sum(bytes)/1024/1024/1024 free_space from dba_free_space group by tablespace_name;
 
--创建默认表空间
create tablespace test1_tablespace datafile 'test1file.dbf' size 10m;
create tablespace CUSTOMER_DUMP datafile '/opt/oracle/oradata/CMSDB01/CUSTOMER_DUMP_1.dbf' size 30G,
                                         '/opt/oracle/oradata/CMSDB01/CUSTOMER_DUMP_2.dbf' size 30G,
                                         '/opt/oracle/oradata/CMSDB01/CUSTOMER_DUMP_3.dbf' size 30G;
ALTER DATABASE DATAFILE '/opt/oracle/oradata/CMSDB01/CUSTOMER_DUMP.dbf' RESIZE 30G;
ALTER DATABASE DATAFILE '/opt/oracle/oradata/CMSDB01/CUSTOMER_DUMP.dbf' autoextend on maxsize unlimited;
ALTER DATABASE DATAFILE '/u01/app/oracle/ts_32k.dbf' autoextend on maxsize unlimited;
 
--创建临时表空间
create temporary tablespace temptest1_tablespace tempfile 'tempfile1.dbf' size 10m;
 
--查看表空间数据文件的位置
select file_name from dba_data_files where tablespace_name = 'TEST1_TABLESPACE';
 
--查看临时表空间数据文件的位置
select file_name from dba_temp_files where tablespace_name = 'TEMPTEST1_TABLESPACE';
select tablespace_name,sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;
 
--查看管理员级别的表空间描述信息
select tablespace_name from dba_tablespaces;
 
--查看普通用户级别的表空间描述信息
select tablespace_name from user_tablespaces;
 
--更改表空间的状态为脱机状态
alter tablespace test1_tablespace offline;
 
--更改表空间的状态为联机状态
alter tablespace test1_tablespace online;
 
--更改表空间的状态为只读状态
alter tablespace test1_tablespace read only;
 
--更改表空间的状态为可读写状态
alter tablespace test1_tablespace read write;
 
--查看表空间的状态
select status from dba_tablespaces where tablespace_name = 'TEST1_TABLESPACE';
 
--增加数据文件
alter tablespace test1_tablespace add datafile 'test2_file.dbf' size 10m;
 
--删除数据文件
alter tablespace test1_tablespace drop datafile 'test2_file.dbf';
 
--删除表空间
ALTER DATABASE DATAFILE '/home/oracle/dump/DUMP.dbf' OFFLINE DROP;
drop tablespace test1_tablespace including contents;
DROP TABLESPACE CUSTOMER_DUMP INCLUDING CONTENTS CASCADE CONSTRAINTS;
 
--设置用户默认和临时表空间
alter user user01 default tablespace TEST1_TABLESPACE temporary tablespace TEMPTEST1_TABLESPACE;
