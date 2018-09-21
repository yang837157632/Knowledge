--case表达式
select empno,ename,
case job
when 'CLERK' then '办事员'
when 'SALESMAN' then '销售'
when 'MANAGER' then '经理'
when 'ANALYST' then '分析员'
else '总裁'
end
from emp;
 
 
--decode函数
select empno,ename,job,decode(job,'CLERK','办事员','SALESMAN','销售','MANAGER','经理','ANALYST','分析员','总裁')from emp;
 
 
--case表达式，区间值的判断
select empno,ename,sal,
case when sal<2000 then '低'
when sal<5000 then '中'
else '高'
end
from emp;
