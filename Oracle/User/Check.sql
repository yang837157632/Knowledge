--创建学生信息表
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50)
);
 
--修改表添加检查约束的方式
alter table student add constraint ck_sex check(sex='男' or sex='女');
 
--创建表时设置检查约束的方式：列级约束
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2) check(sex='男' or sex='女'),
    birthday date,
    address varchar2(50)
);
 
--创建表时设置检查约束的方式：表级约束
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    constraint ck_sex check(sex='男' or sex='女')
);
 
--禁用约束
alter table student disable constraint ck_sex;
 
--彻底删除
alter table student drop constraint ck_sex;

 