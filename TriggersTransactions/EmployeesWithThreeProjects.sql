USE SoftUni
GO

CREATE PROC usp_AssignProject(@employeeId int, @projectId int)
AS
BEGIN
	BEGIN TRAN
		IF((SELECT COUNT(*) FROM EmployeesProjects WHERE EmployeeID = @employeeId) >= 3)
		BEGIN
			THROW 51000, 'The employee has too many projects!',1;
			ROLLBACK
		END
		ELSE
		BEGIN
			INSERT INTO EmployeesProjects(EmployeeID,ProjectID)
			VALUES (@employeeId,@projectId)
		END
	COMMIT
END