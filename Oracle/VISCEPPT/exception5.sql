--异常处理函数SQLCODE和SQLERRM的使用
DECLARE
  v_empno emp.empno%TYPE:= &empno;
  v_ename emp.ename%TYPE:= '&ename';
  v_deptno emp.deptno%TYPE:= &deptno;
BEGIN
  INSERT INTO emp(empno,ename,deptno)VALUES(v_empno,v_ename,v_deptno);
  IF SQL%FOUND THEN
    DBMS_OUTPUT.put_line('数据插入成功！');
    COMMIT;
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('错误号：'||SQLCODE);
    DBMS_OUTPUT.put_line('错误信息：'||SQLERRM);
END;
