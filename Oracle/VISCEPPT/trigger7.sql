--连接sys用户
--创建事件表
CREATE   TABLE   event_table(
	event varchar2(50),
	event_time date
);
 
--再创建一个系统触发器
create or replace trigger startup_trigger
after startup on database
begin
  insert into event_table values(ora_sysevent,SYSDATE);
end;
 
 
--在SQLPLUS窗口执行下列命令
SHUTDOWN
STARTUP
SELECT    *   FROM event_table;
