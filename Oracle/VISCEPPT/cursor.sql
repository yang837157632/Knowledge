--查询所有员工的员工号、姓名和职位的信息。
DECLARE
  --定义游标
  CURSOR emp_cursor IS SELECT empno,ename,job FROM emp;
  v_empno emp.empno%TYPE;
  v_ename emp.ename%TYPE;
  v_job   emp.job%TYPE;
BEGIN
  --打开游标，执行查询
  OPEN emp_cursor;
  --提取数据
  LOOP
       FETCH emp_cursor INTO v_empno,v_ename,v_job;
       DBMS_OUTPUT.PUT_LINE('员工号：'||v_empno||'，姓名：'||v_ename||',职位：'||v_job);
       --什么时候能够退出循环？
       --%FOUND,%NOTFOUND
       --EXIT WHEN emp_cursor%NOTFOUND;
       --EXIT WHEN NOT emp_cursor%FOUND;
       EXIT WHEN emp_cursor%ROWCOUNT=5;
  END LOOP;
  --关闭游标
  CLOSE emp_cursor;
END;

--查询所有员工的员工号、姓名和职位的信息。
DECLARE
  --定义游标
  CURSOR emp_cursor IS SELECT empno,ename,job FROM emp;
  v_empno emp.empno%TYPE;
  v_ename emp.ename%TYPE;
  v_job   emp.job%TYPE;
BEGIN
  --打开游标，执行查询
  --OPEN emp_cursor;
  --检测游标是否打开
  IF emp_cursor%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('游标已经打开');
  ELSE
    DBMS_OUTPUT.PUT_LINE('游标没有打开');
  END IF;
 
END;
 
 
--按职工的职称涨工资，总裁涨1000元，经理涨500元，其他员工涨300元。
DECLARE
  --定义游标
  CURSOR empnew_cursor IS SELECT empno,job FROM empnew;
  v_empno empnew.empno%TYPE;
  v_job   empnew.job%TYPE;
BEGIN
  --打开游标
  OPEN empnew_cursor;
  --提取数据
  LOOP
    FETCH empnew_cursor INTO v_empno,v_job;
    IF v_job='PRESIDENT' THEN
      UPDATE empnew SET sal = sal + 1000 WHERE empno = v_empno;
    ELSIF v_job='MANAGER' THEN
      UPDATE empnew SET sal = sal + 500 WHERE empno = v_empno;
    ELSE
      UPDATE empnew SET sal = sal + 300 WHERE empno = v_empno;
    END IF;
    EXIT WHEN empnew_cursor%NOTFOUND;
  END LOOP;
  COMMIT;
  --关闭游标
  CLOSE empnew_cursor;
END;
 
SELECT * FROM empnew;
