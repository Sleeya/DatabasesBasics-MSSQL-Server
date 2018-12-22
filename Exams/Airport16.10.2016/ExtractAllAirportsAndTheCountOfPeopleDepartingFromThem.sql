SELECT a.AirportID,a.AirportName,COUNT(t.TicketID) AS Passengers
FROM Airports AS a
JOIN Flights AS f
ON a.AirportID = f.OriginAirportID
JOIN Tickets AS t
ON f.FlightID = t.FlightID
WHERE f.Status = 'Departing'
GROUP BY AirportName,AirportID
