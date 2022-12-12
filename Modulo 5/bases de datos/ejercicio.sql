CREATE DATABASE ejercicio;
USE ejercicio;
CREATE TABLE empleados (
	id_emp INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (80) NOT NULL,
    apellido VARCHAR (80) NOT NULL,
    trabajo VARCHAR (50) NOT NULL,
	edad INT NOT NULL,
	salario INT NOT NULL,
	mail VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_emp)
    );
    
SHOW DATABASES


INSERT INTO empleados VALUES (1, 'Juan','Hagan', 'Programador Senior', 32, 120000, 'juan_hagan@bignet.com');
INSERT INTO empleados VALUES (2, 'Gonzalo', 'Pillai', 'Programador Senior', 32, 110000, 'g_pillai@bignet.com');
INSERT INTO empleados VALUES (3, 'Ana', 'Dharma', 'Desarrollador Web', 27, 90000, 'ana@bignet.com');
INSERT INTO empleados VALUES (4, 'Maria', 'Anchor', 'Desarrollador Web', 26, 85000, 'mary@bignet.com');
INSERT INTO empleados VALUES (5, 'Alfredo', 'Fernandez', 'Programador', 31, 75000, 'af@bignet.com');
INSERT INTO empleados VALUES (6, 'Juan', 'Aguero', 'Programador', 34, 80000, 'juan@bignet.com');
INSERT INTO empleados VALUES (7, 'Eduardo', 'Sacan', 'Programador', 25, 75000, 'eddie@bignet.com');
INSERT INTO empleados VALUES (8, 'Alejandro', 'Nanda', 'Programador', 32, 70000, 'alenanda@bignet.com');
INSERT INTO empleados VALUES (9, 'Hernan', 'Rosso', 'Especialista Multimedia', 33, 90000, 'hernan@bignet.com');
INSERT INTO empleados VALUES (10, 'Paublo', 'Simon', 'Especialista Multimedia', 43, 85000, 'ps@bignet.com');
INSERT INTO empleados VALUES (11, 'Arturo', 'Hernandez', 'Especialista Multimedia', 32, 75000, 'arturo@bignet.com');
INSERT INTO empleados VALUES (12, 'Jimena', 'Cazado', 'Diseñador Web Senior', 32, 110000, 'jimena@bignet.com');
INSERT INTO empleados VALUES (13, 'Roberto', 'Luis', 'Administrador de Sistemas', 35, 100000, 'roberto@bignet.com');
INSERT INTO empleados VALUES (14, 'Daniel', 'Gutierrez', 'Administrador de Sistemas', 34, 900000, 'daniel@bignet.com');
INSERT INTO empleados VALUES (15, 'Miguel', 'Harper', 'Ejecutivo de Ventas Senior', 36, 120000, 'miguel@bignet.com');
INSERT INTO empleados VALUES (16, 'Monica', 'Sanchez', 'Ejecutivo de Ventas', 30, 90000, 'monica@bignet.com');
INSERT INTO empleados VALUES (17, 'Alicia', 'Simlai', 'Ejecutivo de Ventas', 27, 70000, 'alicia@bignet.com');
INSERT INTO empleados VALUES (18, 'Jose', 'Iriarte', 'Ejecutivo de Ventas', 27, 72000, 'jose@bignet.com');
INSERT INTO empleados VALUES (19, 'Sabrina', 'Allende', 'Gerente de Soporte Tecnico', 32, 200000, 'sabrina@bignet.com');
INSERT INTO empleados VALUES (20, 'Pedro', 'Campion', 'Gerente de Finanzas', 36, 220000, 'pedro@bignet.com');
INSERT INTO empleados VALUES (21, 'Mariano', 'Dharma', 'Presidente', 28, 300000, 'mariano@bignet.com');
/*1*/
SELECT nombre
FROM empleados
/*2*/
SELECT nombre, edad
FROM empleados
/*3*/
SELECT nombre, edad
FROM empleados
WHERE trabajo = 'Programador'
/*4*/
SELECT nombre, edad
FROM empleados
WHERE edad >= 30 
/*5*/
SELECT apellido, mail
FROM empleados
WHERE nombre > 'Juan'
/*6*/
SELECT nombre , trabajo
FROM empleados
WHERE trabajo = 'Programador' OR 'Desarrollador Web'
/*7*/
SELECT id_emp, nombre, apellido, trabajo
FROM empleados
WHERE id_emp >= 15 and  id_emp <= 20


/*8*/
SELECT nombre 
FROM empleados
WHERE trabajo = 'Programador' AND salario<80000

/*9*/
SELECT nombre, salario 
FROM empleados
WHERE trabajo = 'Programador' AND salario BETWEEN 75000 AND 90000

/*10*/
SELECT nombre 
FROM empleados
WHERE nombre  LIKE 's%'
/*11*/
SELECT nombre 
FROM empleados
WHERE nombre  LIKE '%l'
/*12*/

INSERT INTO empleados
VALUES (null,'Francisco', 'Perez', 'Programador', 26, 90000, 'mail: francisco@bignet.com')

select *
from empleados

/*13*/

SELECT id_emp, nombre, apellido
FROM empleados
WHERE apellido = 'Rosso'

/*DELETE FROM empleados
WHERE apellido = 'Rosso')*/
DELETE FROM empleados
WHERE id_emp=9
select *
from empleados
/*14*/

SELECT id_emp, nombre, apellido, salario
FROM empleados
WHERE apellido = 'Gutierrez'

UPDATE empleados
SET salario=90000
WHERE id_emp=14