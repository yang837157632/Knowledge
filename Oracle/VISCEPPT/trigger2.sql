--案例1：禁止SCOTT用户的DDL操作
CREATE OR REPLACE TRIGGER scott_trigger
BEFORE DDL
ON SCHEMA
BEGIN
   RAISE_APPLICATION_ERROR(-20005,'scott用户禁止所有的DDL操作！');
END;
 
--测试
CREATE SEQUENCE test_seq;
