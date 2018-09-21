--创建表时添加唯一性约束
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    email varchar2(50) unique,
    cardid varchar2(18),
    constraint uk_cardid unique(cardid)
);
 
--创建学生信息表
create table student (
    sid number(8,0),
    name varchar2(20),
    sex char(2),
    birthday date,
    address varchar2(50),
    email varchar2(50) unique,
    cardid varchar2(18)
);
 
--更改表结构，添加唯一性约束
alter table student add constraint uk_student_cardid unique(cardid);
 
--禁用约束
alter table student disable constraint uk_student_cardid;
 
--彻底删除
alter table student drop constraint uk_student_cardid;
