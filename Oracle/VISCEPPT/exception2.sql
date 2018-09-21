--预定义异常处理
DECLARE
  v_name emp.ename%TYPE;
  v_sal  emp.sal%TYPE:=&salary;
BEGIN
  SELECT ename INTO v_name FROM emp WHERE sal = v_sal;
  DBMS_OUTPUT.put_line(v_name||'的工资是：'||v_sal);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.put_line('没有该工资的员工');
  WHEN TOO_MANY_ROWS THEN
     DBMS_OUTPUT.put_line('多个员工具有该工资');
  WHEN OTHERS THEN
     DBMS_OUTPUT.put_line('其他异常');
END;
 
SELECT * FROM EMP;
--800， 一个员工
--1250   多个员工
--8000    0个员工
 

