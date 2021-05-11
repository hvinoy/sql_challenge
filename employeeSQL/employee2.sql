-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/RraK8g
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--drop table departments
--drop table dept_emp
--drop table dept_manager
--drop table employees
--drop table salaries
--drop table titles


CREATE TABLE "departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
	
);
CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(20)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "sex" varchar(20)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);


CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(20)   NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no"),
		
);




CREATE TABLE "dept_manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" integer   NOT NULL,
	primary key (dept_no,emp_no)
);



CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

alter table employees
add foreign key (emp_title_id) references titles(title_id);
 
alter table dept_emp
add FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
add foreign key (dept_no) references departments(dept_no)
;

alter table dept_manager
add foreign key (dept_no) references departments(dept_no),
add foreign key (emp_no) references employees(emp_no);

alter table salaries
add foreign key (emp_no) references employees(emp_no);


select * from titles

----List the following details of each employee: employee number, last name, first name, sex, and salary.
create view q_1 as
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no;

---List first name, last name, and hire date for employees who were hired in 1986.
create view q_2 as
select first_name, last_name, hire_date
from employees 
where hire_date LIKE '%86% ;

----List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
create view q_3 as
select m.dept_no, departments.dept_name,m.emp_no,employees.last_name, employees.first_name
from dept_manager m
left join departments 
on m.dept_no = departments.dept_no
left join employees
on m.emp_no = employees.emp_no;

---List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

create view q_4 as
select e.emp_no, e.last_name,e.first_name
from employees e;


---List first name, last name, and sex for employees whose first name is "Hercules" 
---and last names begin with "B."
create view q_5 as
select e.first_name, e.last_name, e.sex
from employees e
where first_name = 'Hercules'
and last_name like 'B%';

---List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

--subqueries??
select employees.emp_no, employees.last_name, employees.first_name,
select dept_no
from departments
where dept_name = 'Sales';

