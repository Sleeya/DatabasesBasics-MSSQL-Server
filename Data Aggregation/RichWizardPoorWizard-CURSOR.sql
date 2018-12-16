USE Gringotts	

DECLARE @currentDeposit decimal(8,2)
DECLARE @nextDeposit decimal(8,2)
DECLARE @sum decimal(8,2) = 0
DECLARE Iterator CURSOR
	FOR SELECT DepositAmount FROM WizzardDeposits

OPEN Iterator
FETCH NEXT FROM Iterator INTO @currentDeposit
WHILE (@@FETCH_STATUS = 0)
BEGIN
FETCH NEXT FROM Iterator INTO @nextDeposit
SET @sum += (@currentDeposit - @nextDeposit)
SET @currentDeposit = @nextDeposit
END
					
CLOSE Iterator
DEALLOCATE Iterator
SELECT @sum