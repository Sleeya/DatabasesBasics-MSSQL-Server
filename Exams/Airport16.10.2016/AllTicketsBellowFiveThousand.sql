SELECT t.TicketID,a.AirportName,CONCAT(c.FirstName,' ',c.LastName) AS CustomerName
FROM Tickets AS t
JOIN Flights AS f
ON t.FlightID = f.FlightID
JOIN Airports AS a
ON f.DestinationAirportID = a.AirportID
JOIN Customers AS c
ON t.CustomerID = c.CustomerID
WHERE t.Price < 5000 AND t.Class = 'First'
ORDER BY TicketID
