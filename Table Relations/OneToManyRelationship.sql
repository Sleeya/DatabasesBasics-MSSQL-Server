USE Test

CREATE TABLE Models
(
	ModelId int IDENTITY(100,1),
	Name varchar(15) NOT NULL,
	ManufacturerID int NOT NULL
)

CREATE TABLE Manufacturers
(
	ManufacturerID int IDENTITY(1,1),
	Name varchar(15),
	EstablishedOn date
)

ALTER TABLE Models
ADD CONSTRAINT PK_Models PRIMARY KEY (ModelID)

ALTER TABLE Manufacturers 
ADD CONSTRAINT PK_Manufacturers PRIMARY KEY (ManufacturerID)

ALTER TABLE Models
ADD CONSTRAINT FK_Models_Manfucturers FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)