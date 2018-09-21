--创建函数
CREATE OR REPLACE FUNCTION first_func
RETURN VARCHAR2
IS
BEGIN
  DBMS_OUTPUT.put_line('我是函数');
  RETURN 'Hello Everyone!';
END;
 
 
--调用存储函数
BEGIN
  DBMS_OUTPUT.put_line(first_func);
END;
 
 
--删除存储函数
DROP FUNCTION func1;
 
