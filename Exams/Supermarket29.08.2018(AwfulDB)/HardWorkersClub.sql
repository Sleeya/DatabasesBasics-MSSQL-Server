SELECT  e.FirstName,
		e.LastName,
		AVG(DATEPART(HOUR,CheckOut) - DATEPART(HOUR,CheckIn)) AS WorkHours
FROM Employees AS e
JOIN Shifts AS s
ON e.Id = s.EmployeeId
GROUP BY e.Id,e.FirstName,e.LastName
HAVING AVG(DATEPART(HOUR,CheckOut) - DATEPART(HOUR,CheckIn)) > 7
ORDER BY WorkHours DESC,e.Id



