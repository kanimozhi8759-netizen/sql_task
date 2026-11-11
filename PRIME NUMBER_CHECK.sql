DECLARE
J NUMBER:=4;
T_F BOOLEAN:=TRUE;
BEGIN
   IF  J<2 THEN
   DBMS_OUTPUT.PUT_LINE('GIVEN NUMBER'||'   '||J ||'   '||'IS NOT PRIME');
   ELSE
        FOR L IN  2..J-1 LOOP
             IF MOD(J,L)=0 THEN
                 T_F:=FALSE;
             EXIT;
             END IF;
        END LOOP;
IF T_F THEN
     DBMS_OUTPUT.PUT_LINE('GIVEN NUMBER'||'   '||J ||'   '||'IS  PRIME');
     ELSE
      dbms_output.put_line('GIVEN NUMBER'||'   '||J ||'   '||'IS NOT PRIME');
     END IF;
 END IF;
end;
/