--四舍五入的函数 round
select round(sal/30,2) from emp;
 
--截断函数 trunc
select round(sal/30,2),trunc(sal/30,2) from emp;
 
--求余数的函数 Mod
select * from emp where mod(empno,2)=0;
 
--求平均值avg
select avg(sal) from emp;
 
--求和sum
select sum(sal) from emp;
 
--求最大值max
select max(sal) from emp;
 
--求最小值min
select min(sal) from emp;
 
--计数函数count
select count(*) from emp;
select count(empno) from emp;
 
--统计一下部门的个数
select count(deptno) from emp;
--在分组函数中通过distinct关键字来去除重复的记录
select count(distinct deptno) from emp;
 
--行转列wm_concat
select wm_concat(ename) from emp;
 
--求员工的平均工资
select sum(sal)/count(*) 方法一, sum(sal)/count(sal) 方法二, avg(sal) 方法三 from emp;
--求员工的平均补助
select sum(comm)/count(*) 方法一, sum(comm)/count(comm) 方法二, avg(comm) 方法三 from emp;
 
select count(*),count(nvl(comm,0)) from emp;
 
select comm from emp;
--不忽略空值
select avg(nvl(comm,0)) from emp;
--忽略空值
select avg(comm) from emp;
