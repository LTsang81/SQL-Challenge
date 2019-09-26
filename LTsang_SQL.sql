


--List the following details of each employee: employee number, 
--last name, first name, gender, and salary.
SELECT employees.employee_no, employees.last_name, employees.first_name, employees.gender, salaries.salary FROM employees INNER JOIN salaries ON salaries.employee_no=employees.employee_no
--List employees who were hired in 1986.
SELECT employees.employee_no, employees.last_name, employees.first_name, employees.hire_date FROM employees WHERE employees.hire_date >= '1/1/86' and employees.hire_date <= '12/31/86'
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, employees.last_name, employees.first_name, managers.employee_no, managers.from_date, managers.to_date FROM departments JOIN managers ON departments.dept_no=managers.dept_no JOIN employees ON employees.employee_no=managers.employee_no
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name FROM employees JOIN dept_employee ON employees.employee_no=dept_employee.employee_no JOIN departments ON dept_employee.dept_no=departments.dept_no
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name FROM employees WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name FROM employees INNER JOIN dept_employee ON dept_employee.employee_no=employees.employee_no INNER JOIN departments ON departments.dept_no=dept_employee.dept_no WHERE departments.dept_name = 'Sales'
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.employee_no, employees.last_name, employees.first_name, departments.dept_name FROM employees INNER JOIN dept_employee ON dept_employee.employee_no=employees.employee_no INNER JOIN departments ON departments.dept_no=dept_employee.dept_no WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) AS "Count of Names" FROM employees GROUP BY employees.last_name ORDER BY "Count of Names" DESC

