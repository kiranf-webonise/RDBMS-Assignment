
1)select name,age from emp where id IN (select emp_id from works where dept_id = 1 AND 2);

2)SELECT (SELECT name FROM emp WHERE id=d.manager_id) AS Manager,GROUP_CONCAT(e.name) As employe_names FROM works w,dept d,emp e WHERE w.dept_id=d.id AND w.emp_id<>d.manager_id AND  e.id=w.emp_id GROUP BY w.dept_id;

4)select e.name from emp e,works w,dept d where e.id = w.dept_id and w.dept_id=d.id and e.salary >all (select max(d2.budget) from dept d2 where d2.id=d.id);

5)select distinct d.manager_id  from dept d  where 200000 <all (select d2.budget from dept d2 where d2.manager_id=d.manager_id);

6)select e.name  from emp e,works w,dept d where e.id=w.dept_id and w.dept_id=d.id and d.budget=(select max(d2.budget) from dept d2);
