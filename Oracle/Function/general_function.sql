--nvl
select ename,sal,comm,sal+nvl(comm,0) from emp;
 
--nvl2
select ename,sal,comm,nvl2(comm,comm+sal,sal) from emp;
 
--nullif
select empno,ename,hiredate,nullif(hiredate,trunc(sysdate,'MONTH'))from emp;
 
--coalesce
select ename,sal,comm,coalesce(sal+comm,sal) from emp;
