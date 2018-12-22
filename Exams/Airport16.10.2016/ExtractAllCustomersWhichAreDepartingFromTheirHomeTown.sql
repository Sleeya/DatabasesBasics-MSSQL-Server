SELECT DISTINCT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName) AS FullName,t.TownName AS HomeTown
FROM Customers AS c
JOIN Towns AS t
ON c.HomeTownID = t.TownID
JOIN Tickets AS ti
ON ti.CustomerID = c.CustomerID
JOIN Flights AS f 
ON ti.FlightID = f.FlightID
JOIN Airports AS a
ON f.OriginAirportID = a.AirportID
WHERE c.HomeTownID = a.TownID
ORDER BY c.CustomerID