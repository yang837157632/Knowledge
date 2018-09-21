--创建包规范
CREATE OR REPLACE PACKAGE first_package
IS
       v_no emp.deptno%TYPE:=10;
       --过程
       PROCEDURE query_emp(v_deptno IN NUMBER DEFAULT v_no,v_avgsal OUT NUMBER, v_cnt OUT NUMBER);
END first_package;
 
--创建包体
CREATE OR REPLACE PACKAGE BODY first_package
IS
       PROCEDURE query_emp(v_deptno IN NUMBER DEFAULT v_no,v_avgsal OUT NUMBER, v_cnt OUT NUMBER)
       IS
       BEGIN
            SELECT avg(sal), count(*)
            INTO v_avgsal, v_cnt
            FROM emp
            WHERE deptno = v_deptno;
       EXCEPTION
            WHEN NO_DATA_FOUND THEN
                 DBMS_OUTPUT.put_line('没有此部门！');
            WHEN OTHERS THEN
                 DBMS_OUTPUT.put_line(SQLERRM);
       END;
END first_package;
 
--调用
DECLARE
    v_avgsal NUMBER;
    v_cnt    NUMBER;
BEGIN
    first_package.query_emp(20,v_avgsal,v_cnt);
	--v_deptno采用默认值时，需要使用名称传递这种传值方式
	--first_package.query_emp(v_avgsal => v_avgsal,v_cnt => v_cnt);
    DBMS_OUTPUT.put_line('平均工资：'||v_avgsal);
    DBMS_OUTPUT.put_line('总人数：'||v_cnt);
END;
