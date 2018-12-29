CREATE FUNCTION udf_GetPromotedProducts(@CurrentDate DATETIME,@StartDate DATETIME,@EndDate DATETIME,@Discount DECIMAL(10,2)
,@FirstItemId INT,@SecondItemId INT,@ThirdItemId INT)
RETURNS VARCHAR(MAX)
BEGIN
	DECLARE @Result VARCHAR(MAX)

	DECLARE @FirstItemPrice decimal(10,2) = (SELECT Price FROM Items WHERE Id = @FirstItemId) 
	DECLARE @SecondItemPrice decimal(10,2) = (SELECT Price FROM Items WHERE Id = @SecondItemId)
	DECLARE @ThirdItemPrice decimal(10,2) = (SELECT Price FROM Items WHERE Id = @ThirdItemId)

	IF(@FirstItemPrice IS NULL OR @SecondItemPrice IS NULL OR @ThirdItemPrice IS NULL)
		BEGIN
			SET @Result =  'One of the items does not exists!';
		END
	ELSE IF (@CurrentDate NOT BETWEEN @StartDate AND @EndDate)
		BEGIN
			SET @Result = 'The current date is not within the promotion dates!';
		END
	ELSE
		BEGIN
			DECLARE @FirstItemName varchar(20) = (SELECT Name FROM Items WHERE Id = @FirstItemId)
			DECLARE @SecondItemName varchar(20) = (SELECT Name FROM Items WHERE Id = @SecondItemId)
			DECLARE @ThirdItemName varchar(20) = (SELECT Name FROM Items WHERE Id = @ThirdItemId)

			SET @FirstItemPrice  *= (1-@Discount * 0.01)
			SET @SecondItemPrice *= (1-@Discount * 0.01)
			SET @ThirdItemPrice *= (1-@Discount * 0.01)

			SET @Result = @FirstItemName + ' price: ' + CONVERT(VARCHAR(12),@FirstItemPrice) +' <-> ' + @SecondItemName + ' price: ' 
			+ CONVERT(VARCHAR(12),@SecondItemPrice) + ' <-> ' + @ThirdItemName + ' price: ' + CONVERT(VARCHAR(12),@ThirdItemPrice)
		END
	RETURN @Result
END