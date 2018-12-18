USE Test

CREATE TABLE Students
(
	StudentID int IDENTITY(1,1),
	Name varchar(15) NOT NULL
)

CREATE TABLE Exams
(
	ExamID int IDENTITY(101,1),
	Name varchar(15)
)

CREATE TABLE StudentsExams
(
	StudentID int NOT NULL,
	ExamID int NOT NULL
)

ALTER TABLE Students
ADD CONSTRAINT PK_Students PRIMARY KEY (StudentID)

ALTER TABLE Exams 
ADD CONSTRAINT PK_Exams PRIMARY KEY (ExamID)

ALTER TABLE StudentsExams 
ADD CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID,ExamID)

ALTER TABLE StudentsExams
ADD CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
