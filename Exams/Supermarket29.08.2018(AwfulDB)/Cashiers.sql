SELECT DISTINCT e.Id,e.FirstName,e.LastName
FROM Employees AS e
JOIN Orders AS o
ON e.Id = o.EmployeeId
ORDER BY e.Id