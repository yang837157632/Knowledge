--范围查询between..and
select empno, ename, sal from emp where sal between 1500 and 3000;
 
--in
select empno,ename, job from emp where job in ('SALESMAN','MANAGER','CLERK');
 
--模糊查询like
select * from emp where ename like 'J%';
select * from emp where ename like '_AR%';
select * from emp where ename like 'G\_%' escape '\';
 
--is null
select empno, ename, sal, comm from emp where comm is not null;
 
--and
select empno, ename, job, deptno from emp where job='MANAGER' and deptno=10;
 
--or
select empno, ename, job, sal from emp where job='MANAGER' or sal>2000;
 
--not
select empno, ename,job from emp where job not in ('CLERK','SALESMAN','MANAGER');
 
--混合
select empno,ename, job, sal from emp where (sal>2000 or deptno=30) and job not in ('PRESIDENT','MANAGER');
 
 
