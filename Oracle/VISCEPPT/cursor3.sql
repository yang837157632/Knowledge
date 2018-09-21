--根据用户输入的员工号，更新指定员工的工资，比如工资涨100
--隐式游标
BEGIN
  UPDATE empnew SET sal = sal + 100 WHERE empno = &no;
  IF SQL%FOUND THEN
    DBMS_OUTPUT.put_line('成功修改员工的工资');
    COMMIT;
  ELSE
    DBMS_OUTPUT.put_line('修改员工工资失败!');
    ROLLBACK;
  END IF;
END;
 
SELECT * FROM empnew;
