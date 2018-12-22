USE SoftUni
GO

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters varchar(50), @word varchar(50))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT = 'True';
	DECLARE @indexCounter smallint = 1;
	DECLARE @digit char;
	WHILE(@result != 'False' AND @indexCounter != LEN(@word)+1)
	BEGIN
		SET @digit = SUBSTRING(@word,@indexCounter,1)
		IF(CHARINDEX(@digit,@setOfLetters) = 0)
		BEGIN
			SET @result = 'False'
		END
		SET @indexCounter += 1;
	END

	return @result
END;


