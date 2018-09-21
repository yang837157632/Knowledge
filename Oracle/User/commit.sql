--演示事务的三个语句（commit,savepoint,rollback）的作用
delete from emp_bak where empno=7369;
commit;
 
update emp_bak set sal=5555 where empno=7499;
savepoint a;
update emp_bak set sal=6666 where empno=7499;
savepoint b;
 
select * from emp_bak;
rollback to a;
rollback;
