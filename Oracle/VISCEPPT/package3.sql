--根据员工号查询工资，如果工资小于等于3000，工资涨500.
--创建包规范
CREATE OR REPLACE PACKAGE emp_sal_pkg
IS
       FUNCTION get_sal(eno NUMBER)RETURN NUMBER;

       PROCEDURE upd_sal(eno NUMBER, salary NUMBER);
END emp_sal_pkg;
 
--包体
CREATE OR REPLACE PACKAGE BODY emp_sal_pkg
IS
	   --根据员工号查询员工的工资
       FUNCTION get_sal(eno NUMBER)RETURN NUMBER
       IS
                v_sal emp.sal%TYPE:= 0;
       BEGIN
                SELECT sal INTO v_sal FROM emp WHERE empno = eno;
                RETURN v_sal;
       EXCEPTION
                WHEN NO_DATA_FOUND THEN
                     RAISE_APPLICATION_ERROR(-20008,'此员工号不存在！');
       END;

	   --更新满足条件的员工的工资
       PROCEDURE upd_sal(eno NUMBER, salary NUMBER)
       IS
       BEGIN
                IF salary<=3000 THEN
                    UPDATE emp SET sal = sal + 500 WHERE empno = eno;
                END IF;
       END;
END  emp_sal_pkg;
