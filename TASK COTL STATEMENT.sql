--1.
DECLARE 
V_AMNT NUMBER:=7000;
V_DIS NUMBER;
BEGIN
IF V_AMNT>5000 THEN
V_DIS:=V_AMNT-(V_AMNT*10/100);
DBMS_OUTPUT.PUT_LINE('YOU GET A DISTCOUNT ,NOW YOUR AMOUNT IS '||V_DIS);
ELSE
DBMS_OUTPUT.PUT_LINE('YOUR AMOUNT IS'||' '||V_AMNT);
END IF;
END;
/
--2
DECLARE
V_MARK NUMBER:=29;
V_RESULT VARCHAR2(50);
BEGIN
V_RESULT:=CASE  WHEN V_MARK>90 THEN 'OUTSTANDING'
                                     WHEN V_MARK BETWEEN 75 AND 90 THEN 'EXCELLENT'
                                     WHEN V_MARK BETWEEN 50 AND 74 THEN 'AVERAGE'
                                     WHEN V_MARK<50  THEN 'FAIL but its ok dont be feel'
                                     END ;
 DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;
/
--3.
declare 
v_role varchar2(20):=upper('manager');
V_BONUS NUMBER ;
begin
if v_role='MANAGER' THEN
V_BONUS:=SALARY+(SALARY*20/100);
ELSIF v_role='DEVELOPER' THEN
V_BONUS:=SALARY+(SALARY*15/100);
ELSIF v_role='TESTER' THEN
V_BONUS:=SALARY+(SALARY*10/100);
ELSE
V_BONUS:=SALARY+(SALARY*5/100);
END IF;
DBMS_OUTPUT.PUT_LINE(V_BONUS);
end;
SELECT FIRST_NAME,JOB_TITLE ,salary FROM EMP JOIN JOBS ON EMP.JOB_ID=JOBS.JOB_ID ;

declare
v_bonus number;
begin
for j in (SELECT FIRST_NAME ,JOB_TITLE ,SALARY 
      FROM EMP JOIN JOBS ON EMP.JOB_ID=JOBS.JOB_ID )loop
if upper(j.job_title)='PRESIDENT' then
v_bonus :=j.salary+(j.salary*20/100);
dbms_output.put_line(j.first_name||'  '||j.job_title||'  '||j.salary||'  '||v_bonus);
elsif upper(j.job_title)='ACCOUNTANT' then
v_bonus :=j.salary+(j.salary*10/100);
dbms_output.put_line(j.first_name||'  '||j.job_title||'  '||j.salary||'  '||v_bonus);
end if;
end loop;
end;
/

--4.

declare 
a number:=0;
begin
while a<7 loop
a:=a+1;
dbms_output.put_line(a);
end loop;
end;
/
--6.
declare
v number:=6;
begin
while v<=60 loop
dbms_output.put_line(v);
v:=v+6;
end loop;
end;
/
--------------------

begin
for j in 1..20 loop
dbms_output.put_line('6x'||j||'='||j*6);
end loop;
end;
/


--7.

begin
for j in 1..20 loop
if mod(j,5)=0 then
continue;
end if;
dbms_output.put_line(j);
end loop;
end;
/
---8------------------------------
declare
v_fail boolean:=true;
begin
if v_fail then
dbms_output.put_line('ALERT!');
ELSE
dbms_output.put_line('JOB SUCCESSFUL');
END IF;
end;
/
--9--------------------------------------------
DECLARE
V_COLOR VARCHAR2(50):=upper('YELLOW');
V_SIGNAL VARCHAR2(30);
BEGIN
v_color :=case when v_color ='RED' then  'stop'
                         when v_color ='YELLOW' then  'wait'
                         when v_color ='GREEN' then  'go'
                         end ;
dbms_output.put_line(v_color);                         
END;
/
--10----------------------------------------
declare
v_star varchar2(100);
begin
for j in 1..5 loop
v_star:=lpad('*',j,'*');
dbms_output.put_line(v_star);
end loop;
 end;
 /

----------------------------------------------------------------------
--1..print a reverse triangle 
 declare 
 v_star varchar2(50);
 begin
  for i in reverse 1..5 loop  
 v_star:=lpad('*',i,'*');
 dbms_output.put_line(v_star);
 end loop;
 end;
 /
 
 --2..display all even number between 1 and 20

 begin
  for i in 1..20 loop  
if mod(i,2)=0 then
 dbms_output.put_line(i);
 end if;
end loop;
 end;
 /
 --3.dislay odd number between 1 and 20
 
 begin
  for i in 1..20 loop  
if mod(i,2)=1 then
 dbms_output.put_line(i);
 end if;
end loop;
 end;
 /
 --4.calculate the factorial of agiven number using a loop
 
 declare
 v_num number:=4;
 v_fac number:=1;
 begin
 for i in 1..v_num loop
 v_fac:=v_fac*i;
 dbms_output.put_line(v_fac);
 end loop;
 end;
 /
 --5.find sum of the first 10 natural numbers
  declare
 v_num number:=0;
 begin
 for i in 1..10 loop
 v_num:=v_num+i;
end loop;
dbms_output.put_line(v_num);
 end;
 /
select 1+2+3+4+5+6+7+8+9+10 from dual; 

---6.
  declare
 v_num number:=0;
 v_number number:=1;
 begin
 for i in 1..10 loop
 dbms_output.put_line(v_num);
v_number:=v_num+v_number;
v_num:=v_num+v_number;
 dbms_output.put_line(v_number);
end loop;
 end;
 /
 ----------------
 
 declare
 a number :=0;
  b number :=1;
  c number ;
  begin
  dbms_output.put_line(a);
   dbms_output.put_line(b);
     for j in 1..3 loop
     c:=a+b;
        dbms_output.put_line(c);
     a:=b;
     b:=c;
     end loop;
end ;
/
--7.-------------------------------------------
--print number 1 to 10  using a loop and stop when the number reaches 8.

declare
a number:=1;
begin
while a<=8 loop
dbms_output.put_line(a);
a:=a+1;
end loop;
end;
/
------------------------------------------------------------------------
--8 .from list of number ,skip negative values and print only positive ones
declare
type t1 is table of varchar2(25);
v_number t1:=t1(1,-2,3,-4,5);
begin
for j in 1..v_number.count loop
if v_number(j) >0 then
dbms_output.put_line(v_number(j));
end if;
end loop;
end;
/
--9--leap check---------------------------------------------------
declare
v_year number:=2021;
begin
if mod( v_year,4)=0 then
dbms_output.put_line('given year is leap');
else
dbms_output.put_line('given year is not leap');
end if;
end;
/
--10---------------------------------------------------
---print the multiplication table of a number entered by the user

declare
v_num number:=&i;
begin
for j in 1..10 loop
dbms_output.put_line(j||'x'||v_num||'='||j*v_num);
end loop;
end;
/












































