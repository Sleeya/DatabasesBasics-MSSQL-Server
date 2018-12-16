USE SoftUni

SELECT TownId,Name
FROM Towns
WHERE Name LIKE 'm%' OR Name LIKE 'b%' OR Name LIKE 'e%' OR Name LIKE 'k%'
ORDER BY Name