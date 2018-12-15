USE CarRental

CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	CategoryName varchar(50) NOT NULL,
	DailyRate real,
	WeeklyRate real,
	MonthlyRate real,
	WeekendRate real
)

CREATE TABLE Cars
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	PlateNumber varchar(8),
	Manufacturer varchar(50) NOT NULL,
	Model varchar(30) NOT NULL,
	CarYear date,
	CategoryId int FOREIGN KEY REFERENCES Categories(id) NOT NULL,
	Doors int CHECK (Doors <=4 AND Doors >= 1),
	Picture varbinary(max),
	Condition varchar(3) CHECK(Condition = 'new' OR Condition = 'old'),
	Available varchar(3) CHECK(Available = 'yes' OR Available = 'no') 
)

CREATE TABLE Employees
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	FirstName varchar(25) NOT NULL,
	LastName varchar(15) NOT NULL,
	Title varchar(20),
	Notes text
)

CREATE TABLE Customers
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	DriverLicenceNumber varchar(20),
	FullName varchar(50) NOT NULL,
	Adress varchar(50),
	City varchar(30),
	ZIPCode varchar(6),
	Notes text
)

CREATE TABLE RentalOrders
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
	CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(Id),
	CarId int NOT NULL FOREIGN KEY REFERENCES Cars(id),
	TankLevel int,
	KilometrageStart int,
	KilometrageEnd int,
	TotalKilometrage int NOT NULL,
	StartDate date,
	EndDate date,
	TotalDays smallint NOT NULL,
	RateApplied real,
	TaxRate real,
	OrderStatus varchar(10),
	Notes text
)

INSERT INTO Categories(CategoryName)
VALUES ('CategoryOne'),('CategoryOne'),('CategoryOne');

INSERT INTO Cars(Manufacturer,Model,CategoryId)
VALUES ('Audi','A8',1),('Audi','A8',1),('Audi','A8',1);

INSERT INTO Employees(FirstName,LastName)
VALUES ('Georgi','Georgiev'),('Georgi','Georgiev'),('Georgi','Georgiev');

INSERT INTO Customers(FullName)
VALUES ('Kamen'),('Kamen'),('Kamen');

INSERT INTO RentalOrders(EmployeeId,CustomerId,CarId,TotalKilometrage, TotalDays)
VALUES (1,2,3,450,365),(1,2,3,450,365),(1,2,3,450,365);

