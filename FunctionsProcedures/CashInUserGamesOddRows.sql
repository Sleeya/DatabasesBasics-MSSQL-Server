USE Diablo
GO

CREATE FUNCTION ufn_CashInUsersGames(@gameName varchar(50))
RETURNS @resultTable Table
		(
			SumCash numeric(10,4) NOT NULL
		)
AS
BEGIN
	INSERT INTO @resultTable
	SELECT SUM(Cash)
	FROM
	(
		SELECT Cash,ROW_NUMBER() OVER (ORDER BY Cash DESC) AS Number
		FROM UsersGames AS ug
		JOIN Games AS g
		ON ug.GameId = g.Id
		WHERE g.Name = @gameName
	) AS TempTable
	WHERE Number % 2 != 0
	RETURN 
END