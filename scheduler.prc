BEGIN
dbms_scheduler.create_job
  (
job_name=>'del_even',
job_type=>'stored_procedure',
job_action=>'livi',
start_date=>'07/jan/2026 08:13:00 pm',
repeat_interval=>'freq =secondly; interval=5 ;',
end_date=>'07/jan/2026 08:18:00 pm',
auto_drop=>true,
enabled=>true,
comments=>'this job delete even numbers every 5 sec'
);
END;
/
select * from user_scheduler_jobs;
execute dbms_scheduler.drop_job('ODD_DEL')

CREATE OR REPLACE PROCEDURE LIVI AS 
BEGIN
DELETE FROM EMP WHERE  rownum=1 and MOD(EMPLOYEE_ID,2)=0;
END;
/
select * from emp;
select systimestamp from dual;
drop table emp;
create table emp as select * from employees;
