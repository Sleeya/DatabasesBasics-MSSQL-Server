USE SoftUni

SELECT TownId,Name
FROM Towns
WHERE Name NOT LIKE 'r%' AND Name NOT LIKE 'b%' AND Name NOT LIKE 'd%'
ORDER BY Name