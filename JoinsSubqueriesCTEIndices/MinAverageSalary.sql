USE SoftUni
SELECT MIN(AverageSalary) AS MinAverageSalary FROM
(
SELECT e.DepartmentID,AVG(e.Salary) AS AverageSalary
FROM Employees AS e
GROUP BY e.DepartmentID
) AS TempTable