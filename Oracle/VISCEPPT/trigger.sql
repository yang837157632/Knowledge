SQL> --当我们对empnew执行删除操作之后，它就会出现一个提示信息，提示：这是删除操作！
SQL> CREATE TRIGGER first_trigger
  2  AFTER DELETE
  3  ON empnew
  4  BEGIN
  5     DBMS_OUTPUT.put_line('这是删除的操作！');
  6  END;
  7  /
Trigger created
 
SQL> SET SERVEROUTPUT ON
SQL> DELETE FROM empnew WHERE empno = 7788;
这是删除的操作！
1 row deleted
