-- Author: JoTing Wong

--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT emp.emp_no AS employee_number,
		emp.last_name,	
		emp.first_name,
		emp.gender,
		sal.salary
FROM employees emp
JOIN salaries sal ON emp.emp_no = sal.emp_no;


--List employees who were hired in 1986.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT mgr.dept_no AS department_number,
		dpt.dept_name AS department_name,
		mgr.emp_no AS employee_number,
		emp.last_name AS last_name,
		emp.first_name AS first_name,
		mgr.from_date AS start_employment_date,
		mgr.to_date AS end_employment_date

FROM dept_manager mgr
JOIN employees emp ON mgr.emp_no = emp.emp_no
JOIN departments dpt ON mgr.dept_no = dpt.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT demp.emp_no AS employee_number,
		emp.last_name,
		emp.first_name,
		dept.dept_name AS department_name

FROM dept_emp demp
JOIN departments dept ON demp.dept_no = dept.dept_no
JOIN employees emp ON demp.emp_no = emp.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT demp.emp_no AS employee_number,
		emp.last_name,
		emp.first_name,
		dept.dept_name AS department_name

FROM dept_emp demp
JOIN departments dept ON demp.dept_no = dept.dept_no
JOIN employees emp ON demp.emp_no = emp.emp_no

WHERE dept_name LIKE 'Sales%';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT demp.emp_no AS employee_number,
		emp.last_name,
		emp.first_name,
		dept.dept_name AS department_name

FROM dept_emp demp
JOIN departments dept ON demp.dept_no = dept.dept_no
JOIN employees emp ON demp.emp_no = emp.emp_no

WHERE dept_name LIKE 'Sales%' OR dept_name LIKE 'Development%';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
		COUNT(emp_no) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
