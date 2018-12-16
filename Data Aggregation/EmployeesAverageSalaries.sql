USE SoftUni

SELECT DepartmentId,Salary,ManagerID INTO TempTable
FROM Employees
WHERE Salary > 30000

DELETE FROM TempTable
WHERE ManagerID = 42

UPDATE TempTable
SET Salary += 5000
WHERE DepartmentId = 1

SELECT DepartmentId,AVG(Salary) AS AverageSalary
FROM TempTable
GROUP BY DepartmentId
