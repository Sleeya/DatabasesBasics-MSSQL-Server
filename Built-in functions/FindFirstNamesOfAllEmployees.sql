USE SoftUni

SELECT FirstName
FROM Employees
WHERE (DATEPART(YEAR,HireDate) BETWEEN 1995 AND 2005) AND DepartmentId IN (3,10)