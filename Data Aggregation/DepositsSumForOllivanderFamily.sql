USE Gringotts

SELECT DepositGroup,SUM(DepositAmount) AS 'TotalSum' 
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander Family'
GROUP BY DepositGroup