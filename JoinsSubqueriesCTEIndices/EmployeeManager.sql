USE SoftUni

SELECT e.EmployeeID,e.FirstName,e.ManagerID,em.FirstName
FROM Employees AS e
JOIN Employees as em
ON e.ManagerID = em.EmployeeID
WHERE e.ManagerID IN(3,7)
ORDER BY e.EmployeeID