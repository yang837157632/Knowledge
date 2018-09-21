--视图上的DML操作
--创建视图
create view empnew_view
as
select empno,ename,sal from empnew;
 
--select
select * from empnew_view;
 
--insert
insert into empnew_view(empno,ename,sal) values(8888,'LAYNA',6666);
select * from empnew;
 
--update
update empnew_view set sal = sal + 100 where empno = 8888;
 
--delete
delete from empnew_view where empno = 8888;
commit;
 
--在视图上定义check约束
create view empnew_view2
as
select * from empnew where deptno = 20
with check option constraint ck_view;
 
--查询视图
select * from empnew_view2;
 
--测试
--insert或update
update empnew_view2 set deptno = 30 where empno = 7566;
 
--修改视图
 
--修改前查询
select * from empnew_view;
 
--修改empnew_view视图
create or replace view empnew_view
as
select * from emp where job = 'SALESMAN';
 
--修改后查询
select * from empnew_view;
 
--删除视图
drop view empnew_view;
 
select * from emp;
