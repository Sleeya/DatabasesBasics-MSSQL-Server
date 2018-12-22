USE SoftUni
GO

CREATE PROC usp_EmployeesBySalaryLevel(@salaryLevel varchar(7))
AS
	SELECT FirstName,LastName
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryLevel
GO

