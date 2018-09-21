--需求：查询员工的员工号、姓名、职位
--显示游标的常规方式
DECLARE
  CURSOR emp_cursor IS SELECT empno,ename,job FROM emp;
  v_empno emp.empno%TYPE;
  v_name  emp.ename%TYPE;
  v_job   emp.job%TYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_empno,v_name,v_job;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('员工号：'||v_empno ||'姓名：'||v_name||'职位：'||v_job);
  END LOOP;
  CLOSE emp_cursor;
END;
 
--游标FOR循环
DECLARE
  CURSOR emp_cursor IS SELECT empno,ename,job FROM emp;
BEGIN
  FOR emp_record IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('员工号：'||emp_record.empno||',姓名：'||emp_record.ename||',职位：'||emp_record.job);
  END LOOP;
END;

--游标FOR循环中引用子查询
BEGIN
  FOR emp_record IN (SELECT empno,ename,job FROM emp) LOOP
    DBMS_OUTPUT.PUT_LINE('员工号：'||emp_record.empno||',姓名：'||emp_record.ename||',职位：'||emp_record.job);
  END LOOP;
END;
 
--参数游标
DECLARE
  CURSOR emp_cursor(dno NUMBER) IS SELECT empno,ename,job FROM emp WHERE deptno = dno;
BEGIN
  FOR emp_record IN emp_cursor(&no) LOOP
    DBMS_OUTPUT.PUT_LINE('员工号：'||emp_record.empno||',姓名：'||emp_record.ename||',职位：'||emp_record.job);
  END LOOP;
END;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

