USE Bank
GO

CREATE PROC usp_TransferMoney(@SenderId int,@ReceiverId int, @Amount decimal(10,4))
AS
BEGIN
	BEGIN TRAN
		EXEC dbo.usp_WithDrawMoney @SenderId,@Amount
		EXEC dbo.usp_DepositMoney @ReceiverId,@Amount
	COMMIT
END

