--FOR UPDATE NOWAIT 不等待锁，如发现所操作的数据行已经锁定，将不会等待，立即返回
DECLARE
  --定义游标
  CURSOR empnew_cursor IS SELECT empno,job FROM empnew FOR UPDATE NOWAIT;
BEGIN
  FOR empnew_record IN empnew_cursor LOOP
      DBMS_OUTPUT.put_line(empnew_record.empno||'----'||empnew_record.job);
      IF empnew_record.job = 'PRESIDENT' THEN
        UPDATE empnew SET sal = sal + 1000 WHERE CURRENT OF empnew_cursor;
      ELSIF empnew_record.job = 'MANAGER' THEN
        UPDATE empnew SET sal = sal + 500 WHERE CURRENT OF empnew_cursor;
      ELSE
        UPDATE empnew SET sal = sal + 300 WHERE CURRENT OF empnew_cursor;
      END IF;
  END LOOP;
  COMMIT;
END;
 
SELECT * FROM empnew;
 
--使用OF子句在特定表上加行共享锁
DECLARE
       CURSOR empnew_cursor IS
              SELECT d.dname dname,e.ename ename
              FROM empnew e join dept d on e.deptno = d.deptno
              WHERE e.deptno = &deptno
              FOR UPDATE OF e.deptno;
BEGIN
        FOR empnew_record IN empnew_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('部门名称：'||empnew_record.dname||'员工名：'||empnew_record.ename);
            DELETE FROM empnew WHERE CURRENT OF empnew_cursor;
        END LOOP;
        COMMIT;
END;

SELECT * FROM empnew where deptno = 20;
