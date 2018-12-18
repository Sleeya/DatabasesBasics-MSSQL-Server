WITH CTE_CountriesInfo (ContinentCode,CurrencyCode, CountOfUsages)
AS
(
	SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CountOfUsages 
	FROM Countries
	GROUP BY ContinentCode, CurrencyCode
)
SELECT SortedTable.ContinentCode,CTE.CurrencyCode,SortedTable.MaxUsage FROM 
(
	SELECT ContinentCode,MAX(CountOfUsages) AS MaxUsage
	FROM CTE_CountriesInfo
	GROUP BY ContinentCode
) AS SortedTable
JOIN CTE_CountriesInfo AS CTE
ON SortedTable.ContinentCode = CTE.ContinentCode AND SortedTable.MaxUsage = CTE.CountOfUsages
WHERE SortedTable.MaxUsage > 1
ORDER BY SortedTable.ContinentCode

