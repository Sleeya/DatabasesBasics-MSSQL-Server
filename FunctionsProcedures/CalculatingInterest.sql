USE Bank
GO

CREATE PROC usp_CalculateFutureValueForAccount(@accountId int, @interestRate float)
AS
BEGIN
	SELECT ah.Id,ah.FirstName,ah.LastName,acc.Balance,dbo.ufn_CalculateFutureValue(acc.Balance,@interestRate,5)
	FROM AccountHolders AS ah
	JOIN Accounts AS acc
	ON ah.Id = acc.Id
	WHERE ah.Id = @accountId
END