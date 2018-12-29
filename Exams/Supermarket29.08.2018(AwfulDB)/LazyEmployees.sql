SELECT DISTINCT e.Id,
	   CONCAT(e.FirstName,' ',e.LastName) AS FullName
FROM Employees AS e
JOIN Shifts AS s
ON e.Id = s.EmployeeId
WHERE DATEPART(HOUR,s.CheckOut) - DATEPART(HOUR,s.CheckIn) < 4
ORDER BY e.Id