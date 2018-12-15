USE SoftUni

CREATE TABLE Towns
(
	Id int PRIMARY KEY IDENTITY,
	Name varchar(50) NOT NULL
)

CREATE TABLE Adresses
(
	Id int PRIMARY KEY IDENTITY,
	AdressText varchar(50) NOT NULL,
	TownId int FOREIGN KEY REFERENCES Towns(Id) NOT NULL
)

CREATE TABLE Departments
(
	Id int PRIMARY KEY IDENTITY,
	Name varchar(50) NOT NULL
)

CREATE TABLE Employees
(
	Id int PRIMARY KEY IDENTITY,
	FirstName varchar(15) NOT NULL,
	MiddleName varchar(15),
	LastName varchar(15) NOT NULL,
	JobTitle varchar(15) NOT NULL,
	DepartmentId int FOREIGN KEY REFERENCES Departments(Id),
	HireDate date,
	Salary real,
	AdressId int FOREIGN KEY REFERENCES Adresses(Id)
)