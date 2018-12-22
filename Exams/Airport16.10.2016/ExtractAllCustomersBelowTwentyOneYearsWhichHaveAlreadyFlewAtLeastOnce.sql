SELECT DISTINCT c.CustomerID,
	   CONCAT(c.FirstName,' ',c.LastName) AS FullName,
	   2016 - DATEPART(YEAR,c.DateOfBirth) AS Age
FROM Customers AS c
JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
JOIN Flights AS f
ON t.FlightID = f.FlightID
WHERE 2016 - DATEPART(YEAR,c.DateOfBirth) < 21 AND f.Status = 'Arrived'
ORDER BY Age DESC,CustomerID