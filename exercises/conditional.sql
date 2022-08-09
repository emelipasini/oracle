-- Expresiones condicionales

-- Visualizar empleados con su departamento
SELECT first_name, department_id,
CASE department_id
    WHEN 50 THEN 'Shipping'
    WHEN 90 THEN 'Executive'
    ELSE 'Another department'
END AS Department
FROM employees;

-- Mostrar la ciudad y el pais con su continente
SELECT city, country_id,
CASE
    WHEN country_id IN('IT','UK','DE') THEN 'Europe'
    WHEN country_id IN('US','MX','CA','BR') THEN 'America'
    ELSE 'Other continent'
END AS Continent
FROM locations;

-- El primer ejercicio con DECODE
SELECT first_name,
DECODE(department_id,50,'Shipping',90,'Executive','Another department') AS Department
FROM employees;

