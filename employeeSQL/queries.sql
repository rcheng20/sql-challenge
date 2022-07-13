SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dep_employee;
SELECT * FROM dep_manager;
--check all tables are displayed correctly

--list employee number, last and first name, sex, and salary per employee
SELECT emp_num, last_name, first_name, sex,
(SELECT salary
        FROM salaries s
        WHERE e.emp_num = s.emp_num)
FROM employees e;

SELECT first_name, last_name, hire_date
FROM employees e
WHERE e.hire_date LIKE '%1986';
--list first name, last name, and hire date for employees hiring in the year 1986

SELECT dep_num,
(SELECT dep_name
	FROM departments d
	WHERE dm.dep_num = d.dep_num),
emp_num,
(SELECT first_name
	FROM employees e
	WHERE dm.emp_num = e.emp_num),
(SELECT last_name
	FROM employees e
	WHERE dm.emp_num = e.emp_num)
FROM dep_manager dm;
--list the manager of each department and show department number, department name, employee number, first, and last name

SELECT emp_num,
(SELECT last_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT first_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT dep_name
	FROM departments d
	WHERE d.dep_num = de.dep_num)
FROM dep_employee de;
--list the department for each employee and show employee number, last name, first name, and department name

SELECT first_name, last_name, sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';
--list first, last name, and sex for employees with first name of "Hercules" and last name starting with a "B"

SELECT emp_num,
(SELECT last_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT first_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT dep_name
	FROM departments d
	WHERE d.dep_num = de.dep_num)
FROM dep_employee de
WHERE dep_num = 'd007';
--list the employees in sales and show employee number, last name, first name, and department name

SELECT emp_num,
(SELECT last_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT first_name
	FROM employees e
	WHERE e.emp_num = de.emp_num),
(SELECT dep_name
	FROM departments d
	WHERE d.dep_num = de.dep_num)
FROM dep_employee de
WHERE dep_num = 'd007'
OR dep_num = 'd005';
--list the employees in Sales and Development and show employee number, last name, first name, and department name

SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;
--list frequency of the employee's last names in descending order