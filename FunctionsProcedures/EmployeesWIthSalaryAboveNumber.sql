USE SoftUni
GO

CREATE PROC usp_GetEmployeesSalaryAboveNumber(@number money)
AS
	SELECT FirstName,LastName
	FROM Employees
	WHERE Salary >= @number
GO