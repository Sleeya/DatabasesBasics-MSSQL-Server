SELECT DISTINCT c.CustomerID,
	   CONCAT(c.FirstName,' ',c.LastName) AS FullName,
	   DATEDIFF(YEAR,c.DateOfBirth,GETDATE()) AS Age
FROM Customers AS c
JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
JOIN Flights AS f
ON t.FlightID = f.FlightID
WHERE f.Status = 'Departing'
ORDER BY Age,CustomerID