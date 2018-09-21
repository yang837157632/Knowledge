--1:创建带有输入参数的存储函数
--根据部门编号返回该部门的总工资
CREATE OR REPLACE FUNCTION func1
(v_deptno IN NUMBER)
RETURN NUMBER
IS
       v_sumsal NUMBER;
BEGIN
       SELECT SUM(SAL) INTO v_sumsal FROM emp WHERE deptno = v_deptno;
       RETURN v_sumsal;
EXCEPTION
       WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('没有此部门！');
       WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
 
--调用带有输入参数的函数
BEGIN
  DBMS_OUTPUT.put_line('部门的工资总额'||func1(&no));
END;
 
 
 
--2:创建带有输出参数的存储函数
--根据员工号输出员工的姓名和员工的工资，并且返回员工的年收入
CREATE OR REPLACE FUNCTION func2
(v_empno IN emp.empno%TYPE, v_name OUT emp.ename%TYPE, v_sal OUT emp.sal%TYPE)
RETURN NUMBER
IS
       v_salsum NUMBER;
BEGIN
       SELECT ename,sal,(sal+nvl(comm,0))*12
       INTO v_name,v_sal,v_salsum
       FROM emp
       WHERE empno = v_empno;
       RETURN v_salsum;
EXCEPTION
       WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.put_line('没有此员工！');
       WHEN OTHERS THEN
            DBMS_OUTPUT.put_line(SQLERRM);
END;
 
--调用带有输出参数的函数
DECLARE
   v_name emp.ename%TYPE;
   v_sal  emp.sal%TYPE;
   v_salsum NUMBER;
BEGIN
  v_salsum := func2(&no,v_name,v_sal);
  DBMS_OUTPUT.put_line('姓名：'||v_name);
  DBMS_OUTPUT.put_line('工资：'||v_sal);
  DBMS_OUTPUT.put_line('年收入：'||v_salsum);
END;
 
 
 
--3：创建带有输入输出参数的存储函数
--求两个数的平方和，并输出两个数的平方
 
CREATE OR REPLACE FUNCTION func3
(n1 IN OUT NUMBER, n2 IN OUT NUMBER)
RETURN NUMBER
AS
BEGIN
  n1 := n1*n1;
  n2 := n2*n2;
  RETURN n1+n2;
END;
 
--调用带有输入输出参数的函数
DECLARE
  v_n1 number :=5;
  v_n2 number :=6;
  v_sum number;
BEGIN
  v_sum := func3(v_n1,v_n2);
  DBMS_OUTPUT.put_line('N1的平方：'||v_n1);
  DBMS_OUTPUT.put_line('N2的平方：'||v_n2);
  DBMS_OUTPUT.put_line('平方和：'||v_sum);
END;
 
 
