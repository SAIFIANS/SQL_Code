CREATE DATABASE excelr;

USE excelr;

CREATE TABLE StudentDetails(
	StudentId INT,
    StudentName CHAR(20)
);

SELECT * FROM StudentDetails;


DROP TABLE StudentDetails;


CREATE TABLE StudentDetails(
	StudentId INT,
    StudentName CHAR(20),
    Age TINYINT,
    Gender VARCHAR(10)
);


INSERT INTO StudentDetails VALUES(1,'Chitti',20,'Male',1);
INSERT INTO StudentDetails VALUES(2,'Sana',19,'female',2);
INSERT INTO StudentDetails VALUES(3,'Ram',21,'Male',1);
INSERT INTO StudentDetails VALUES(4,'Kiran',23,'Male',3);
ALTER TABLE StudentDetails ADD CourseId TINYINT;

SELECT * FROM StudentDetails;

TRUNCATE TABLE StudentDetails;



UPDATE StudentDetails SET CourseId = 1 WHERE StudentId =1;

SET SQL_SAFE_UPDATES=0;

DELETE FROM StudentDetails WHERE StudentId = 1;

SET AutoCommit =0;

START TRANSACTION;
SELECT * FROM StudentDetails;
DELETE FROM StudentDetails WHERE StudentId = 3;
ROLLBACK;

CREATE TABLE CourseDetails(
	CourseId TINYINT,
    CourseName VARCHAR(20),
    CourseFee INT
);

INSERT INTO CourseDetails VALUES (1,'SQL',12000),(2,'PowerBI',10000);

SELECT * FROM CourseDetails;


CREATE DATABASE BankDetails;
USE BankDetails;

CREATE TABLE AccountDetails(
	AccountId INT PRIMARY KEY,
    Name CHAR(30) NOT NULL,
    Age TINYINT CHECK(Age>18),
    AccountType VARCHAR(20),
    CurrentBalance INT DEFAULT(0)
);

INSERT INTO AccountDetails VALUES(1,'Ram',21,'Savings',Default);

INSERT INTO AccountDetails(AccountId,Name,Age,AccountType) VALUES(1,'Ram',21,'Savings');

SELECT * FROM AccountDetails;

INSERT INTO AccountDetails VALUES(2,'Sana',19,'Savings',Default);

INSERT INTO AccountDetails VALUES(3,'Jhon',19,'Current',Default);

CREATE TABLE TransactionDetails(
	TransactionId INT PRIMARY KEY auto_increment,
    AccountId INT,
    TransactionTime DATETIME DEFAULT(NOW()),
    TransactionAmount INT,
    TransactionType VARCHAR(10) CHECK(TransactionType='Credit' OR TransactionType='Debit'),
    FOREIGN KEY(AccountId) REFERENCES AccountDetails(AccountId)
);

SELECT NOW();

INSERT INTO TransactionDetails(AccountId,TransactionAmount,TransactionType) VALUES(1,1000,'Credit');

SELECT * FROM TransactionDetails;

DELETE FROM AccountDetails WHERE AccountId=1;

SELECT StudentId,StudentName FROM StudentDetails;

SELECT SD.StudentId,SD.StudentName,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId;


SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									Left JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId;
                                    
INSERT INTO CourseDetails VALUES(4,'Tableau',10000);
                                    
SELECT * FROM CourseDetails;

SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									RIGHT JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId;
                                    
 SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									LEFT JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId
                                    UNION
SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									RIGHT JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId;
                                    
SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									LEFT JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId
                                    UNION ALL
SELECT SD.StudentId,SD.StudentName,SD.CourseId,CD.CourseId,CD.CourseName,CD.CourseFee FROM StudentDetails AS SD 
									RIGHT JOIN CourseDetails AS CD 
                                    ON SD.CourseId = CD.CourseId;
                                    

SELECT * FROM Studentdetails ,CourseDetails;

CREATE TABLE EmployeeDetails(
	EmployeeId INT,
    EmpName CHAR(20),
    ManagerId INT
);

INSERT INTO EmployeeDetails VALUES (1,'BillGates',null),(2,'Peter',1),(3,'Jhon',1),(4,'Ram',3),(5,'Sana',6);
UPDATE EmployeeDetails SET ManagerId = 3 WHERE EmployeeId=5;
Select * FROM EmployeeDetails;

SELECT ED1.EmployeeId,
	   ED1.EmpName,
       ED2.EmpName AS ManagerName
       FROM EmployeeDetails AS  ED1 
       LEFT JOIN EmployeeDetails AS ED2
       ON ED1.ManagerId = ED2.EmployeeId;
       
SELECT * FROM EmployeeDetails;

SELECT * FROM StudentDetails;

USE BankDetails;

SELECT * FROM AccountDetails;
SELECT AccountId ,Name,Age FROM AccountDetails;

SELECT COUNT(*) AS CountOfRecords FROM AccountDetails;

SELECT * FROM AccountDetails WHERE AccountType = 'Savings';
SELECT * FROM AccountDetails WHERE AccountType = 'Current';

SELECT SUM(CurrentBalance) AS Total FROM AccountDetails;

SELECT COUNT(*) CountOfSavingsAccounts FROM AccountDetails WHERE AccountType = 'Savings';
SELECT COUNT(*) CountOfCurrentAccounts FROM AccountDetails WHERE AccountType = 'Current';

SELECT AccountType,COUNT(*) AS CountOfAccounts FROM Accountdetails GROUP BY AccountType;

SELECT AccountType,COUNT(*) AS CountOfAccounts FROM Accountdetails GROUP BY AccountType 
									ORDER BY CountOfAccounts DESC HAVING CountOfAccounts>1;
                                    
SELECT AccountType,COUNT(*) AS CountOfAccounts FROM Accountdetails 
GROUP BY AccountType HAVING CountOfAccounts>1;

SELECT COUNT(AccountId) AS CountOfRecords FROM AccountDetails;

  INSERT INTO AccountDetails VALUES(4,'Kiran',22,'Current',3000),
									(5,'Sonu',32,'Savings',300),
                                    (6,'Pavan',25,'Savings',500),
                                    (7,'Charan',21,'Current',50000),
                                    (8,'Kumari',24,'Savings',5500),
                                    (9,'Vikas',28,'Savings',1500),
                                    (10,'Ravi',29,'Current',2500);

SELECT * FROM TransactionDetails;
INSERT  INTO transactiondetails(AccountId,TransactionAmount,TransactionType) VALUES(2,100,'Debit'),(1,500,'Credit'),(3,500,'Credit');

SELECT DISTINCT(AccountId) FROM TransactionDetails;

SELECT * FROM AccountDetails WHERE AccountId IN (SELECT DISTINCT(AccountId) FROM TransactionDetails);

SELECT CurrentBalance FROM Accountdetails ORDER BY Currentbalance DESC LIMIT 5;

SELECT AccountId FROM Accountdetails ORDER BY Currentbalance DESC LIMIT 5;

#SELECT MIN(CurrentBalance) FROM Accountdetails WHERE AccountId IN (SELECT AccountId FROM Accountdetails ORDER BY Currentbalance DESC LIMIT 5);


SELECT MIN(CurrentBalance) FROM (SELECT CurrentBalance FROM Accountdetails ORDER BY Currentbalance DESC LIMIT 3) AS FivehighestBalance;


SELECT DATEDIFF(Now(),'1999-04-04');
SELECT TIMESTAMPDIFF(Month,'1999-04-04',Now());
SELECT TIMESTAMPDIFF(Year,'1999-04-04',Now());
SELECT TIMESTAMPDIFF(Day,'1999-04-04',Now());

SELECT * FROM Transactiondetails WHERE AccountId = 1 AND TIMESTAMPDIFF(Month,Transactiontime,Now())<=6;
SELECT * FROM Transactiondetails WHERE AccountId = 1 AND TIMESTAMPDIFF(Day,Transactiontime,Now())<=1;

SELECT * FROM AccountDetails WHERE AccountId IN (SELECT DISTINCT(AccountId) FROM TransactionDetails);

CREATE VIEW AccountsOfTransactions AS
SELECT * FROM AccountDetails WHERE AccountId IN (SELECT DISTINCT(AccountId) FROM TransactionDetails);


CREATE VIEW AccountsOfTransactions2 AS
UPDATE Accountdetails SET Currentbalance = 1000 WHERE Accountid=1;

SELECT * FROM AccountSOfTransactions;
UPDATE AccountSOfTransactions SET Currentbalance = 1000 WHERE Accountid=2;


INSERT  INTO transactiondetails(AccountId,TransactionAmount,TransactionType) VALUES(4,1000,'Credit');

CREATE VIEW LastSixMonthTransOF1 AS
SELECT * FROM Transactiondetails WHERE AccountId = 1  AND TIMESTAMPDIFF(Month,Transactiontime,Now())<=6;

SELECT * FROM LastSixMonthTransOF1;

SELECT * FROM AccountDetails;

CREATE VIEW TotalAmountInBank AS
SELECT SUM(Currentbalance) As TotalAmountInBank FROM Accountdetails;

UPDATE TotalAmountInBank SET Currentbalance = 1000 WHERE Accountid=2;

SELECT * FROM TotalAmountInBank;

CREATE INDEX AccountIndex ON AccountDetails(AccountId);
CREATE UNIQUE INDEX AccountIndex2 ON AccountDetails(AccountId);
CREATE UNIQUE INDEX AccountIndex3 USING HASH ON AccountDetails(AccountId);
CREATE UNIQUE INDEX AccountIndex4 USING BTREE ON AccountDetails(AccountId);

SELECT Accounttype,Name,CurrentBalance FROM Accountdetails WHERE AccountId = 1;

SELECT * FROM Accountdetails;
SELECT ACID FROM Accountdetails;
CREATE VIEW TotalAmountInBank AS
SELECT SUM(Currentbalance) ,cbal As TotalAmountInBank FROM Accountdetails;


SELECT * FROM AccountDetails;

SELECT * FROM TransactionDetails;
SELECT Max(transactionId) FROM Transactiondetails;


DELIMITER $$
CREATE TRIGGER BalanceUpdater
AFTER INSERT ON TransactionDetails FOR EACH ROW
BEGIN
		DECLARE Var_LatestTransactionId INT;
        DECLARE Var_AccountId INT;
        DECLARE Var_TransactionType VARCHAR(10);
        DECLARE Var_TransactionAmount INT;
        DECLARE Var_Currentbalance INT;
		SELECT Max(transactionId) AS LatestTransactionID INTO Var_LatestTransactionId FROM Transactiondetails;
        SELECT AccountId,TransactionType,TransactionAmount INTO Var_AccountId,Var_TransactionType,Var_TransactionAmount
										FROM Transactiondetails WHERE Transactionid = Var_LatestTransactionId;
		SELECT CurrentBalance INTO Var_Currentbalance From Accountdetails WHERE AccountId = Var_AccountId;
		IF Var_TransactionType = 'Credit' THEN
          UPDATE AccountDetails SET CurrentBalance = CurrentBalance + Var_TransactionAmount WHERE AccountId = Var_AccountId;
		ELSE
        IF Var_TransactionAmount < Var_Currentbalance THEN
        UPDATE AccountDetails SET CurrentBalance = CurrentBalance - Var_TransactionAmount WHERE AccountId = Var_AccountId;
        ELSE 
      UPDATE AccountDetails SET CurrentBalance = CurrentBalance WHERE AccountId = Var_AccountId;
        END IF;
        END IF;
END;

DROP TRIGGER BalanceUpdater;
UPDATE AccountDetails SET Currentbalance=0;
SET SQL_SAFE_UPDATES=0;
DELIMITER ;
UPDATE AccountDetails SET Currentbalance=0;
INSERT INTO TransactionDetails(AccountId,TransactionType,TransactionAmount) VALUES(1,'Credit',1000);
INSERT INTO TransactionDetails(AccountId,TransactionType,TransactionAmount) VALUES(1,'Debit',500);


INSERT INTO TransactionDetails(AccountId,TransactionType,TransactionAmount) VALUES(2,'Debit',100000);
SELECT * FROM AccountDetails;

SELECT Name FROM AccountDetails WHERE Name LIKE 'Ra%';

SELECT Name FROM AccountDetails WHERE Name LIKE '%n';

SELECT Name FROM AccountDetails WHERE Name LIKE '%a%';

SELECT Name FROM AccountDetails WHERE Name LIKE 'a%' OR Name LIKE 'b%';



SET SQL_SAFE_UPDATES=0;

ALTER TABLE AccountDetails ADD AccountStatus CHAR(10) DEFAULT('Active');


CREATE TABLE StudentMarks(
StudentId INT,
StudentName CHAR(20),
Sub_Name CHAR(10) ,
Marks TINYINT
);

INSERT INTO Studentmarks VALUES(1,'Ram','Sci',100),(2,'Sana','Sci',98),(3,'Jhon','Sci',95);
INSERT INTO Studentmarks VALUES(1,'Ram','Mat',95),(2,'Sana','Mat',99),(3,'Jhon','Mat',100);
INSERT INTO Studentmarks VALUES(4,'ravi','Sci',100),(4,'ravi','Mat',100);
SELECT * FROM Studentmarks;

SELECT StudentId,StudentName,Sub_Name,Marks,RANK() OVER(Partition by Sub_Name order by Marks desc) AS RankofStudent FROM StudentMarks;
SELECT StudentId,StudentName,Sub_Name,Marks,RANK() OVER(Partition by Sub_Name order by Marks desc) AS RankofStudent FROM StudentMarks 
																		Order By Studentname;
SELECT StudentId,StudentName,Sub_Name,Marks,DENSE_RANK() OVER(Partition by Sub_Name order by Marks desc) AS RankofStudent FROM StudentMarks;

SELECT StudentId,StudentName,Sub_Name,Marks,ROW_NUMBER() OVER(Partition by StudentName) AS IdStudent FROM StudentMarks;

CREATE TABLE EmpSalary(
EmpName Char(20),
Year SMALLINT,
Salary int);

INSERT INTO EmpSalary VALUES('Ram',2020,18000),('Ram',2021,25000),('Ram',2022,35000),('Ram',2023,45000);
INSERT INTO EmpSalary VALUES('Sana',2020,12000),('Sana',2021,15000),('Sana',2022,25000),('Sana',2023,32000);
SELECT * FROM EmpSalary;

SELECT EmpName,Year,Salary,LEAD(Salary) Over(PARTITION BY EmpName ORDER BY Year) AS IncrementSalary FROM EmpSalary;

SELECT EmpName,Year,Lag(Salary) Over(PARTITION BY EmpName ORDER BY Year) AS PreviousSalary,
								Salary,
                                LEAD(Salary) Over(PARTITION BY EmpName ORDER BY Year) AS IncrementSalary FROM EmpSalary;
                                
SET GLOBAL log_bin_trust_function_creators=1;

SELECT Age('1999-04-04') AS Age; 


                               