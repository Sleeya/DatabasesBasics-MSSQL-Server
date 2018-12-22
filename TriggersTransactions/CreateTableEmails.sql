USE Bank
GO

CREATE TABLE NotificationEmails
(
	Id INT IDENTITY,
	Recipient INT,
	Subject varchar(60),
	Body varchar(60)
)
GO

CREATE TRIGGER tr_LoggedChangeEmail ON Logs AFTER INSERT
AS
BEGIN
	DECLARE @recipient INT = (SELECT accountId FROM inserted);
	DECLARE @subject varchar(60) = CONCAT('Balance change for account: ',(SELECT accountId FROM inserted));
	DECLARE @body varchar(60) = CONCAT('On ',GETDATE(),'your balance was changed from',(SELECT OldSum FROM inserted),' to ',(SELECT NewSum FROM inserted));

	INSERT INTO NotificationEmails(Recipient,Subject,Body)
	VALUES (@recipient,@subject,@body)
END