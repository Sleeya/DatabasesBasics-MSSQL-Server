USE Minions

CREATE TABLE People
(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(200) NOT NULL,
	Picture image,
	Height numeric(38,2),
	Weight numeric(38,2),
	Gender char(1) NOT NULL CHECK (Gender ='m' OR Gender = 'f'),
	Birthdate date NOT NULL,
	Biography nvarchar(max)
);