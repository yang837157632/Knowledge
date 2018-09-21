--去除重复行
select distinct deptno, job from emp;
 
--列的别名
select empno "雇员编号", ename 雇员名, sal*12 as 年收入 from emp;
 
--连接符
select  ename||'的月工资是：'||sal||'岗位是：'||job as 雇员职位信息 from emp;
 
--单列排序
select ename, comm from emp order by comm asc;
 
--使用列的别名排序
select  empno, ename, sal*12 年收入 from emp order by 年收入 desc;
 
--多列排序
select empno,ename, deptno, sal from emp order by deptno asc, sal desc;
