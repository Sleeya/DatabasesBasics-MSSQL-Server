USE Supermarket
GO

CREATE TABLE Categories
(
	Id INT IDENTITY NOT NULL,
	Name nvarchar(30) NOT NULL
)

CREATE TABLE Items
(
	Id INT IDENTITY NOT NULL,
	Name nvarchar(30) NOT NULL,
	Price decimal(12,2) NOT NULl,
	CategoryId INT NOT NULL
)

CREATE TABLE Employees
(
	Id INT IDENTITY NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Phone char(12) NOT NULL,
	Salary decimal(12,2) NOT NULL
)

CREATE TABLE Orders
(
	Id INT IDENTITY NOT NULL,
	DateTime datetime NOT NULL,
	EmployeeId INT NOT NULL
)

CREATE TABLE OrderItems
(
	OrderId INT NOT NULL,
	ItemId INT NOT NULL,
	Quantity INT NOT NULL CHECK (Quantity >= 1)
)

CREATE TABLE Shifts
(
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	CheckIn DATETIME NOT NULL,
	CheckOut DATETIME NOT NULL
)

ALTER TABLE Categories
ADD CONSTRAINT PK_Categories PRIMARY KEY (Id)

ALTER TABLE Items
ADD CONSTRAINT PK_Items PRIMARY KEY (Id),
	CONSTRAINT FK_Items_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees PRIMARY KEY (Id)

ALTER TABLE Orders
ADD CONSTRAINT PK_Orders PRIMARY KEY (Id),
	CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderId) REFERENCES Orders(Id),
	CONSTRAINT FK_OrderItems_Items FOREIGN KEY (ItemId) REFERENCES Items(Id)

ALTER TABLE Shifts
ADD CONSTRAINT PK_Shifts PRIMARY KEY (Id),
	CONSTRAINT FK_Shifts_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	CONSTRAINT CK_CheckOut_CheckIn CHECK (CheckOut > CheckIn)