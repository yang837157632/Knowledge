--GOTO语句
DECLARE
  v_cnt INT := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(v_cnt);
    IF v_cnt=10 THEN
       --EXIT;
       GOTO end_loop;
    END IF;
    v_cnt := v_cnt + 1;
   END LOOP;
   <<end_loop>>
   DBMS_OUTPUT.PUT_LINE('循环结束');
END;
 
--NULL语句
DECLARE
   v_sal empnew.sal%TYPE;
   v_name empnew.ename%TYPE;
BEGIN
  SELECT ename,sal
  INTO v_name,v_sal
  FROM empnew
  WHERE empno = &no;
  IF v_sal<3000 THEN
    UPDATE empnew set comm = nvl(comm,0)+sal*0.2 WHERE ename=v_name;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(v_name||'的奖金更新了');
  ELSE
    NULL;
  END IF;
END;
 
select * from empnew;
