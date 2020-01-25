-- Author: JoTing Wong


CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(150)
);

CREATE TABLE employees(
	emp_no VARCHAR(10) PRIMARY KEY,
	birth_date date,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	gender CHAR,
	hire_date date
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date date,
	to_date date
);


CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date date,
	to_date date
);


CREATE TABLE salaries(
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary FLOAT,
	from_date date,
	to_date date
);

CREATE TABLE titles(
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(150),
	from_date date,
	to_date date
);
