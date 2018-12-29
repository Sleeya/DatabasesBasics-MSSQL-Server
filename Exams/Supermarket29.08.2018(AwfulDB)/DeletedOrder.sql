CREATE TABLE DeletedOrders
(
	OrderId INT NOT NULL,
	ItemId INT NOT NULL,
	ItemQuantity INT NOT NULL
)
GO

CREATE TRIGGER tr_LogDeletedOrderItems ON OrderItems AFTER DELETE
AS 
BEGIN
	INSERT INTO DeletedOrders
	SELECT o.Id,i.Id,d.Quantity
	FROM Deleted AS d
	JOIN Items AS i
	ON d.ItemId = i.Id
	JOIN Orders AS o
	ON d.OrderId = o.Id
END