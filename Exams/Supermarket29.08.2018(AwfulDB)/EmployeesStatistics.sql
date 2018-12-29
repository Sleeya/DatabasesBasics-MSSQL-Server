SELECT  FirstName,LastName,COUNT(*) AS 'Count'
FROM Employees AS e
JOIN Orders AS o
ON e.Id = o.EmployeeId
GROUP BY FirstName,LastName
ORDER BY Count DESC,FirstName