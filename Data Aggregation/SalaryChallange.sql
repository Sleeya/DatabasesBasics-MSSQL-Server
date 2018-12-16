USE SoftUni

SELECT TOP 10 FirstName,LastName,DepartmentID
FROM Employees AS E
WHERE Salary > 
(
	SELECT AVG(Salary)
	FROM Employees
	WHERE DepartmentID = E.DepartmentID
)
ORDER BY DepartmentID

