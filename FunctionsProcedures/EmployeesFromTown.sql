USE SoftUni
GO

CREATE PROC usp_GetEmployeesFromTown(@townName varchar(50))
AS
	SELECT FirstName,LastName
	FROM Employees AS e
	JOIN Addresses AS a
	ON e.AddressID = a.AddressID
	JOIN Towns AS t
	ON a.TownID = t.TownID
	WHERE t.Name = @townName
GO