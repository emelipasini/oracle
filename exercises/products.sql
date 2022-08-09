-- Crear la tabla e insertarle datos
CREATE TABLE products(
    code NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL,
    units NUMBER,
    registration DATE
);

INSERT INTO products(code, name, price, units, registration)
VALUES(1,'Tornillos',100,10,'01-09-2017');

INSERT INTO products
VALUES(2,'Tuercas',50,5,'01-10-2009');

INSERT INTO products
VALUES(3,'Martillo',90,null,null);

INSERT INTO products(code,name,price,units)
VALUES(4,'Arandela',1,10);

-- Crear otra tabla
CREATE TABLE products2(
    code NUMBER,
    name VARCHAR2(100)
);

-- Insertarle los productos de la tabla products con mas de 8 unidades
INSERT INTO products2
    SELECT code,name
    FROM products
    WHERE units > 8;

-- Incrementar en 5 el precio de los productos que empiezan con T
UPDATE products
SET price=price+5
WHERE SUBSTR(name,1,1) = 'T';

-- Eliminar las filas que no tengan unidades
DELETE FROM products
WHERE units IS NULL;

-- Truncar la tabla products2
TRUNCATE TABLE products2;

