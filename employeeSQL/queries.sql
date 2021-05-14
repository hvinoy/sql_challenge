---query 1
----List the following details of each employee: employee number, last name, first name, sex, and salary.
---create view q_1 as
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no;
--query 2
---List first name, last name, and hire date for employees who were hired in 1986.
---create view q_2 as
select first_name, last_name, hire_date
from employees 
where hire_date between '1986-01-01' and '1986-12-31';

select * from employees
---query 3
----List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
---create view q_3 as
select m.dept_no, departments.dept_name,m.emp_no,employees.last_name, employees.first_name
from dept_manager m
left join departments 
on m.dept_no = departments.dept_no
left join employees
on m.emp_no = employees.emp_no;

---List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
---query 4
---create view q_4 as
select e.emp_no, e.last_name,e.first_name,departments.dept_name
from employees e
inner join dept_emp
on e.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no;

---query 5
---List first name, last name, and sex for employees whose first name is "Hercules" 
---and last names begin with "B."
---create view q_5 as
select e.first_name, e.last_name, e.sex
from employees e
where first_name = 'Hercules'
and last_name like 'B%';


---query 6
---List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
---create view q_6 as
select employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';


---query 7
---List all employees in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.
---create view q_7 as
select employees.emp_no, employees.last_name,employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';


---Query 8
---In descending order, list the frequency count of employee last names,
---i.e., how many employees share each last name.
---create view q_8 as
select last_name, count(last_name) as "Last Name Frequency"
from employees
group by last_name
order by "Last Name Frequency" desc;


