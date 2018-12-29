SELECT TOP (10) o.Id,MAX(i.Price) AS MostExpensivePrice,MIN(i.Price) AS CheapestPrice
FROM Orders AS o
JOIN OrderItems AS oi
ON o.Id = oi.OrderId
JOIN Items AS i
ON oi.ItemId = i.Id
GROUP BY o.Id
ORDER BY Max(i.Price) DESC, o.Id