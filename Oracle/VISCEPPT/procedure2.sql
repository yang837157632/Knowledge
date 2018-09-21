--1：创建输入参数的存储过程
--根据员工号删除指定的员工信息
CREATE OR REPLACE PROCEDURE proc1
(v_empno IN empnew.empno%TYPE)
IS
BEGIN
  --根据员工号删除指定的员工信息
  DELETE FROM empnew WHERE empno = v_empno;
  --判断是否删除成功
  IF SQL%NOTFOUND THEN
    -- -20000~ -20999之间
    RAISE_APPLICATION_ERROR(-20008,'指定删除的员工不存在！');
  ELSE
    DBMS_OUTPUT.put_line('删除成功！');
  END IF;
END;
 
--调用带有输入参数的存储过程
begin
  proc1(1234);
end;
 
 
 
 
--2;创建带有输出参数的存储过程
--求指定部门的平均工资和总人数
CREATE OR REPLACE PROCEDURE proc2
(v_deptno IN NUMBER, v_avgsal OUT NUMBER, v_cnt out NUMBER)
IS
BEGIN
  SELECT AVG(sal),COUNT(*)
  INTO v_avgsal, v_cnt
  FROM emp
  WHERE deptno = v_deptno;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.put_line('没有此部门！');
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line(SQLERRM);
END;
 
--调用带有输出参数的存储过程
DECLARE
   v_avgsalary NUMBER;
   v_count     NUMBER;
BEGIN
   PROC2(10,v_avgsalary,v_count);
   DBMS_OUTPUT.put_line('平均工资:'||v_avgsalary);
   DBMS_OUTPUT.put_line('总人数:'||v_count);
END;
 
 

 
--3：创建带有输入输出参数的存储过程
--实现两个数的交换
CREATE OR REPLACE PROCEDURE proc3
(v_num1 IN OUT NUMBER, v_num2 IN OUT NUMBER)
AS
  v_temp NUMBER := 0;
BEGIN
  v_temp:= v_num1;
  v_num1:= v_num2;
  v_num2:= v_temp;
END;
 
--调用带有输入输出参数的存储过程
DECLARE
   v_n1 NUMBER := 5;
   v_n2 NUMBER := 10;
BEGIN
   PROC3(v_n1,v_n2);
   DBMS_OUTPUT.put_line('N1:'||v_n1);
   DBMS_OUTPUT.put_line('N2:'||v_n2);
END;
 
