SELECT i.Name AS Item,
	   c.Name AS Category,
	   SUM(oi.Quantity) AS Count,
	   SUM(i.Price * oi.Quantity) AS TotalPrice
FROM Items AS i
LEFT OUTER JOIN Categories AS c
ON i.CategoryId = c.Id
LEFT OUTER JOIN OrderItems AS oi
ON i.Id = oi.ItemId
GROUP BY i.Name,c.Name
ORDER BY TotalPrice DESC, Count DESC