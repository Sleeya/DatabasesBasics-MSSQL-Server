USE Bank
GO

CREATE FUNCTION ufn_CalculateFutureValue(@sum numeric(20,5), @yearlyInterestRate float, @numberOfYears int)
RETURNS numeric(20,4)
BEGIN
	DECLARE @counter int = 1;

	WHILE(@counter <= @numberOfYears)
	BEGIN
		SET @sum += @sum * @yearlyInterestRate;
		SET @counter+=1;
	END

	RETURN @sum
END