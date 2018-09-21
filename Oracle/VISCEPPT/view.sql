--创建简单视图
--建立用于查询员工号、姓名、工资的视图。
create view emp_view
as
select empno,ename,sal from emp;
 
 
--查询视图
select * from emp_view;
 
--创建视图时指定视图的列的别名
create view emp_view2(员工号,姓名,工资)
as
select empno,ename,sal from emp;
 
--查询视图
select * from emp_view2;
 
--连接视图
--建立用于获得部门号为10的部门号、部门名称及员工信息。
create view dept_emp_view
as
select d.deptno,d.dname,e.empno,e.ename,e.job
from dept d, emp e
where d.deptno = e.deptno and d.deptno = 10;
 
--查询视图
select * from dept_emp_view;
 
--只读视图
--建立查看10号部门员工信息的视图。
create view emp_view3
as
select * from emp where deptno = 10
with read only;
 
--查询视图
select * from emp_view3;
--测试
update emp_view3 set sal = sal +50;
