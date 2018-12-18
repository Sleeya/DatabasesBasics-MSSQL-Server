USE Test

CREATE TABLE Teachers
(
	TeacherID int IDENTITY(101,1),
	Name varchar(15) NOT NULL,
	ManagerID int 
)

INSERT INTO Teachers(Name,ManagerID)
VALUES ('John',NULL),('Maya',106),('Silvia',106),('Ted',105),('Mark',101),('Greta',101)

ALTER TABLE Teachers
ADD CONSTRAINT PK_Teachers PRIMARY KEY (TeacherID),
	CONSTRAINT FK_ManagerID_TeacherID FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)