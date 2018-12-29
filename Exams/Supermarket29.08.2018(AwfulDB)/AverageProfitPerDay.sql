SELECT DATEPART(DAY,o.DateTime) AS Day,
	   CONVERT(DECIMAL (10,2),AVG(i.Price * oi.Quantity)) AS TotalProfit
FROM Orders AS o
JOIN OrderItems AS oi
ON o.Id = oi.OrderId
JOIN Items AS i
ON oi.ItemId = i.Id
GROUP BY DATEPART(DAY,o.DateTime)
ORDER BY Day