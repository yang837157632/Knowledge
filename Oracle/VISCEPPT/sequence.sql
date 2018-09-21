--创建序列
create sequence deptno_seq
start with 50
increment by 10
maxvalue 70
cache 3;
 
--为了方便演示，创建了一个和dept表结构相同的deptnew表
create table deptnew
as
select * from dept;
 
--向表中插入数据，并通过序列给主键列deptno提供数据
insert into deptnew(deptno,dname,loc)values(deptno_seq.nextval,'test_dname','test_loc');
select * from deptnew;
 
--currval
select deptno_seq.currval from dual;
 
--查询序列
select sequence_name, min_value, max_value, increment_by, cycle_flag, cache_size, last_number
from user_sequences;
 
--向数据库提交插入的数据
commit;
 
--修改序列
alter sequence deptno_seq
maxvalue 90;
 
--测试
insert into deptnew(deptno,dname,loc)values(deptno_seq.nextval,'test_dname','test_loc');
select * from deptnew;
rollback;
insert into deptnew(deptno,dname,loc)values(deptno_seq.nextval,'test_dname','test_loc');
select * from deptnew;
commit;
 
--删除序列
drop sequence deptno_seq;
