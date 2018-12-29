SELECT TOP (1) o.Id,SUM((i.Price * oi.Quantity))
FROM Orders AS o
JOIN OrderItems AS oi
ON o.Id = oi.OrderId
JOIN Items AS i
ON oi.ItemId = i.Id
GROUP BY o.Id
ORDER BY SUM((i.Price * oi.Quantity)) DESC

