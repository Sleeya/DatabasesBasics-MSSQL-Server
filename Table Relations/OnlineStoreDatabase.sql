USE TestTwo
	
CREATE TABLE Customers
(
	CustomerID int IDENTITY,
	Name varchar(50),
	Birthday date,
	CityID int
)

CREATE TABLE Cities
(
	CityID int IDENTITY,
	Name varchar(50) NOT NULL
)

CREATE TABLE Items
(
	ItemID int IDENTITY,
	Name varchar(50) NOT NULL,
	ItemTypeID int
)
CREATE TABLE ItemTypes
(
	ItemTypeID int IDENTITY,
	Name varchar(50) NOT NULL
)

CREATE TABLE OrderItems
(
	OrderID int NOT NULL,
	ItemID int NOT NULL
)

CREATE TABLE Orders
(
	OrderID int IDENTITY,
	CustomerID int NOT NULL
)

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)

ALTER TABLE Cities
ADD CONSTRAINT PK_Cities PRIMARY KEY (CityID)

ALTER TABLE Items
ADD CONSTRAINT PK_Items PRIMARY KEY (ItemID)

ALTER TABLE ItemTypes
ADD CONSTRAINT PK_ItemTypes PRIMARY KEY (ItemTypeID)

ALTER TABLE OrderItems
ADD CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID,ItemID)

ALTER TABLE Orders
ADD CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
	CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

ALTER TABLE Items
ADD CONSTRAINT FK_Items_ItemTypes FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes(ItemTypeID)

ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT FK_OrderItems_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)

