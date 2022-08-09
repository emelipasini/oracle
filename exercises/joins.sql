-- JOINS

-- Visualizar el nombre del pais y de la region usando un natural join
SELECT country_name, region_name
FROM regions
NATURAL JOIN countries;

-- Agregarle al ejercicio anterior la ciudad
SELECT city, country_name, region_name
FROM regions
NATURAL JOIN countries
NATURAL JOIN locations;

-- Indicar el nombre del departamento y la media de sus salarios
SELECT department_name, ROUND(AVG(salary),2)
FROM employees
JOIN departments USING (department_id)
GROUP BY department_name;

-- Visualizar el nombre del departamento, el nombre del manager y la ciudad a la que pertenece
SELECT department_name AS Department, first_name AS Manager, city
FROM departments dep
JOIN employees emp ON (dep.manager_id=emp.employee_id)
JOIN locations loc ON (dep.location_id=loc.location_id);

-- Mostrar el trabajo, departamento, apellido y fecha de ingreso de los que hayan ingresado entre 2000 y 2004
SELECT job_title, department_name, last_name, hire_date
FROM jobs
JOIN employees emp ON (jobs.job_id=emp.job_id)
JOIN departments dep ON (dep.department_id=emp.department_id)
WHERE TO_CHAR(hire_date,'YYYY') BETWEEN 2000 AND 2004;

-- Mostrar el job_title y la media de los salarios de los que superan los 7000
SELECT job_title, AVG(salary)
FROM jobs
JOIN employees USING (job_id)
GROUP BY job_title
HAVING AVG(salary) > 7000;

-- Mostrar las regiones con su cantidad de departamentos
SELECT region_name, COUNT(department_id) AS Departments
FROM departments
JOIN locations USING (location_id)
JOIN countries USING (country_id)
JOIN regions USING (region_id)
GROUP BY region_name;

-- Nombre del empleado, el departamento y el pais
SELECT first_name, department_name, country_name
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id);

-- Indicar el nombre del empleado con el de su jefe (self join)
SELECT worker.first_name AS Worker, boss.first_name AS Manager
FROM employees worker 
JOIN employees boss ON worker.manager_id=boss.employee_id;

-- Mostrar los departamentos con sus salarios y que esten los departamentos que no tienen empleados
SELECT department_name, SUM(salary)
FROM departments
LEFT OUTER JOIN employees USING (department_id)
GROUP BY department_name
ORDER BY SUM(salary);

-- Mostrar todas las ciudades y si lo tienen los departamentos
SELECT city, department_name
FROM departments
RIGHT OUTER JOIN locations USING (location_id);

