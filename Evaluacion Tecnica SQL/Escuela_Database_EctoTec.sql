
/* Creamos la base de datos Escuela_Database_EctoTec */
CREATE DATABASE Escuela_Database_EctoTec;

/*Usamos la base de datos recien creada */
USE Escuela_Database_EctoTec

/* Creamos la tabla Alumnos */
CREATE TABLE Alumnos(
	matricula varchar(50) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL,
	CONSTRAINT alumno_registrado UNIQUE (matricula)
);

/* Creamos la tabla Materias */
CREATE TABLE Materias(
	clave_materia varchar(50) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	area varchar(50) NOT NULL,
	CONSTRAINT materia_registrada UNIQUE (clave_materia, nombre)
);

/* Creamos la tabla Pilotos*/
CREATE TABLE Calificaciones(
	matricula varchar(50) NOT NULL FOREIGN KEY REFERENCES Alumnos(matricula),
	clave_materia varchar(50) NOT NULL FOREIGN KEY REFERENCES Materias(clave_materia),
	calificacion varchar(50) NOT NULL
);

/* Llenamos la tabla Alumnos */
INSERT INTO Alumnos (matricula, nombre, apellidos, fecha_nacimiento) VALUES ('A09996', 'Juan Jose', 'Castro Rosales', '2001-08-02')
INSERT INTO Alumnos (matricula, nombre, apellidos, fecha_nacimiento) VALUES ('A09997', 'Erika Gabriela', 'Vazquez Lincon', '2000-12-19')
INSERT INTO Alumnos (matricula, nombre, apellidos, fecha_nacimiento) VALUES ('A09998', 'Andrea', 'Bustos Ascosta', '2001-08-08')

/* Llenamos la tabla Alumnos */
INSERT INTO Materias (clave_materia, nombre, area) VALUES ('ES0004', 'Literatura', 'Español')
INSERT INTO Materias (clave_materia, nombre, area) VALUES ('ES0001', 'Ortografia', 'Español')
INSERT INTO Materias (clave_materia, nombre, area) VALUES ('M0004', 'Escuaciones Diferenciales', 'Matematicas')
INSERT INTO Materias (clave_materia, nombre, area) VALUES ('M0002', 'Calculo Integral', 'Matematicas')

/* Llenamos la tabla Calificaciones */
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09996', 'ES0004', '85')
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09996', 'M0004', '70')
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09996', 'M0002', '95')
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09998', 'ES0001', '90')
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09998', 'M0002', '95')

/* Obtener los alumnos ordenados por fecha de nacimiento de los más jóvenes a los más viejos */
SELECT * FROM Alumnos ORDER BY fecha_nacimiento DESC

/* Obtener las materias que pertenezcan al área “Español” */
SELECT * FROM Materias WHERE area = 'ESPAÑOL'

/* Obtener la boleta del alumno con matrícula “A09998”. La boleta deberá tener el nombre completo (nombre y apellidos) del alumno, 
la clave y nombre de la materia, así como la calificación obtenida. No importa que el nombre del alumno se repita en cada registro. El 
ordenamiento deberá ser por nombre de materia */
SELECT Alumnos.nombre, Alumnos.apellidos, Materias.clave_materia as clave, Materias.nombre as materia, Calificaciones.calificacion 
FROM Alumnos JOIN Calificaciones ON Alumnos.matricula = Calificaciones.matricula 
	JOIN Materias ON Calificaciones.clave_materia = Materias.clave_materia
	ORDER BY Materias.nombre ASC

/* Obtener el listado de alumnos inscritos. Por inscritos se entiende que cuentan con al menos una materia inscrita */
SELECT Alumnos.nombre, Alumnos.apellidos FROM Alumnos JOIN Calificaciones 
	ON Alumnos.matricula = Calificaciones.matricula

/* Crear el registro del alumno Pedro Pérez, con fecha de nacimiento el 10 de octubre de 2001. Su matrícula será “A09999” */
INSERT INTO Alumnos (matricula, nombre, apellidos, fecha_nacimiento) VALUES ('A09999', 'Pedro', 'Perez', '2001-10-10')

/* Crear el registro de la materia “Introducción a la Programación”, del área “Computación”. Su clave será: “TI0001” */
INSERT INTO Materias (clave_materia, nombre, area) VALUES ('TI0001', 'Introduccion a la Programación', 'Computación')

/* Inscribir a Pedro en Introducción a la Programación con calificación de 88 */
INSERT INTO Calificaciones (matricula, clave_materia, calificacion) VALUES ('A09999', 'TI0001', '88')

/* Actualizar la calificación de Pedro a 92 */
UPDATE Calificaciones SET calificacion = '92' WHERE matricula = 'A09999' AND clave_materia = 'TI0001' 
SELECT * FROM Calificaciones

/* Eliminar el registro de Pedro de la clase de Programación Avanzada */
DELETE Calificaciones WHERE matricula = 'A09999' AND clave_materia = 'TI0001' 

