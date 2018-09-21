--开发示例1
SQL> CREATE OR REPLACE TRIGGER emp_trigger1
  2  BEFORE INSERT OR UPDATE OR DELETE
  3  ON emp
  4  BEGIN
  5     IF to_char(sysdate,'day') IN ('星期六','星期日')THEN
  6        RAISE_APPLICATION_ERROR(-20006,'不能在休息日改变员工信息！');
  7     END IF;
  8  END;
  9  /
Trigger created
 
SQL> delete from emp where empno = 7788;
delete from emp where empno = 7788
ORA-20006: 不能在休息日改变员工信息！
ORA-06512: 在 "SCOTT.EMP_TRIGGER1", line 3
ORA-04088: 触发器 'SCOTT.EMP_TRIGGER1' 执行过程中出错
