USE Gringotts

SELECT SUM(DifferenceTable.Differences) AS DifferenceSum
FROM
(
	SELECT (DepositAmount -
	   LEAD (DepositAmount) OVER (Order BY Id)) AS Differences
	   FROM WizzardDeposits
) AS DifferenceTable