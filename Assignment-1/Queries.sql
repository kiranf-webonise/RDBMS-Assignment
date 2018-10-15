
select name,age from emp where id IN (select emp_id from works where dept_id = 1 AND 2);
