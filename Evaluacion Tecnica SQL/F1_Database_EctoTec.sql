
/* Creamos la base de datos F1_Database_EctoTec */
CREATE DATABASE F1_Database_EctoTec;

/*Usamos la base de datos recien creada */
USE F1_Database_EctoTec

/* Creamos la tabla Coches */
CREATE TABLE Coches(
	cocheID int PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	motor varchar(50) NOT NULL
);

/* Creamos la tabla Escuderias */
CREATE TABLE Escuderias(
	escuderiaID int PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	sede varchar(50) NOT NULL
);

/* Creamos la tabla Pilotos*/
CREATE TABLE Pilotos(
	pilotoID int PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	numero int NOT NULL,
	victorias int NOT NULL,
	podiums int NOT NULL,
	poles int NOT NULL,
	cocheID int NOT NULL FOREIGN KEY REFERENCES Coches(cocheID),
	escuderiaID int NOT NULL FOREIGN KEY REFERENCES Escuderias(escuderiaID),
	nacionalidad varchar(50) NOT NULL
);

/* Llenamos la tabla Coches */
INSERT INTO Coches (cocheID, nombre, motor) VALUES (1, 'W13', 'Mercedes')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (2, 'RB18', 'Red Bull')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (3, 'F1-75', 'Ferrari')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (4, 'MCL36', 'Mercedes')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (5, 'A522', 'Renault')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (6, 'AT03', 'Red Bull')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (7, 'AMR22', 'Mercedes')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (8, 'FW44', 'Mercedes')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (9, 'C42', 'Ferrari')
INSERT INTO Coches (cocheID, nombre, motor) VALUES (10, 'VF-22', 'Ferrari')

/* Llenamos la tabla Escuderias */
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (1, 'Mercedes', 'Brackley (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (2, 'Red Bull', 'Milton Keynes (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (3, 'Ferrari', 'Maranello (ITA)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (4, 'Mclaren', 'Woking (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (5, 'Alpine', 'Enstone (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (6, 'Alpha Tauri', 'Faenza (ITA)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (7, 'Aston Martin', 'Silverstone (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (8, 'Williams', 'Grove (GB)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (9, 'Alfa Romeo', 'Hinwil (SUI)')
INSERT INTO Escuderias (escuderiaID, nombre, sede) VALUES (10, 'Haas', 'Kannapolis (USA)')

/* Llenamos la tabla Pilotos */
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (1, 'Lewis Hamilton', 44, 103, 182, 103, 1, 1, 'Reino Unido')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (2, 'George Russell', 63, 0, 1, 0, 1, 1, 'Reino Unido')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (3, 'Max Verstappen', 1, 20, 60, 13, 2, 2, 'Paises Bajos')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (4, 'Sergio Pérez', 11, 2, 15, 0, 2, 2, 'Mexico')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (5, 'Charles Leclerc', 16, 2, 13, 9, 3, 3, 'Monaco')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (6, 'Carlos Sainz', 55, 0, 6, 0, 3, 3, 'España')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (7, 'Lando Norris', 4, 0, 5, 1, 4, 4, 'Reino Unido')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (8, 'Daniel Ricciardo', 3, 8, 32, 3, 4, 4, 'Australia')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (9, 'Fernando Alonso', 14, 32, 98, 22, 5, 5, 'España')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (10, 'Esteban Ocon', 31, 1, 2, 0, 5, 5, 'Francia')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (11, 'Pierre Gasly', 10, 1, 3, 0, 6, 6, 'Francia')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (12, 'Yuki Tsunoda', 22, 0, 0, 0, 6, 6, 'Japon')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (13, 'Nicholas Latifi', 6, 0, 0, 0, 8, 8, 'Canada')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (14, 'Alexander Albon', 23, 0, 2, 0, 8, 8, 'Tailandia')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (15, 'Sebastian Vettel', 5, 52, 122, 57, 7, 7, 'Alemania')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (16, 'Lance Stroll', 18, 0, 3, 1, 7, 7, 'Canada')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (17, 'Valtteri Bottas', 77, 10, 67, 20, 9, 9, 'Finlandia')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (18, 'Guanyu Zhou', 24, 0, 0, 0, 9, 9, 'China')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (19, 'Mick Schumacher', 47, 0, 0, 0, 10, 10, 'Alemania')
INSERT INTO Pilotos (pilotoID, nombre, numero, victorias, podiums, poles, cocheID, escuderiaID, nacionalidad) VALUES (20, 'Kevin Magnussen', 20, 0, 1, 0, 10, 10, 'Dinamarca')