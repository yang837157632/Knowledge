--创建学生信息表
create table student(
	sid number(8,0) primary key,
	name varchar2(20),
	sex char(2),
	birthday date,
	address varchar2(50)        
);
 
--修改表结构，添加非空约束
ALTER TABLE student MODIFY (name varchar2(20) NOT NULL);
 
--创建表时添加非空约束
create table student(
	sid number(8,0),
	name varchar2(20) not null,
	sex char(2) constraint nn_sex not null,
	birthday date,
	address varchar2(50),
	constraint sid_pk primary key(sid)
);
 
--删除非空约束的方式
ALTER TABLE student MODIFY sex char(2) NULL;
 
--禁用主键约束(无效化约束)
ALTER TABLE student DISABLE CONSTRAINT sid_pk;
--激活主键约束
ALTER TABLE student ENABLE CONSTRAINT sid_pk;
 
--删除主键约束
ALTER TABLE student DROP CONSTRAINT sid_pk;
ALTER TABLE student DROP PRIMARY KEY;
