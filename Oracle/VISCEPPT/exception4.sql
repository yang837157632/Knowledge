--自定义异常
DECLARE
  v_empno emp.empno%TYPE:=&empno;
  --1：定义异常
  e_no_result EXCEPTION;
BEGIN
  UPDATE emp SET sal = sal + 100 WHERE empno = v_empno;
  IF SQL%NOTFOUND THEN
	--2：指定触发异常的时机
    RAISE e_no_result;
  ELSE
    COMMIT;
  END IF;
EXCEPTION
    --3：捕捉并处理异常
  WHEN e_no_result THEN
    DBMS_OUTPUT.put_line('数据更新失败！');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('其他错误');
END;


