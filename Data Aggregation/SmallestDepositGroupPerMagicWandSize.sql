USE Gringotts

SELECT DepositGroup,AVG(MagicWandSize)
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) = 
						(
							SELECT MIN(AvgSizeTable.AvgWandSize) FROM 
						(
							SELECT DepositGroup, AVG(MagicWandSize) AS AvgWandSize
							FROM WizzardDeposits
							GROUP BY DepositGroup
						) AS AvgSizeTable
						)

