--sysdate
select sysdate-1 昨天 , sysdate 今天, sysdate+1 明天 from dual;
 
--months_between
select round(months_between(sysdate,hiredate)/12)from emp;
 
--add_months
select ename,add_months(hiredate,30*12) from emp;
 
--next_day
select next_day(sysdate,'星期一')from dual;
 
--last_day
select sysdate,last_day(sysdate) from dual;
select empno,ename,last_day(hiredate) from emp;
 
--round
select hiredate, round(hiredate,'YEAR'), round(hiredate,'MONTH') from emp where empno=7654;
 
--trunc
select hiredate, trunc(hiredate,'YEAR'), trunc(hiredate,'MONTH') from emp where empno=7654;
