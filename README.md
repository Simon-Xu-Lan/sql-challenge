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
