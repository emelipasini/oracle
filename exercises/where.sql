-- Where

-- Empleados en el departamento 100
SELECT * FROM employees WHERE department_id=100;

-- Ciudades de USA
SELECT * FROM locations WHERE country_id='US';

-- Paises en la region 3 
SELECT * FROM countries WHERE region_id=3;

-- Empleados que no tengan el manager 114
SELECT * FROM employees WHERE manager_id<>114;

-- Empleados contratados despues del 2006
SELECT * FROM employees WHERE hire_date>='01-01-2006';

-- Empleados con trabajo ST_CLERK
SELECT * FROM employees WHERE job_id='ST_CLERK';

-- Empleados con apellido Smith
SELECT * FROM employees WHERE last_name='Smith';

-- Empleados con departamentos entre 40 y 60
SELECT * FROM employees WHERE department_id BETWEEN 40 AND 60;

-- Empleados contratados entre 2002 y 2004
SELECT * FROM employees WHERE hire_date BETWEEN '01-01-2002' AND '31-12-2004';

-- Empleados con apellidos que empiezan entre D y G
SELECT last_name FROM employees WHERE last_name BETWEEN 'D' AND 'H';

-- Empleados en departamentos 30, 60 o 90
SELECT * FROM employees WHERE department_id IN (30,60,90);

-- Empleados con trabajo IT_PROG o PU_CLERK
SELECT * FROM employees WHERE job_id IN ('IT_PROG','PU_CLERK');

-- Ciudades en UK o Japon
SELECT * FROM locations WHERE country_id IN ('UK','JP');

-- Empleados que el nombre empieza con J
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- Empleados que el nombre empieza con S y termina con n
SELECT * FROM employees WHERE first_name LIKE 'S%n';

-- Paises que tiene una r en la segunda letra
SELECT * FROM countries WHERE country_name LIKE '_r%';

-- Ciudades sin provincia
SELECT * FROM locations WHERE state_province IS NULL;

-- Calcular el salario total de los empleados que tienen comision
SELECT first_name || ' ' || last_name AS name, salary, commission_pct, (salary*commission_pct/100)+salary AS "Total Salary"
FROM employees
WHERE commission_pct IS NOT NULL;

-- Empleados con trabajo IT_PROG que cobran menos de 6000
SELECT * FROM employees WHERE job_id='IT_PROG' AND salary<6000;

-- Empleados que trabajan en departamentos 50 u 80, que el nombre empieza con S y cobran mas de 3000
SELECT * FROM employees
WHERE department_id IN (50,80) AND first_name LIKE 'S%' AND salary>3000;

-- Empleados que tienen trabajo IT_PROG, el telefono empieza con 5 y los contrataron en 2007
SELECT * FROM employees
WHERE job_id='IT_PROG' AND phone_number LIKE '5%' AND hire_date BETWEEN '01-01-2007' AND '31-12-2007';

