USE BANK
GO

CREATE PROC usp_DepositMoney(@AccountId int,@MoneyAmount decimal(10,4))
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance += @MoneyAmount
		WHERE Id = @AccountId
	COMMIT
END