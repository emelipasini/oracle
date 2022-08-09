-- Funciones de grupo

-- Numero de empleados del departamento 50
SELECT COUNT(*) FROM employees WHERE department_id=50;

-- Numero de empleados que entraron en el 2007
SELECT COUNT(*) FROM employees WHERE TO_CHAR(hire_date, 'YYYY')=2007;

-- Diferencia entre el sueldo maximo y el minimo
SELECT MAX(salary)-MIN(salary) FROM employees;

-- Suma del salario del departamento 100
SELECT SUM(salary) FROM employees WHERE department_id=100;

-- Salario medio por departamento con dos decimales
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- Mostrar el country_id con la cantidad de ciudades
SELECT country_id, COUNT(city)
FROM locations
GROUP BY country_id
ORDER BY country_id;

-- Promedio de salario por departamento de los empleados que tengan comision
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id
ORDER BY department_id;

-- Mostrar los años en los que ingresaron mas de 10 empleados
SELECT TO_CHAR(hire_date, 'YYYY') AS year, COUNT(TO_CHAR(hire_date, 'YYYY')) AS count
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
HAVING COUNT(TO_CHAR(hire_date, 'YYYY')) > 10
ORDER BY TO_CHAR(hire_date, 'YYYY');

-- Mostrar por departamento y año el numero de empleados que ingresaron
SELECT TO_CHAR(hire_date, 'YYYY') AS year, department_id, COUNT(*) AS Count
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY'), department_id
ORDER BY TO_CHAR(hire_date, 'YYYY'), department_id;

-- Mostrar los departamentos que tienen un manager con mas de 5 empleados
SELECT DISTINCT department_id, COUNT(manager_id)
FROM employees
GROUP BY department_id, manager_id
HAVING COUNT(employee_id) > 5
ORDER BY department_id;

