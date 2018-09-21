--笛卡尔集
select empno,ename, 员工表.deptno, 部门表.deptno, dname from 部门表, 员工表;
 
--等值连接
select empno,ename,job,dname from emp, dept where emp.deptno = dept.deptno;
select e.empno,e.ename,e.job,d.dname,d.deptno from emp e, dept d
where e.deptno = d.deptno and e.deptno=10;
 
--非等值连接
select e.empno, e.ename, e.sal, s.grade from emp e, salgrade s where e.sal between losal and hisal;
 
--外连接
select d.deptno,d.dname,count(e.empno) from dept d, emp e
where d.deptno = e.deptno(+) group by d.deptno, d.dname;
 
--自连接
select e.ename,m.ename from emp e, emp m
where e.mgr = m.empno;
 
--natural join
select e.ename, e.sal, d.dname from dept d natural join emp e;
 
--内连接--using子句
select e.ename,e.sal, d.dname from dept d join emp e using(deptno);
 
--通过on指定内连接的条件
select e.ename,e.sal, d.dname from dept d join emp e on d.deptno = e.deptno;
 
--内连接的关键字inner join, inner通常省略
select e.ename,e.sal, d.dname from dept d inner join emp e on d.deptno = e.deptno;
 
--左外连接
select e.ename,e.sal, d.dname from dept d left join emp e on d.deptno = e.deptno;
 
--右连接
select e.ename,e.sal, d.dname from dept d right join emp e on d.deptno = e.deptno;
 
--完全连接
select e.ename,e.sal, d.dname from dept d full join emp e on d.deptno = e.deptno;
 
