1)select name,age from emp where id IN (select emp_id from works where dept_id = 1 AND 2);

3)select w.dept_id,count(w.dept_id)from works w group by w.dept_id having 200<(select sum(w1.pct_time) from works w1 where w1.dept_id=w.dept_id);

4)select e.name from emp e,works w,dept d where e.id = w.dept_id and w.dept_id=d.id and e.salary >all (select max(d2.budget) from dept d2 where d2.id=d.id);

5)select distinct d.manager_id  from dept d  where 200000 <all (select d2.budget from dept d2 where d2.manager_id=d.manager_id);

6)select e.name  from emp e,works w,dept d where e.id=w.dept_id and w.dept_id=d.id and d.budget=(select max(d2.budget) from dept d2);
