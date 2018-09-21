--添加列
alter table student add tel varchar2(11);

--修改列
alter table student modify tel number(11,0);

--删除列
alter table student drop column tel;

--修改列名
alter table student rename column gender to sex;

--修改表名
rename studentinfo to student;
 
--删除表
truncate
truncate table emp_bak;
 
--drop
drop table emp_bak;
 
 
