--大小写控制函数
--upper
select * from emp where job = upper('salesman');
 
--lower
select * from emp where lower(job) = 'clerk';
 
--initcap
select empno, initcap(ename) from emp;
 
--upper、lower、initcap这三个函数的共同点，如果输入参数值为null时，则返回null
select empno, initcap(null) from emp;
 
 
--字符控制函数
--字符串连接符，实现雇员名与工资两列的连接
select ename || ':' || sal from emp;
 
--字符串连接的函数concat，实现雇员名与工资两列的连接
select concat(concat(ename,':'),sal) from emp;
 
--截串函数 substr
select * from emp where substr(job,1,4) = 'SALE';
 
--求字符串长度的函数 length
select * from emp where length(ename) = 6;
 
--instr 求子串在字符串中的位置
select instr('hello oracle','oracle') from dual;
 
select instr('hello oracle hello oracle', 'oracle', 1, 2) from dual;
 
--左填充函数 lpad
select lpad(job,9,'*') from emp;
 
--右填充函数 rpad
select rpad(job, 9, '*') from emp;
 
--替换函数 replace
select replace('hello oracle','oracle','world') from dual;
