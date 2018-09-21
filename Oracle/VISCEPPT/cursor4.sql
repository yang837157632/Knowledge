--按职工的职称涨工资，总裁涨1000元，经理涨500元，其他员工涨300元。
--1：用显示游标的常规方式实现业务需求
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
 
--2：用游标FOR循环的方式实现业务需求
DECLARE
  --定义游标
  CURSOR empnew_cursor IS SELECT empno,job FROM empnew;
BEGIN
  FOR empnew_record IN empnew_cursor LOOP
      DBMS_OUTPUT.put_line(empnew_record.empno||'----'||empnew_record.job);
      IF empnew_record.job = 'PRESIDENT' THEN
        UPDATE empnew SET sal = sal + 1000 WHERE empno = empnew_record.empno;
      ELSIF empnew_record.job = 'MANAGER' THEN
        UPDATE empnew SET sal = sal + 500 WHERE empno = empnew_record.empno;
      ELSE
        UPDATE empnew SET sal = sal + 300 WHERE empno = empnew_record.empno;
      END IF;
  END LOOP;
  --COMMIT;
END;
 
select * from empnew for update;
 
 
--3：使用游标添加或删除数据时，定义游标时利用FOR UPDATE 子句可以将游标提取出来的数据进行行级锁定
DECLARE
  --定义游标
  CURSOR empnew_cursor IS SELECT empno,job FROM empnew FOR UPDATE;
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
 
 
 
 
