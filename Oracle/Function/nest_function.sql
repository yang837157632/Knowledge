--参照雇员信息表，想显示距聘用日期3个月后的下一个星期一的日期，且日期格式如：2017-01-06。
select empno,ename,to_char(next_day(add_months(hiredate,3),'星期一'),'YYYY-MM-DD') new_date
from emp;
 
--参照雇员信息表，显示雇员日薪并四舍五入到2 位小数的结果，然后对薪资格式以‘￥ 1,182.19’这样的例子形式进行格式化
select empno,ename,sal,to_char(round(sal/30,2),'L9,999.99')
from emp;
