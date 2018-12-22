CREATE PROC usp_PurchaseTicket(@CustomerID INT,@FlightID INT,@TicketPrice decimal(8,2),@Class varchar(6),@Seat varchar(5))
AS
BEGIN
	BEGIN TRAN
		IF NOT EXISTS (SELECT * FROM CustomerBankAccounts WHERE CustomerID = @CustomerID AND Balance >= @TicketPrice)
		BEGIN
			THROW 51000,'Insufficient bank account balance for ticket purchase.',1;
			ROLLBACK
		END

		UPDATE CustomerBankAccounts
		SET Balance -= @TicketPrice
		WHERE CustomerID = @CustomerID

		INSERT INTO Tickets(CustomerID,FlightID,Price,Class,Seat)
		VALUES (@CustomerID,@FlightID,@TicketPrice,@Class,@Seat)

	COMMIT
END
