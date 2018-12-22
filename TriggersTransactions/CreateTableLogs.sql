USE Bank
GO

CREATE TABLE Logs
(
	LogId INT IDENTITY,
	AccountId INT NOT NULL,
	OldSum numeric(10,2),
	NewSum numeric(10,2)
)
GO

CREATE TRIGGER tr_LogAccountSumChange ON Accounts AFTER UPDATE
AS
BEGIN
	DECLARE @accountId INT = (SELECT Id FROM inserted);
	DECLARE @OldSum numeric(10,2) = (SELECT Balance FROM deleted);
	DECLARE @NewSum numeric(10,2) = (SELECT Balance FROM inserted);
	
	INSERT INTO Logs(AccountId,OldSum,NewSum)
	VALUES (@accountId,@OldSum,@NewSum)
END

