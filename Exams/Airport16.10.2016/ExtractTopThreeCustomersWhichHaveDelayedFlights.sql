SELECT TOP(3) c.CustomerID,
	   CONCAT(c.FirstName,' ',c.LastName) AS FullName,
	   t.Price AS TicketPrice,
	   a.AirportName AS Destination
FROM Customers AS c
JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
JOIN Flights AS f
ON t.FlightID = f.FlightID
JOIN Airports AS a
ON f.DestinationAirportID = a.AirportID
WHERE f.Status = 'Delayed'
ORDER BY TicketPrice DESC,CustomerID