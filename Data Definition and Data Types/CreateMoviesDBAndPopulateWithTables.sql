USE Movies

CREATE TABLE Directors
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	DirectorName varchar(50) NOT NULL,
	Notes text
)

CREATE TABLE Genres
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	GenreName varchar(50) NOT NULL,
	Notes text
)

CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	CategoryName varchar(50) NOT NULL,
	Notes text
)

CREATE TABLE Movies
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Title varchar(25) NOT NULL,
	DirectorId int NOT NULL FOREIGN KEY REFERENCES Directors(Id),
	Copyrightyear date,
	Length real,
	GenreId int NOT NULL FOREIGN KEY REFERENCES Genres(Id),
	CategoryID int NOT NULL FOREIGN KEY REFERENCES Categories(id),
	Rating smallint,
	Notes text
)

INSERT INTO Directors(DirectorName)
VALUES ('Georgi'),('Georgi'),('Georgi'),('Georgi'),('Georgi');

INSERT INTO Genres(GenreName)
VALUES ('GenreOne'),('GenreOne'),('GenreOne'),('GenreOne'),('GenreOne');

INSERT INTO Categories(CategoryName)
VALUES ('CategoryOne'),('CategoryOne'),('CategoryOne'),('CategoryOne'),('CategoryOne');

INSERT INTO Movies(Title,DirectorId,GenreId,CategoryID)
VALUES ('MovieOne',1,2,3),('MovieOne',1,2,3),('MovieOne',1,2,3),('MovieOne',1,2,3),('MovieOne',1,2,3);

