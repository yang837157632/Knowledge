--创建包规范
CREATE OR REPLACE PACKAGE emp_package
IS
       --添加员工信息的存储过程
       PROCEDURE add_emp_proc
       (v_empno IN emp.empno%TYPE,
        v_ename IN emp.ename%type,
        v_sal   IN emp.sal%type,
        v_deptno IN emp.deptno%type);

        --删除员工信息的存储过程
        PROCEDURE del_emp_proc
        (v_empno IN emp.empno%type);
END emp_package;
 
--创建包体
CREATE OR REPLACE PACKAGE BODY emp_package
IS
        --添加员工信息的存储过程
       PROCEDURE add_emp_proc
       (v_empno IN emp.empno%TYPE,
        v_ename IN emp.ename%type,
        v_sal   IN emp.sal%type,
        v_deptno IN emp.deptno%type)
        IS
                 e_2291  EXCEPTION;
                 PRAGMA EXCEPTION_INIT(e_2291,-2291);

        BEGIN
                 INSERT INTO emp(empno, ename, sal, deptno) VALUES(v_empno,v_ename,v_sal,v_deptno);
        EXCEPTION
                 WHEN DUP_VAL_ON_INDEX THEN
                   RAISE_APPLICATION_ERROR(-20001,'员工号不能重复');
                 WHEN e_2291 THEN
                   RAISE_APPLICATION_ERROR(-20008,'部门号不存在');

        END;

        --删除员工信息的存储过程
        PROCEDURE del_emp_proc
        (v_empno IN emp.empno%type)
        IS
        BEGIN
          --根据员工号删除指定的员工信息
          DELETE FROM emp WHERE empno = v_empno;
          --判断是否删除成功
          IF SQL%NOTFOUND THEN
             RAISE_APPLICATION_ERROR(-20009,'指定删除的员工不存在');
          ELSE
             DBMS_OUTPUT.put_line('删除成功');
          END IF;
        END;
END emp_package;
