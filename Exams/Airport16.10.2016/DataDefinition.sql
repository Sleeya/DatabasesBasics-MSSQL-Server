USE Airport
GO

CREATE TABLE Flights
(
	FlightID INT NOT NULL,
	DepartureTime datetime NOT NULL,
	ArrivalTime datetime NOT NULL,
	Status varchar(9)
	CHECK (Status IN('Departing','Delayed','Arrived','Cancelled')),
	OriginAirportID INT,
	DestinationAirportID INT,
	AirlineID INT
)

ALTER TABLE Flights
ADD CONSTRAINT PK_Flights PRIMARY KEY (FlightID),
	CONSTRAINT FK_Flights_Airports_OriginAirportID FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID),
	CONSTRAINT FK_Flights_Airports_DestinationAirportID FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID),
	CONSTRAINT FK_Flights_Airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)

CREATE TABLE Tickets
(
	TicketID INT NOT NULL,
	Price decimal(8,2) NOT NULL,
	Class varchar(6)
	CHECK (Class IN ('First','Second','Third')),
	Seat varchar(5) NOT NULL,
	CustomerID INT,
	FlightID INT
)

ALTER TABLE Tickets
ADD CONSTRAINT PK_Tickets PRIMARY KEY (TicketID),
	CONSTRAINT FK_Tickets_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_Tickets_Flights FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)

