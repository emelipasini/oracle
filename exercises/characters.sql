-- Caracteres

-- Direccion de Canada y USA que supere los 15 caracteres
SELECT street_address, city, country_id FROM locations WHERE LENGTH(street_address) > 15 AND country_id IN('CA','US');

-- Empleados con una b despues de la tercera posicion
SELECT first_name FROM employees WHERE SUBSTR(first_name, 4) LIKE '%b%';
-- Otras soluciones
SELECT first_name FROM employees WHERE INSTR(first_name, 'b') > 3;
SELECT first_name FROM employees WHERE INSTR(first_name, 'b', 4) <> 0;

-- Empleados que ganan entre 4000 y 7000 y tienen una a en el nombre
SELECT first_name, salary FROM employees
WHERE INSTR(LOWER(first_name),'a') <> 0 AND salary BETWEEN 4000 AND 7000;

-- Visualizar las iniciales de los empleados separados por puntos, ej: A.P.
SELECT  first_name, last_name, 
        CONCAT(CONCAT(SUBSTR(first_name,1,1),'.'),CONCAT(SUBSTR(last_name,1,1),'.')) AS Initials 
FROM employees;

-- Empleados que el nombre o el apellido empieza con S
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'S%' OR last_name LIKE 'S%';

-- Visualizar con asteriscos el salario de los empleados, ej: si gana 13000, 13 asteriscos
SELECT first_name, salary, RPAD('*', SUBSTR(salary,1,(LENGTH(salary) - 3)),'*') AS Ranking FROM employees ORDER BY salary DESC;
-- Mejor solucion
SELECT first_name, salary, RPAD('*',salary/1000,'*') FROM employees ORDER BY salary DESC;

