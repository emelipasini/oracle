-- Fechas

-- Numero de dias que los empleados llevan en la empresa
SELECT first_name, hire_date, SYSDATE-hire_date FROM employees;

-- La fecha en 15 dias
SELECT SYSDATE+15 FROM DUAL;

-- Meses hasta Navidad con 1 decimal
SELECT ROUND(MONTHS_BETWEEN('25-12-2022', SYSDATE), 1) FROM DUAL;

-- Fecha de registro de un empleado con el ultimo dia de ese mes
SELECT first_name, hire_date, LAST_DAY(hire_date) FROM employees;

-- Empleados que entraron los ultimos 15 dias del mes
SELECT first_name, hire_date, ROUND(hire_date, 'MONTH') FROM hr.employees WHERE ROUND(hire_date, 'MONTH') > hire_date;

