SELECT CONCAT(e.FirstName,' ',e.LastName) AS FullName,
	   CASE DATEPART(WEEKDAY,s.CheckIn)
		WHEN 1 THEN 'Sunday'
		WHEN 2 THEN 'Monday'
		WHEN 3 THEN 'Tuesday'
		WHEN 4 THEN 'Wednesday'
		WHEN 5 THEN 'Thursday'
		WHEN 6 THEN 'Friday'
		WHEN 7 THEN 'Saturday'
	   END AS DayOfWeek
FROM Employees AS e
LEFT OUTER JOIN Orders AS o
ON e.Id = o.EmployeeId
JOIN Shifts AS s
ON e.Id = s.EmployeeId
WHERE DATEPART(HOUR,s.CheckOut) - DATEPART(HOUR,s.CheckIn) > 12
	  AND
	  o.Id IS NULL
ORDER BY e.Id