USE master   --当前指向的操作的数据库
GO
IF EXISTS(SELECT * FROM sysdatabases WHERE name='E_Market')
DROP DATABASE E_Market    --删除数据库
 
CREATE DATABASE E_Market    --创建数据库
ON PRIMARY --主文件组
(
	NAME='E_Market_data',   --逻辑文件名
	FILENAME='H:\project\E_Market_data.mdf',  --物理文件名
	SIZE=5MB,  --初始大小
	MAXSIZE=100MB,  --最大容量
	FILEGROWTH=15%  --增长率
),
FILEGROUP FG   --创建了一个次文件组
(
	NAME='E_Market2_data',
	FILENAME='H:\project\E_Market2_data.ndf',
	SIZE=4MB,
	FILEGROWTH=10%
)
LOG ON --日志文件
(
	NAME='E_Market_log',
	FILENAME='H:\project\E_Market_log.ldf',
	SIZE=5MB,
	FILEGROWTH=0--未启用自动增长
),
(
	NAME='E_Market2_log',
	FILENAME='H:\project\E_Market2_log.ldf',
	SIZE=3MB,
	FILEGROWTH=10%,
	MAXSIZE=100MB
)
GO
 
 
--[1]使用sql语句来查看数据的状态
SELECT state_desc FROM sys.databases WHERE name='E_Market'
 
--[2]使用函数来查看数据库的状态
SELECT DATABASEPROPERTYEX('Library','status')
 
--[3]将数据库E_Market设为脱机状态
--[4]将数据库E_Market设为联机状态
 
 
USE master --指向当前所操作的数据库
GO
EXEC sp_detach_db @dbname=E_Market--分离数据库
GO
 
USE master
GO
EXEC sp_attach_db @dbname=E_Market,--附加数据库
@filename1='H:\project\E_Market_data.mdf',
@filename2='H:\project\E_Market2_data.ndf',
@filename3='H:\project\E_Market_log.ldf',
@filename4='H:\project\E_Market2_log.ldf'
GO
 
 
SELECT * FROM master.dbo.sysdatabases where name like '%YMIN%';
ALTER DATABASE arnold210 SET SINGLE_USER with ROLLBACK IMMEDIATE
GO
DROP DATABASE arnold210
