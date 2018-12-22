CREATE TABLE CustomerReviews
(
	ReviewID INT NOT NULL,
	ReviewContent varchar(255) NOT NULL,
	ReviewGrade INT CHECK (ReviewGrade BETWEEN 1 AND 10),
	AirlineID INT,
	CustomerID INT
)

ALTER TABLE CustomerReviews
ADD CONSTRAINT PK_CustomerReviews PRIMARY KEY (ReviewID),
	CONSTRAINT FK_CustomerReviews_Airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
	CONSTRAINT FK_CusomterReviews_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

CREATE TABLE CustomerBankAccounts
(
	AccountID INT NOT NULL,
	AccountNumber varchar(10) NOT NULL UNIQUE,
	Balance decimal(10,2) NOT NULL,
	CustomerID INT
)

ALTER TABLE CustomerBankAccounts 
ADD CONSTRAINT PK_CustomerBankAccounts PRIMARY KEY (AccountID),
	CONSTRAINT FK_CustomerBankAccounts_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)