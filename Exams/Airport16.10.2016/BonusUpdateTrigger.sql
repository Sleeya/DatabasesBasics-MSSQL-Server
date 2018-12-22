CREATE TABLE ArrivedFlights
(
	FlightID INT PRIMARY KEY,
	ArrivalTime datetime NOT NULL,
	Origin varchar(50) NOT NULL,
	Destination varchar(50) NOT NULL,
	Passengers INT NOT NULL
)

GO

CREATE TRIGGER tr_LogArrivedFlightsInfo ON Flights AFTER UPDATE
AS
BEGIN
	IF('Arrived' NOT IN ((SELECT Status FROM deleted)) AND 'Arrived' IN (SELECT Status FROM inserted))
	BEGIN 
		INSERT INTO ArrivedFlights(FlightID,ArrivalTime,Origin,Destination,Passengers)
		SELECT i.FlightID,i.ArrivalTime,originAirport.AirportName,destinationAirport.AirportName,(SELECT COUNT(*) FROM Tickets WHERE FlightID = i.FlightID) AS Passengers
		FROM inserted AS i
		JOIN Airports AS originAirport
		ON i.OriginAirportID  = originAirport.AirportID
		JOIN Airports AS destinationAirport
		ON i.DestinationAirportID = destinationAirport.AirportID
	END
END