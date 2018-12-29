SELECT CONCAT(FirstName,' ',LastName) AS 'Full Name',Phone AS 'Phone Number'
FROM Employees
WHERE LEFT(Phone,1) = 3
ORDER BY FirstName,Phone