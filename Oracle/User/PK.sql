--创建学生信息表
create table student(
	sid number(8,0),
	name varchar2(20),
	sex char(2),
	birthday date,
	address varchar2(50)
);
 
--修改表结构，为学生信息表添加主键约束
alter table student
add constraint sid_pk primary key(sid);
 
 
--创建表时添加主键约束
create table student(
	sid number(8,0) primary key,
	name varchar2(20),
	sex char(2),
	birthday date,
	address varchar2(50)        
);
 
create table student(
	sid number(8,0),
	name varchar2(20),
	sex char(2),
	birthday date,
	address varchar2(50),
        constraint sid_pk primary key(sid)
);
 
