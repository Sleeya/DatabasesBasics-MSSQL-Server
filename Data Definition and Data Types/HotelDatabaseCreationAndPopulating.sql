USE Hotel

CREATE TABLE Employees
(
	Id int PRIMARY KEY IDENTITY,
	FirstName varchar(15) NOT NULL,
	LastName varchar(15),
	Title varchar (15) NOT NULL,
	Notes text
)

CREATE TABLE Customers
(
	AccountNumber varchar(25) NOT NULL,
	FirstName varchar(15) NOT NULL,
	LastName varchar(15),
	PhoneNumber varchar(10),
	EmergencyName varchar(30),
	EmergencyNumber varchar(10),
	Notes text
)

CREATE TABLE RoomStatus
(
	RoomStatus varchar(10) NOT NULL CHECK ( RoomStatus = 'Occupied' OR RoomStatus = 'Unoccupied'),
	Notes text
)

CREATE TABLE RoomTypes
(
	RoomType varchar(25) NOT NULL,
	Notes text
)

CREATE TABLE BedTypes
(
	BedType varchar(25) NOT NULL,
	Notes text
)

CREATE TABLE Rooms
(
	RoomNumber smallint  NOT NULL,
	RoomType varchar(25)  NOT NULL,
	BedType varchar(25) NOT NULL,
	Rate real,
	RoomStatus varchar(10) NOT NULL,
	Notes text
)

CREATE TABLE Payments
(
	Id int PRIMARY KEY IDENTITY,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	PaymentDate date,
	AccountNumber varchar(10),
	FirstDateOccupied date,
	LastDateOccupied date,
	TotalDays smallint,
	AmountCharged real,
	TaxRate int DEFAULT 20,
	TaxAmount real,
	PaymentTotal real,
	Notes text
)

CREATE TABLE Occupancies
(
	Id int PRIMARY KEY IDENTITY,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	DateOccupied date,
	AccountNumber varchar(10),
	RoomNumber smallint,
	RateApplied real,
	PhoneCharge real,
	Notes text
)


INSERT INTO Employees (FirstName,Title)
VALUES ('Georgi','Sir'),('Georgi','Sir'),('Georgi','Sir')

INSERT INTO Customers(AccountNumber,FirstName)
VALUES ('9328742','Georgi'),('9328742','Georgi'),('9328742','Georgi')

INSERT INTO RoomStatus(RoomStatus)
VALUES ('Occupied'),('Occupied'),('Occupied')

INSERT INTO RoomTypes(RoomType)
VALUES ('Double Bedroom'),('Double Bedroom'),('Double Bedroom')

INSERT INTO BedTypes(BedType)
VALUES ('Double'),('Double'),('Double')

INSERT INTO Rooms(BedType,RoomNumber,RoomStatus,RoomType)
VALUES ('Double',3,'Occupied','Bedroom'),('Double',3,'Occupied','Bedroom'),('Double',3,'Occupied','Bedroom')

INSERT INTO Payments(EmployeeId)
VALUES (1),(1),(1)

INSERT INTO Occupancies(EmployeeId)
VALUES (1),(1),(1)
