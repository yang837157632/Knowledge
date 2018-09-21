--基本循环
DECLARE
    v_cnt INT :=1;
BEGIN
    LOOP
          DBMS_OUTPUT.PUT_LINE(v_cnt);
          EXIT WHEN v_cnt = 10;
          v_cnt := v_cnt+1;
    END LOOP;
END;

--while循环
DECLARE
    v_cnt INT :=1;
BEGIN
    WHILE v_cnt<=10 LOOP
          DBMS_OUTPUT.PUT_LINE(v_cnt);
          v_cnt := v_cnt+1;
    END LOOP;
END;
 
--for循环
BEGIN
    FOR i  IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
