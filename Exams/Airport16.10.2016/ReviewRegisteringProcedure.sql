CREATE PROC usp_SubmitReview(@CustomerID INT, @ReviewContent varchar(255),@ReviewGrade INT,@AirlineName varchar(30))
AS
BEGIN
	BEGIN TRAN
		IF NOT EXISTS (SELECT AirlineName FROM Airlines WHERE AirlineName = @AirlineName)
		BEGIN
			THROW 51000,'Airline does not exist.',1;
			ROLLBACK
		END
		INSERT INTO CustomerReviews(CustomerID,ReviewContent,ReviewGrade,AirlineID)
		VALUES (@CustomerID,@ReviewContent,@ReviewGrade, (SELECT AirlineID FROM Airlines WHERE AirlineName = @AirlineName))
	COMMIT
END

