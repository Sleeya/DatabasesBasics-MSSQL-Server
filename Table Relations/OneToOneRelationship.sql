USE Test

CREATE TABLE Persons
(
	PersonID int IDENTITY,
	FirstName varchar(20) NOT NULL,
	Salary numeric(10,2),
	PassportID int NOT NULL
)

CREATE TABLE Passports
(
	PassportID int IDENTITY (101,1),
	PassportNumber char(8) NOT NULL
)

INSERT INTO Persons(FirstName,Salary,PassportID)
VALUES ('Roberto',43300.00,102),('Tom',56100.00,103),('Yana',60200.00,101)

INSERT INTO Passports(PassportNumber)
VALUES ('N34FG21B'),('K65LO4RY'),('ZE657QP2')

ALTER TABLE Persons
ADD CONSTRAINT PK_Persons PRIMARY KEY (PersonID)

ALTER TABLE Passports
ADD CONSTRAINT PK_Passports PRIMARY KEY (PassportID)

ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)

