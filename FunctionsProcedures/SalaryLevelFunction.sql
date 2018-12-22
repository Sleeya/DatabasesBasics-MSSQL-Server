USE SoftUni
GO

CREATE FUNCTION ufn_GetSalaryLevel(@salary money)
RETURNS varchar(7)
AS
BEGIN
	DECLARE @salaryLevel varchar(7)
	IF(@salary < 30000)
	BEGIN
		SET @salaryLevel = 'Low'
	END
	ELSE IF(@salary >= 30000 AND @salary <= 50000)
	BEGIN
		SET @salaryLevel = 'Average'
	END
	ELSE
	BEGIN
		SET @salaryLevel = 'High'
	END

	RETURN @salaryLevel
END;