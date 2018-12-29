SELECT TOP (10) CONCAT(e.FirstName,' ',e.LastName) AS FullName,
	   SUM(oi.Quantity * i.Price) AS TotalPrice,
	   SUM(oi.Quantity) AS Items
FROM Employees AS e
JOIN Orders AS o
ON e.Id = o.EmployeeId
JOIN OrderItems AS oi
ON o.Id = oi.OrderId
JOIN Items AS i
ON oi.ItemId = i.Id
WHERE o.DateTime < '2018-06-15'
GROUP BY CONCAT(e.FirstName,' ',e.LastName)
ORDER BY TotalPrice DESC, Items DESC