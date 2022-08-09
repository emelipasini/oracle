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

-- Numeros

-- Visualizar el nombre de los empleados con id impares
SELECT employee_id, first_name FROM employees WHERE MOD(employee_id, 2) = 1;

-- Pruebas con TRUNC y ROUND
SELECT ROUND(25.67,0), TRUNC(25.67,0) FROM DUAL;
SELECT ROUND(25.67,1), TRUNC(25.67,1) FROM DUAL;
SELECT ROUND(25.34,1), TRUNC(25.34,1) FROM DUAL;
SELECT ROUND(25.34,2), TRUNC(25.34,2) FROM DUAL;
SELECT ROUND(25.67,-1), TRUNC(25.67,-1) FROM DUAL;

-- Funciones de conversion

-- Empleados que entraron en Mayo, buscar por abreviatura del mes
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'MON') = 'MAY';

-- Empleados que entraron en 2007 usando TO_CHAR
SELECT first_name, hire_date FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = '2007';

-- En que dia de la semana naciste, en letras
SELECT TO_CHAR(TO_DATE('20-03-96'),'DAY') FROM DUAL;

-- Empleados que entraron en Junio, preguntar por el mes en letras
SELECT first_name, hire_date FROM employees WHERE RTRIM(TO_CHAR(hire_date, 'MONTH')) = 'JUNE';

-- Visualizar el salario en dolares y en la moneda local, con un cambio de $120
SELECT TO_CHAR(salary, '$99,999.99') AS DOLLARS, TO_CHAR(salary*120, 'L9,999,999.99') AS PESOS FROM employees;

-- Convertir las cadenas a numeros
SELECT TO_NUMBER('1210.73') FROM DUAL;
SELECT TO_NUMBER('$127.2', '$999.9') FROM DUAL;

-- Convertir los 3 primeros caracteres del telefono en numeros y multiplicarlos por 2
SELECT phone_number, TO_NUMBER(SUBSTR(phone_number, 1, 3))*2 FROM hr.employees;

-- Convertir la cadena en fecha
SELECT TO_DATE('10TH MARCH OF 2018', 'DD"TH" MONTH "OF" YYYY') FROM DUAL;
SELECT TO_DATE('FACTURA: MARCH0806', '"FACTURA:" MONTH-DD-YY') FROM DUAL;

-- Null

-- Visualizar la ciudad y provincia y si no tiene indicarlo
SELECT city, NVL(state_province, 'No tiene') FROM locations;

-- Mostrar el salario con comision o solo el salario
SELECT first_name, NVL2(commission_pct, (salary*commission_pct/100)+salary, salary) AS "Total salary" FROM employees;

-- Devolver null si la ciudad y la provincia son iguales y si no devolver la ciudad
SELECT NULLIF(city, state_province) FROM locations;

