--输入员工号，判断员工工资, 显示工资小于3000的员工姓名及工资。
--简单的IF语句
DECLARE
      v_name  emp.ename%TYPE;
      v_sal   emp.sal%TYPE;
BEGIN
      SELECT ename,sal
      INTO   v_name,v_sal
      FROM   emp
      WHERE  empno = &no;
      IF   v_sal <3000 THEN
           DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal);
      END IF;
END;
 
 
SELECT * FROM emp;
 
--输入员工号，判断员工工资,将工资小于3000的员工工资涨200，并显示涨工资的员工姓名，其他员工显示员工姓名及工资。
--二重分支语句
DECLARE
       v_name    empnew.ename%TYPE;
       v_sal     empnew.sal%TYPE;
       v_empno   empnew.empno%TYPE := &no;
BEGIN
       SELECT ename,sal
       INTO   v_name,v_sal
       FROM   empnew
       WHERE  empno = v_empno;
       IF  v_sal <3000 THEN
           UPDATE empnew set sal = sal + 200 where empno = v_empno;
           COMMIT;
           DBMS_OUTPUT.put_line(v_name||'涨工资了');
       ELSE
           DBMS_OUTPUT.put_line(v_name||'的工资是：'||v_sal);
       END IF;
END;

select * from empnew;
 
 
--输入员工号，判断员工工资, 工资小于2000，显示低收入，工资小于6000，显示中等收入，其它显示高收入。
--多重分支语句
DECLARE
       v_name    empnew.ename%TYPE;
       v_sal     empnew.sal%TYPE;

BEGIN
       SELECT ename,sal
       INTO   v_name,v_sal
       FROM   empnew
       WHERE  empno = &no;
       IF v_sal<2000  THEN
          DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal||' 属于低收入');
       ELSIF v_sal<6000  THEN
          DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal||' 属于中等收入');
       ELSE
          DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal||' 属于高收入');
       END IF;
END;
