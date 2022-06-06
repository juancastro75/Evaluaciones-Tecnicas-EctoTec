
/* Creamos la base de datos Escuela_Database_EctoTec */
CREATE DATABASE Empleados_Database_EctoTec;

/*Usamos la base de datos recien creada */
USE Empleados_Database_EctoTec

/* Creamos la tabla Puesto */
CREATE TABLE Puesto(
	clave_puesto int PRIMARY KEY,
	titulo varchar(50) NOT NULL,
	sueldo int NOT NULL,
	CONSTRAINT materia_registrada UNIQUE (clave_puesto, titulo)
);

/* Creamos la tabla Persona */
CREATE TABLE Persona(
	clave_persona int PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL,
	clave_puesto int NOT NULL FOREIGN KEY REFERENCES Puesto(clave_puesto),
	CONSTRAINT alumno_registrado UNIQUE (clave_persona)
);

/* Llenamos la tabla Puesto */
INSERT INTO Puesto(clave_puesto, titulo, sueldo) VALUES (1204, 'Desarrollador Movil', 15000)
INSERT INTO Puesto(clave_puesto, titulo, sueldo) VALUES (1207, 'Desarrollador Web .NET', 20000)
INSERT INTO Puesto(clave_puesto, titulo, sueldo) VALUES (1202, 'Desarrollador Web Jr', 10000)

/* Llenamos la tabla Persona */
INSERT INTO Persona(clave_persona, nombre, apellidos, fecha_nacimiento, clave_puesto) VALUES (1, 'Juan Jose', 'Castro Rosales', '2001-08-02', 1202)
INSERT INTO Persona(clave_persona, nombre, apellidos, fecha_nacimiento, clave_puesto) VALUES (2, 'Pedro Manuel', 'Perez Suarez', '1995-04-12', 1207)
INSERT INTO Persona(clave_persona, nombre, apellidos, fecha_nacimiento, clave_puesto) VALUES (3, 'Maria Guadalupe', 'Fuentes Trejo', '1990-12-19', 1204)


/* Diseñe un procedimiento que reciba como entrada la clave de persona y la clave del puesto y actualice el puesto actual 
de la persona por el nuevo */
CREATE PROCEDURE update_puesto @clave_persona int, @new_puesto int
AS
	UPDATE Persona SET clave_puesto = @new_puesto WHERE clave_persona = @clave_persona
GO

exec dbo.update_puesto 3, 1207
SELECT * FROM Persona

/* Diseñe una función que reciba como entrada la clave de la persona y regrese como salida el sueldo actual de la persona */
CREATE PROCEDURE sp_consulta_sueldo @clave_persona int
AS
	SELECT clave_persona, nombre, apellidos, sueldo FROM Persona JOIN Puesto
		ON Persona.clave_puesto = Puesto.clave_puesto
		WHERE Persona.clave_persona = @clave_persona
GO

exec dbo.sp_consulta_sueldo 1

/* Diseñe una función que genere una nueva persona. Deberá de recibir como entrada el nombre, apellido y fecha de nacimiento de 
la persona. Como salida deberá regresar la clave de la persona generada. Las claves nuevas se deberán obtener buscando la máxima 
clave de persona existente y sumando uno */
CREATE PROCEDURE sp_nueva_persona @nombre varchar(50), @apellidos varchar(50), @fecha_nacimiento varchar(50), @clave_puesto int 
AS
	BEGIN
		INSERT Persona("nombre", "apellidos", "fecha_nacimiento", "clave_puesto") VALUES (@nombre, @apellidos, @fecha_nacimiento, @clave_puesto)
	END
	SELECT clave_persona FROM Persona WHERE nombre = @nombre AND apellidos = @apellidos AND fecha_nacimiento = @fecha_nacimiento
GO

exec dbo.sp_nueva_persona'Andrea', 'Bustos Acosta', '2001-08-08', 1204
