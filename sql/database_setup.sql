-- Create tables
CREATE TABLE title (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20)
);

CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30)
);


CREATE TABLE employee (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY(emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE salaries (
	emp_no INTEGER PRIMARY KEY,
	salary INTEGER,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(10),
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
	emp_no INTEGER,
	dept_no VARCHAR(10),
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- Import data
-- Step 1, import title data
COPY title
FROM '/Users/simonxu/data_du/hw/09-SQL/data/titles.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM title;

-- Step 2, import departments data
COPY departments
FROM '/Users/simonxu/data_du/hw/09-SQL/data/departments.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM departments;

-- Step 3, import employee data
COPY employee 
FROM '/Users/simonxu/data_du/hw/09-SQL/data/employees.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM employee
LIMIT 10;

-- STEP 4, import salary data
COPY salaries 
FROM '/Users/simonxu/data_du/hw/09-SQL/data/salaries.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM salaries
LIMIT 10;

-- STEP 5, import dept_emp data
COPY dept_emp 
FROM '/Users/simonxu/data_du/hw/09-SQL/data/dept_emp.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_emp
LIMIT 10;

-- STEP 6, import dept_manager data
COPY dept_manager (dept_no, emp_no)
FROM '/Users/simonxu/data_du/hw/09-SQL/data/dept_manager.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_manager;