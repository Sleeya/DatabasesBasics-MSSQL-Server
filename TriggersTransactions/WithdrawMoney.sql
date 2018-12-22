USE BANK
GO

CREATE PROC usp_WithDrawMoney(@AccountId int,@MoneyAmount decimal(10,4))
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance -= @MoneyAmount
		WHERE Id = @AccountId

		IF((SELECT Balance FROM Accounts WHERE Id = @AccountId) < 0)
		BEGIN
			ROLLBACK
		END
	COMMIT
END