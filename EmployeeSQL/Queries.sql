-- SQL Challenge Homework Queries
-- 1) Query to get Employee information including Salary (Join to salaries table)

select 
	e.emp_no,
	last_name,
	first_name,
	sex,
	salary
from 
	employees e
join
	salaries a
on e.emp_no = a.emp_no;

-- 2) Employees hired in 1986

select
	first_name,
	last_name,
	hire_date
from
	employees
where
	hire_date >= '1986-01-01' and
	hire_date <= '1986-12-31';
	
-- 3) Daprtment Managers

select
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
from
	dept_manager dm,
	employees e,
	departments d
where
	dm.emp_no = e.emp_no and
	dm.dept_no = d.dept_no;
	
-- 4) Employee Departments

select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from
	employees e,
	dept_emp de,
	departments d
where
	e.emp_no = de.emp_no and
	de.dept_no = d.dept_no;
	
-- 5) First Name Hercules, Last Name like B%

select 
	first_name,
	last_name,
	sex
from 
	employees
where
	first_name = 'Hercules' and
	last_name like 'B%';
	
-- 6) Employees in Sales

select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name 
from 
	employees e,
	dept_emp de,
	departments d
where
	e.emp_no = de.emp_no and
	de.dept_no = d.dept_no and
	d.dept_name like 'Sales%';

-- 7) Employees in Sales or Development

select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name 
from 
	employees e,
	dept_emp de,
	departments d
where
	e.emp_no = de.emp_no and
	de.dept_no = d.dept_no and
	d.dept_name in ('Sales', 'Development');
	
-- 8) Last name frequency

select
	last_name, 
	count(*) as Last_name_count
from
	employees
group by last_name
order by Last_name_count desc;
