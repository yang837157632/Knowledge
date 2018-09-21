--根据员工号或员工姓名获取员工的信息
--根据员工号或员工姓名删除员工的信息
--创建包规范
CREATE OR REPLACE PACKAGE overload_pkg
IS
       FUNCTION get_info(eno NUMBER) RETURN emp%ROWTYPE;
       FUNCTION get_info(name VARCHAR2) RETURN emp%ROWTYPE;

       PROCEDURE del_emp(eno NUMBER);
       PROCEDURE del_emp(name VARCHAR2);
END;
 
--创建包体
CREATE OR REPLACE PACKAGE BODY overload_pkg
IS
       FUNCTION get_info(eno NUMBER) RETURN emp%ROWTYPE
       IS
                emp_record  emp%ROWTYPE;
       BEGIN
                SELECT * INTO emp_record FROM emp WHERE empno = eno;
                RETURN emp_record;
       EXCEPTION
                WHEN NO_DATA_FOUND THEN
                     RAISE_APPLICATION_ERROR(-20020,'不存在此员工！');
       END;

       FUNCTION get_info(name VARCHAR2) RETURN emp%ROWTYPE
       IS
                emp_record  emp%ROWTYPE;
       BEGIN
                SELECT * INTO emp_record FROM emp WHERE ename = name;
                RETURN emp_record;
       EXCEPTION
                WHEN NO_DATA_FOUND THEN
                     RAISE_APPLICATION_ERROR(-20020,'不存在此员工！');
       END;

       PROCEDURE del_emp(eno NUMBER)
       IS
       BEGIN
                 DELETE FROM emp WHERE empno = eno;
                 IF SQL%NOTFOUND THEN
                    RAISE_APPLICATION_ERROR(-20020,'不存在此员工');
                 END IF;
       END;

       PROCEDURE del_emp(name VARCHAR2)
       IS
       BEGIN
                 DELETE FROM emp WHERE ename = name;
                 IF SQL%NOTFOUND THEN
                    RAISE_APPLICATION_ERROR(-20020,'不存在此员工');
                 END IF;
       END;
END;
 
--调用
--根据员工号查询员工信息
DECLARE
       emp_record emp%rowtype;
       e_no_emp  EXCEPTION;
       PRAGMA EXCEPTION_INIT(e_no_emp,-20020);
BEGIN
       emp_record:= overload_pkg.get_info(&no);
       DBMS_OUTPUT.PUT_LINE('员工号：'||emp_record.empno||'姓名：'||emp_record.ename||'工资：'||emp_record.sal);
EXCEPTION
       WHEN e_no_emp THEN
            DBMS_OUTPUT.put_line(SQLERRM);
END;
 
--根据员工姓名查询员工信息
DECLARE
       emp_record emp%rowtype;
       e_no_emp  EXCEPTION;
       PRAGMA EXCEPTION_INIT(e_no_emp,-20020);
BEGIN
       emp_record:= overload_pkg.get_info('&name');
       DBMS_OUTPUT.PUT_LINE('员工号：'||emp_record.empno||'姓名：'||emp_record.ename||'工资：'||emp_record.sal);
EXCEPTION
       WHEN e_no_emp THEN
            DBMS_OUTPUT.put_line(SQLERRM);
END;
 
--根据员工号删除员工信息
DECLARE
       e_no_emp EXCEPTION;
       PRAGMA EXCEPTION_INIT(e_no_emp, -20020);
BEGIN
       overload_pkg.del_emp(&no);
       COMMIT;
EXCEPTION
       WHEN e_no_emp THEN
            DBMS_OUTPUT.put_line(SQLERRM);
       ROLLBACK;
END;
 
SELECT * FROM EMP;
 
--根据员工的姓名删除员工的信息
DECLARE
       e_no_emp EXCEPTION;
       PRAGMA EXCEPTION_INIT(e_no_emp, -20020);
BEGIN
       overload_pkg.del_emp('&name');
       COMMIT;
EXCEPTION
       WHEN e_no_emp THEN
            DBMS_OUTPUT.put_line(SQLERRM);
       ROLLBACK;
END;
