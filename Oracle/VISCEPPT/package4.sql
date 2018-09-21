--示例一：调用emp_package包下添加员工信息的存储过程
DECLARE
    v_empno emp.empno%TYPE:=&empno;
    v_ename emp.ename%TYPE:='&name';
    v_sal   emp.sal%TYPE:=&salary;
    v_deptno emp.deptno%TYPE:=&deptno;
    e_dup_val  EXCEPTION;
    e_no_dept  EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_dup_val,-20001);
    PRAGMA EXCEPTION_INIT(e_no_dept,-20008);
BEGIN
    emp_package.add_emp_proc(v_empno,v_ename,v_sal,v_deptno);
    COMMIT;
EXCEPTION
    WHEN e_dup_val THEN
         DBMS_OUTPUT.put_line(SQLERRM);
    WHEN e_no_dept THEN
         DBMS_OUTPUT.put_line(SQLERRM);
    ROLLBACK;
END;
 
SELECT * FROM EMP;
 
--示例二：调用emp_package包下删除指定员工的存储过程
DECLARE
    v_empno emp.empno%TYPE:=&empno;
    e_no_emp   EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_emp,-20009);
BEGIN
    emp_package.del_emp_proc(v_empno);
    COMMIT;
EXCEPTION
    WHEN e_no_emp THEN
        DBMS_OUTPUT.put_line(SQLERRM);
        ROLLBACK;
END;
 
--示例三：调用emp_sal_pkg包下函数和过程
DECLARE
        v_empno emp.empno%TYPE := &empno;
        v_salary emp.sal%TYPE;
        e_no_emp   EXCEPTION;
        PRAGMA EXCEPTION_INIT(e_no_emp,-20008);
BEGIN
        v_salary:= emp_sal_pkg.get_sal(v_empno);
        emp_sal_pkg.upd_sal(v_empno,v_salary);
        COMMIT;
EXCEPTION
    WHEN e_no_emp THEN
        DBMS_OUTPUT.put_line(SQLERRM);
END;
 
--用SQLPLUS命令调用（下述命令请在command窗口或SQLPLUS窗口执行）
/*
VAR  v_empno  NUMBER
EXEC :v_empno := &no
VAR  v_salary  NUMBER
EXEC :v_salary := emp_sal_pkg.get_sal(:v_empno)
EXEC emp_sal_pkg.upd_sal(:v_empno, :v_salary)
*/
 
--删除包
DROP PACKAGE first_package;
--删除包体
DROP PACKAGE BODY first_package;
