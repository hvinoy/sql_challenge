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
