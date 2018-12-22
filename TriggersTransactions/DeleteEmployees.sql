USE SoftUni
GO

CREATE TABLE DeletedEmployees
(
	EmployeeId INT PRIMARY KEY IDENTITY,
	FirstName varchar(25),
	LastName varchar(25),
	MiddleName varchar(25),
	JobTitle varchar(25),
	DepartmentId INT,
	Salary numeric(10,2)
)
GO

CREATE TRIGGER tr_LogDeletedEmployeesRecords ON Employees FOR DELETE
AS
BEGIN
	INSERT INTO DeletedEmployees(FirstName,LastName,MiddleName,JobTitle,DepartmentId,Salary)
	SELECT d.FirstName,d.LastName,d.MiddleName,d.JobTitle,d.DepartmentID,d.Salary
	FROM deleted AS d
END

