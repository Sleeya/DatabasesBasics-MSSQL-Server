USE SoftUni

INSERT INTO Towns(Name)
VALUES ('Sofia'),('Plovdiv'),('Varna'),('Burgas')

INSERT INTO Departments(Name)
VALUES ('Engineering'),('Sales'),('Marketing'),('Software Development'),('Quality Assurance')

INSERT INTO Employees(FirstName,MiddleName,LastName,JobTitle,Department,HireDate,Salary)
VALUES ('Ivan','Ivanov','Ivanov','.Net Developer','Software Developer','2013-02-01',3500.00),
	   ('Petar','Petrov','Petrov','Senior Engineer','Engineer','2004-03-02',4000.00),
	   ('Maria','Petrova','Ivanova','Intern','Quality Assurance','2016-08-28',525.25),
	   ('Georgi','Teziev','Ivanov','CEO','Sales','2007-12-09',3000.00),
	   ('Petar','Pan','Pan','Intern','Marketing','2016-08-28',599.88)