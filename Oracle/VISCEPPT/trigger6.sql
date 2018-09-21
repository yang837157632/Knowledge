--创建视图
CREATE OR REPLACE VIEW emp_dept
AS
SELECT d.deptno,d.dname,e.empno,e.ename
FROM dept d, emp e
WHERE d.deptno = e.deptno;
 
 
--创建替代触发器
CREATE OR REPLACE TRIGGER instead_of_trigger
INSTEAD OF
INSERT
ON emp_dept
FOR EACH ROW
DECLARE
    v_temp INT;
BEGIN
    SELECT COUNT(*) INTO v_temp FROM dept WHERE deptno = :new.deptno;
    IF v_temp = 0 THEN
       INSERT INTO dept(deptno,dname)VALUES(:new.deptno,:new.dname);
    END IF;
    SELECT COUNT(*) INTO v_temp FROM emp WHERE empno = :new.empno;
    IF v_temp = 0 THEN
       INSERT INTO emp(empno,ename,deptno) VALUES(:new.empno,:new.ename,:new.deptno);
    END IF;
END;
 
--测试
INSERT INTO emp_dept VALUES(50,'DEVELOPMENT',2222,'ALICE');
 
SELECT * FROM EMP_DEPT
