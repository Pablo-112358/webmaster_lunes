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