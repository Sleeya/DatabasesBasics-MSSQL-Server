USE Bank
GO

CREATE PROC usp_GetHoldersWithBalanceHigherThan(@inputNumber money)
AS
BEGIN
	
	SELECT FirstName,LastName
	FROM AccountHolders AS ah
	JOIN Accounts AS acc
	ON ah.Id = acc.AccountHolderId
	GROUP BY FirstName,LastName
	HAVING SUM(Balance) > @inputNumber
END