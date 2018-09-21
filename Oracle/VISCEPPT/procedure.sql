--创建存储过程
CREATE OR REPLACE PROCEDURE first_proc
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('我是过程');
  DBMS_OUTPUT.PUT_LINE('Hello Everyone!');
END;
 
--调用存储过程
BEGIN
  first_proc;
END;
 
 
--删除存储过程
DROP PROCEDURE proc1;
