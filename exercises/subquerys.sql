-- SubQuerys

-- Mostrar los empleados que trabajan con John Chen
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE first_name = 'John'
    AND last_name = 'Chen'
);

-- Departamentos que tienen sede en Toronto
SELECT department_id, department_name
FROM departments
WHERE location_id = (
    SELECT location_id
    FROM locations
    WHERE city='Toronto'
);

-- Mostrar los empleados que tengan mas de 5 empleados a su cargo
SELECT first_name, last_name
FROM employees
WHERE employee_id IN (
    SELECT manager_id
    FROM employees
    GROUP BY manager_id
    HAVING COUNT(employee_id) > 5
);

-- Ciudad en la que trabaja Guy Himuro
SELECT city
FROM locations
WHERE location_id = (
    SELECT location_id
    FROM departments
    JOIN employees USING (department_id)
    WHERE first_name = 'Guy'
    AND last_name = 'Himuro'
);

-- Empleados que tienen el salario minimo
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- Mostrar los departmentos con salario maximo mayor a 10000
SELECT *
FROM departments
WHERE department_id IN(
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING MAX(salary) > 10000
);

-- Indicar los tipos de trabajo de los empleados que entraron entre 2002 y 2003
SELECT *
FROM jobs
WHERE job_id IN(
    SELECT job_id
    FROM employees
    WHERE TO_CHAR(hire_date, 'YYYY') BETWEEN 2002 AND 2003
);

-- Mostrar los empleados que ganen mas que cualquiera de los salarios maximos de los departamentos 50, 60 y 70
SELECT first_name, department_id, salary
FROM employees
WHERE salary > ANY (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id
    HAVING department_id IN(50,60,70)
);

-- Departamentos que el salario medio sea mayor a 9000
SELECT department_id, department_name
FROM departments
WHERE department_id IN(
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 9000
);

-- Empleados que tengan el salario maximo de su departamento
SELECT first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN(
    SELECT department_id, MAX(salary)
    FROM employees
    GROUP BY department_id
);

-- La consulta anterior pero con una consulta sincronizada
SELECT first_name, salary, department_id
FROM employees emp
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id=emp.department_id
);

-- Los empleados que ganen mas que todos los del departamento 100
SELECT first_name, salary, department_id
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id=100
);

-- Ciudades que tengan departamentos
SELECT city
FROM locations loc
WHERE EXISTS (
    SELECT department_id
    FROM departments
    WHERE location_id=loc.location_id
);

-- Regiones donde no hay departamentos
SELECT region_name
FROM regions reg
WHERE NOT EXISTS (
    SELECT *
    FROM countries
    NATURAL JOIN locations
    NATURAL JOIN departments
    WHERE region_id=reg.region_id
);

