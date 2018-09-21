--案例2：
--创建一个记录数据库对象DDL操作的日志表
create table object_log(
       logid number constraint pk_logid primary key,
       operatedate date not null，
       objecttype varchar2(50) not null,
       objectowner varchar2(50) not null
);
 
CREATE SEQUENCE object_log_seq;
 
--创建触发实现对数据库对象DDL操作记录的触发器
CREATE OR REPLACE TRIGGER object_trigger
AFTER CREATE OR DROP OR ALTER
ON DATABASE
BEGIN
  INSERT INTO object_log(logid,operatedate,objecttype,objectowner)
  VALUES(object_log_seq.nextval,sysdate,ORA_DICT_OBJ_TYPE,ORA_DICT_OBJ_OWNER);
END;
 
--测试
conn yanln/yanln
create sequence test_seq1;
 
conn system/password
select * from object_log;
