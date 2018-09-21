DECLARE
    v_name  VARCHAR2(10);
    v_sal   NUMBER(7,2);
    v_hiredate  DATE;
    c_tax_rate  CONSTANT  NUMBER(3,2) := 0.02;
    v_tax_sal   NUMBER(7,2);
    v_valid     BOOLEAN  DEFAULT TRUE;
BEGIN
    SELECT ename,sal,hiredate
    INTO   v_name,v_sal,v_hiredate
    FROM   emp
    WHERE  empno = 7369;
    --计算所得税
    v_tax_sal:= v_sal * c_tax_rate;
    --打印输出
    DBMS_OUTPUT.PUT_LINE(v_name||'的工资是：'||v_sal||' 雇员日期是：' || v_hiredate|| ' 所得税是：' || v_tax_sal);
    IF v_valid THEN
       DBMS_OUTPUT.PUT_LINE('已核实');
    END IF;
END;
