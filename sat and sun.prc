---find how many sunday,saturday contains in particular year that is input
create or replace procedure weekends (yr in number)as
v_dt date := to_date('01-jan-'||yr);
begin
for v in 1..add_months (v_dt,12)-v_dt loop
dbms_output.put_line(v_dt);
v_dt:=v_dt+1;
end loop;
end;
/

exec weekends (2020);
----find how many sun sat in 1st month of particular year
create or replace procedure weekends (yr in number) as 
st_dt date :=to_date('01-jan-'||yr);
ed_dt date:=last_day(st_dt);
v_sunday number :=0;
v_saturday number :=0;
begin
while st_dt<=ed_dt loop
if to_char(st_dt,'d') =1 then
v_sunday:=v_sunday+1;
elsif to_char(st_dt,'d') =7 then
v_saturday:=v_saturday+1;
end if;
st_dt :=st_dt+1;
end loop;
dbms_output.put_line('count of sunday:'||v_sunday||'  ,'||'count of saturday:'||v_saturday);
end;
/
exec weekends(2021);