CREATE PROC usp_CancelOrder(@OrderId INT, @CancelDate DATETIME)
AS
BEGIN
	IF((SELECT Id FROM Orders WHERE Id = @OrderId) IS NULL)
		THROW 50001,'The order does not exist!',1;
	ELSE IF (DATEDIFF(DAY,(SELECT DateTime FROM Orders WHERE Id= @OrderId),@CancelDate) > 3)
		THROW 50002, 'You cannot cancel the order!',2
	ELSE
		BEGIN
			DELETE OrderItems
			WHERE OrderId = @OrderId
			DELETE Orders
			WHERE Id = @OrderId
		END
END