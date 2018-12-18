USE SoftUni

SELECT e.EmployeeID,e.FirstName,e.LastName,d.Name
FROM Employees as e
JOIN Departments as d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'