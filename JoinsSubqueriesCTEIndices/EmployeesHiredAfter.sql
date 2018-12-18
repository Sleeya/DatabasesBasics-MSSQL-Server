USE SoftUni

SELECT e.FirstName,e.LastName,e.HireDate,d.Name
FROM Employees as e
JOIN Departments as d
ON d.DepartmentID = e.DepartmentID
WHERE e.HireDate > '1999/1/1' AND d.Name IN ('Sales','Finance')
ORDER BY e.HireDate