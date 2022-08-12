-- Crear una tabla
CREATE TABLE enrollment(
    code NUMBER,
    firstname VARCHAR2(20),
    lastname VARCHAR2(20),
    age NUMBER,
    enrollment_date DATE
);

-- Crear la tabla centers
CREATE TABLE centers(
    code NUMBER,
    name VARCHAR2(100),
    province VARCHAR2(100) DEFAULT 'Madrid',
    register_date DATE DEFAULT SYSDATE,
    students NUMBER DEFAULT 0
);

-- Insertar una fila que no tenga los ultimos 3 valores
INSERT INTO centers(code, name)
VALUES(1,'Matematicas');

-- Crear la tabla courses
CREATE TABLE courses(
    code NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL UNIQUE,
    responsible VARCHAR2(100)
);

-- Crear la tabla countries
CREATE TABLE countries(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

-- Crear la tabla cities 
CREATE TABLE cities(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    population NUMBER NOT NULL CHECK(population > 0),
    country_id NUMBER REFERENCES countries(id)
);

-- Insertar datos
INSERT INTO countries VALUES(1,'United States');
INSERT INTO countries VALUES(2,'France');
INSERT INTO countries VALUES(3,'Brasil');

INSERT INTO cities VALUES(1,'New York',4000000,1);
INSERT INTO cities VALUES(2,'Paris',2000000,2);
INSERT INTO cities VALUES(3,'Sao Paulo',3500000,3);

-- Crear la tabla small_cities a partir de cities
CREATE TABLE small_cities
AS SELECT * FROM cities
WHERE population < 3000000;

-- Poner el formato de primary key al id en small_cities
ALTER TABLE small_cities
MODIFY (id NUMBER PRIMARY KEY);

-- Agregar el lenguaje a la tabla small_cities
ALTER TABLE small_cities
ADD (language VARCHAR2(50));

-- Insertar datos en lenguaje
UPDATE small_cities
SET language='French'
WHERE country_id=2;

-- Eliminar language
ALTER TABLE small_cities DROP(language);

-- Eliminar la tabla small_cities
DROP TABLE small_cities;

