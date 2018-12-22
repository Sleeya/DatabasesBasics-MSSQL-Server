USE SoftUni
GO

CREATE PROC usp_GetTownsStartingWith(@input varchar(50))
AS
	SELECT Name
	FROM Towns
	WHERE LEFT(Name,LEN(@input)) = @input 
GO