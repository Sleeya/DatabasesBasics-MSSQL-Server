USE Minions

CREATE TABLE Users
(
	Id int PRIMARY KEY IDENTITY,
	Username varchar(30) UNIQUE NOT NULL,
	Password varchar(26) NOT NULL,
	ProfilePicture image,
	LastLoginTime date,
	isDeleted varchar(5) CHECK (isDeleted = 'true' OR isDeleted = 'false')
)

INSERT INTO Users(Username,Password,isDeleted)
VALUES ('FirstUser','sdassad','true'),
		('SecondUser','sdassad','true'),
		('ThirdUser','sdassad','true'),
		('ForthUser','sdassad','true'),
		('FifthUser','sdassad','true');