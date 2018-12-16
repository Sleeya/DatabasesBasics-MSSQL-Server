USE SoftUni

SELECT DISTINCT DepartmentID,Salary
FROM 
(
	SELECT DepartmentID,Salary, DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS SalaryRank
	FROM Employees
) AS OrderedTable
WHERE SalaryRank = 3

