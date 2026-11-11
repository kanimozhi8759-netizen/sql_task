  select * from(
  select * from 
(  select  to_char(add_months(sysdate,level-1),'MON') as all_month from dual 
  connect by level<=12)  am
  left join 
  (select distinct hire_month from (
  select to_char(hire_date,'MON') as hire_month from emp  where to_char(hire_date,'yyyy')=2002) )hm
  on am.all_month=hm.hire_month)
  where 
hire_month is null;



select  to_char(add_months(sysdate,level-1),'mon') from dual 
  connect by level<=12
  minus
  select to_char(hire_date,'mon') from emp where to_char(hire_date,'yyyy')=2002;
  select * from emp where to_char(hire_date,'yyyy')=2002;
  
  
  with a as 
(select * from
(select distinct to_char(hire_date,'yyyy') as year from emp) ,
(select  to_char(add_months(sysdate,level-1),'MONTH') as mon from dual 
  connect by level<=12) ),
b as
(select distinct to_char(hire_date,'yyyy') as year ,to_char(hire_date,'MONTH') as mon from emp)
select a.year,listagg(a.mon,',') within group(order by a.mon) as none_months from a LEFT join b 
  on a.year=b.year and a.mon=b.mon
where b.mon is null
group by a.year;