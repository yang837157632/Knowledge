--隐式数据类型转换的举例
select * from emp where sal>'2000';
select * from emp where hiredate='02-4月-81';
 
--to_char 日期类型转换成字符类型
select to_char(hiredate,'YYYY-MM-DD') from emp;
select to_char(hiredate,'YYYY"年"MM"月"DD"日"') from emp;
select to_char(hiredate,'DD-MON-RR','NLS_DATE_LANGUAGE=AMERICAN') from emp;
 
--to_char 数值类型转换成字符类型
select sal,to_char(sal,'L0,000,000.00')from emp;
select sal,to_char(sal,'L9,999,999.99')from emp;
select sal,to_char(sal,'$9,999,999.99')from emp;
 
--to_date  字符类型转换成日期类型
select ename,hiredate from emp where hiredate>to_date('1981-12-31','YYYY-MM-DD');
 
--to_number  字符类型转换成数值类型
select ename,sal from emp where sal>to_number('￥2000','L99999');
