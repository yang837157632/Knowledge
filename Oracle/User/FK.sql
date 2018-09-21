--主表
create table department(
    depid varchar2(10) primary key,
    depname varchar2(30)
);
 
--从表
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    depid varchar2(10)
);
 
--修改表时添加约束
alter table student add constraint fk_depid foreign key(depid) references department(depid) on delete cascade;
 
--创建列级约束
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    depid varchar2(10) references department(depid)
);
 
--创建表级约束
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    depid varchar2(10),
    constraint fk_depid foreign key(depid) references department(depid) on delete cascade
);
 
--禁用约束
alter table student disable constraint fk_depid;
 
--彻底删除
alter table student drop constraint fk_depid;
 
 
