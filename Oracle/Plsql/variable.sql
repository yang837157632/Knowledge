--引用型变量
DECLARE
    v_name  emp.ename%TYPE;
    v_sal   emp.sal%TYPE;
BEGIN
    SELECT ename,sal
    INTO   v_name,v_sal
    FROM   emp
    WHERE  empno = 7788;
    --打印输出
    DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal);
END;
 
--记录型变量
DECLARE
    emp_record   emp%ROWTYPE;
BEGIN
    SELECT *  INTO emp_record FROM emp WHERE empno = 7788;
    --打印输出
    DBMS_OUTPUT.PUT_LINE(emp_record.ename||'的工资是：'||emp_record.sal);
END;
