-- SELECT 

-- Nombre y telefono de los empleados 
SELECT first_name, phone_number FROM employees;

-- Nombre y trabajo con alias 
SELECT first_name AS "Name", job_id AS "Type of work" FROM employees;

-- Regiones 
SELECT * FROM regions;

-- Nombres de paises
SELECT country_name FROM countries;

-- Direccion, ciudad y provincia con alias
SELECT street_address AS "Address", city AS "City", state_province AS "Province" FROM locations;

-- Distinct

-- Visualizar departamentos de los empleados
SELECT DISTINCT department_id FROM employees;

-- Visualizar departamentos y trabajo de los empleados
SELECT DISTINCT department_id, job_id FROM employees;

-- Arithmetic Operators

-- Visualizar salarios con impuestos
SELECT  first_name, salary AS "Gross salary", salary*20/100 AS "Taxes",
        salary-salary*20/100 AS "Net income"
FROM employees;

-- Ingreso anual
SELECT  first_name, salary AS "Gross salary", salary*20/100 AS "Taxes", 
        salary-salary*20/100 AS "Net income", (salary-salary*20/100)*12 AS "Annual income"
FROM employees;

-- Literal Operators

-- Visualizar informacion como:
-- Employee Donald in department 50 has a salary of 2600
SELECT  'Employee ' || first_name || ' in department ' ||  department_id || ' has a salary of ' || salary
        AS "Employee info"
FROM employees;

-- Visualizar ubicacion como:
-- The street 2007 Sagora St belongs to the city of South Brunswick
SELECT 'The street ' || street_address || ' belongs to the city of ' || city AS "Location info"
FROM locations;

