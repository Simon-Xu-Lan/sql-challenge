# Conceptual Database Design

<img src="images/conceptual-ERD.png" alt="conceptual ERD" width="1000" />

## Assumption:

1. An employee has one and only one salary

- An employee can only have one salary
- An employee with zero salary with record 0 in salary table

2. A salary is related to one and only one employee

- Salaries with no employee will not added to the database
- Each salary record connected to one employee

3. An employee has one and only on title
4. One title can apply to one and many employee

- Many employee can have the same title

5. A department has zero and many employee

- A department can be added to database before having any employee
- A department can have one and many employee

6.  An employee can belong to one and many department

- An employee can work on multi departements

7. A department has one and many managers/employee
8. A manager/employee manage one and only one department

## Relationship:

- employee and salaries: one to one relatioinship

- employee and title: one to many relationship

- employee and departments: Many to Many relationship

- employee/manager and department: one to many employee

# Logical database design

<img src="images/logical-ERD.png" alt="logical ERD" width="1000" />

## Using quickDBD

<img src="images/QuickDBD-ERD.png" alt="ERD" width="1000" />

# Create tables

```sql
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
```

# Import data to the database

```sql
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
```
