--获取异常的错误代码和错误信息
BEGIN
    DELETE FROM DEPT WHERE deptno = &deptno;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(SQLCODE||'####'||SQLERRM);
END;
 
 
--非预定义异常的处理
DECLARE
    --1:定义非预定义异常的标识符
    e_fk EXCEPTION;
    --2:将定义好的异常与Oracle错误建立关联
    -- -2292错误代码
    PRAGMA EXCEPTION_INIT(e_fk,-2292);
BEGIN
    DELETE FROM DEPT WHERE deptno = &deptno;
EXCEPTION
    --3:捕获并处理异常
    WHEN e_fk THEN
        DBMS_OUTPUT.PUT_LINE('此部门下有员工，不能删除此部门！');
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(SQLCODE||'####'||SQLERRM);
END;
