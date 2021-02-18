-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
LIMIT 10;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
LIMIT 10;

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employee AS e
	ON dm.emp_no = e.emp_no;
	
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employee AS e
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
LIMIT 10;

--5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
	AND
	  last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, dept_emp.last_name, dept_emp.first_name, dept_emp.dept_name
FROM (
	SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp AS de
	JOIN employee AS e
		ON de.emp_no = e.emp_no
	JOIN departments AS d
		ON de.dept_no = d.dept_no
) AS dept_emp
WHERE dept_emp.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, dept_emp.last_name, dept_emp.first_name, dept_emp.dept_name
FROM (
	SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp AS de
	JOIN employee AS e
		ON de.emp_no = e.emp_no
	JOIN departments AS d
		ON de.dept_no = d.dept_no
) AS dept_emp
WHERE dept_emp.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS count_last_name
FROM employee
GROUP BY last_name
ORDER BY count_last_name DESC;
