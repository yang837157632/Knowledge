--emp01
create table emp01
as
select * from emp where deptno in(10,20);
 
--emp02
create table emp02
as
select * from emp where deptno in(20,30);
 
 
--union  14个记录
select deptno, empno, ename from emp01
union
select deptno, empno, ename from emp02;
 
--union all
select deptno, empno, ename from emp01
union all
select deptno, empno, ename from emp02
order by deptno;
 
--通过列值进行排序，1代表第一列
select deptno, empno, ename from emp01
union all
select deptno, empno, ename from emp02
order by 1;
 
--intersect
select deptno, empno, ename from emp01
intersect
select deptno, empno, ename from emp02;
 
--minus
select deptno, empno, ename from emp01
minus
select deptno, empno, ename from emp02;
