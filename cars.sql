CREATE TABLE cars1 (
    code NUMBER,
    name VARCHAR2(100)
);

CREATE TABLE cars2 (
    code NUMBER,
    name VARCHAR2(100)
);

INSERT INTO cars1 VALUES(1,'BMW 3');
INSERT INTO cars1 VALUES(2,'AUDI A5');
INSERT INTO cars1 VALUES(3,'CITROEN C5');
INSERT INTO cars1 VALUES(4,'RENAULT CLIO');

INSERT INTO cars2 VALUES(1,'BMW 3');
INSERT INTO cars2 VALUES(5,'MERCEDES C');
INSERT INTO cars2 VALUES(3,'CITROEN C5');
INSERT INTO cars2 VALUES(6,'FORD MUSTANG');

COMMIT;