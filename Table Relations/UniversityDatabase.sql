USE University

CREATE TABLE Majors
(
	MajorID int IDENTITY CONSTRAINT PK_Majors PRIMARY KEY,
	Name varchar(50)
)

CREATE TABLE Students
(
	StudentID int IDENTITY CONSTRAINT PK_Students PRIMARY KEY,
	StudentNumber char(8) NOT NULL,
	StudentName varchar(50) NOT NULL,
	MajorID int CONSTRAINT FK_Students_Majors FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
	PaymentID int IDENTITY CONSTRAINT PK_Payment PRIMARY KEY,
	PaymentDate date,
	PaymentAmount numeric(15,2),
	StudentID int CONSTRAINT FK_Payments_Students FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
	SubjectID int IDENTITY CONSTRAINT PK_Subjects PRIMARY KEY,
	SubjectName varchar(50) NOT NULL
)

CREATE TABLE Agenda
(
	StudentID int NOT NULL,
	SubjectID int NOT NULL,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID,SubjectID),
	CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
)


