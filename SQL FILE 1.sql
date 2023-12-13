CREATE DATABASE excelr;  #to create a database

#to use a database
USE excelr;  

#to create a table
CREATE TABLE StudentDetails(
StudentID INT,
StudentName CHAR(20),
);   

#to delete a table
DROP TABLE StudentDetails;  

CREATE TABLE StudentDetails(
StudentID INT,
StudentName CHAR(20),
Age TINYINT,
Gender VARCHAR(10)
);

#to show all the contents of the table
SELECT * FROM StudentDetails; 

#to add/remove a column to a defined table
ALTER TABLE StudentDetails ADD CourseID TINYINT;  

#to insert data into the table
INSERT INTO StudentDetails VALUES(1,'Ram',19,'Male');   
INSERT INTO StudentDetails VALUES(2,'Chitti',20,'Male');
INSERT INTO StudentDetails VALUES(3,'Sana',21,'Female');

#to update a detail in a table
UPDATE StudentDetails SET CourseID = 1 WHERE StudentID = 1;  
UPDATE StudentDetails SET CourseID = 2 WHERE StudentID = 2;
UPDATE StudentDetails SET CourseID = 1 WHERE StudentID = 3;

SET SQL_SAFE_UPDATES = 0;


SELECT * FROM StudentDetails;

SET AutoCommit = 0;

DELETE FROM StudentDetails WHERE StudentID = 2;
ROLLBACK;


CREATE TABLE CourseDetails(
CourseID TINYINT,
CourseName VARCHAR(10),
Fees INT
);

#To change a datatype in a table
ALTER TABLE CourseDetails MODIFY Fees INT;

INSERT INTO CourseDetails VALUES(1,'SQL',12000);

SELECT * FROM CourseDetails;

CREATE DATABASE BankDetails;

USE BankDetails;

#using constraints
CREATE TABLE AccountDetails(
	AccountID INT PRIMARY KEY,
    Name CHAR(30) NOT NULL,
    Age TINYINT CHECK(Age>18),
    AccountType VARCHAR(20),
    CurrentBalance INT DEFAULT(0)
);    


INSERT INTO AccountDetails VALUES(1,'Ram',21,'Savings',Default);

SELECT * FROM AccountDetails;

INSERT INTO AccountDetails VALUES(2,'Sana',19,'Savings',Default);

INSERT INTO AccountDetails VALUES(3,'Jhon',19,'Current',Default);

CREATE TABLE TransactionDetails(
	TransactionID INT PRIMARY KEY auto_increment,
    AccountID INT,
    TransactionTime DATETIME DEFAULT(NOW()),
    TransactionAmount INT,
    TransactionType VARCHAR(10) CHECK(TransactionType='Credit' OR TransactionType='Debit'),
    FOREIGN KEY(AccountID) REFERENCES AccountDetails(AccountID)
);

Select NOW();


INSERT INTO TransactionDetails(AccountID, TransactionAmount,TransactionType) VALUES(1,1000,'Credit');


SELECT * FROM TransactionDetails;

#once the key is associated with another table and acting as a parent key to a child it cannot be deleted.
DELETE FROM AccountDetails WHERE AccountID = 1;




Select * FROM CourseDetails;

INSERT INTO CourseDetails VALUES(2, "Python",15000);
INSERT INTO CourseDetails VALUES(3, "PowerBI",10000);
INSERT INTO CourseDetails VALUES(4, "Tableau",12000);

Select * FROM CourseDetails;
Select * FROM StudentDetails;

INSERT INTO StudentDetails VALUES(4, "Raju",21,"Male",4);
INSERT INTO StudentDetails VALUES(5, "Aftab",28,'Male',3);
INSERT INTO StudentDetails VALUES(6, "Arif",27,'Male',NULL);
INSERT INTO CourseDetails VALUES(5,"R Prog.",8000);


#join is used to get matched values from different tables
SELECT SD.StudentID,SD.StudentName,SD.Age,SD.Gender,SD.CourseID,CD.CourseName,CD.Fees FROM StudentDetails AS SD
JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;

#RIGHTjoin is used to get matched values from the left table and also all the unmatched values from the RIGHT Table as well
SELECT SD.StudentID,SD.StudentName,SD.Age,SD.Gender,SD.CourseID,CD.CourseName,CD.Fees FROM StudentDetails AS SD
RIGHT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;


#LEFTjoin is used to get matched values from the RIGHT table and also all the unmatched values from the LEFT Table as well
SELECT SD.StudentID,SD.StudentName,SD.Age,SD.Gender,SD.CourseID,CD.CourseName,CD.Fees FROM StudentDetails AS SD
LEFT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;


SELECT SD.StudentName,CD.CourseName FROM StudentDetails AS SD
LEFT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;

SELECT SD.StudentName,CD.CourseName FROM StudentDetails AS SD
RIGHT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;

#UNION is used to perform FULL JOIN which returns all the values from the selected Tables matched or Unmatched.
SELECT SD.StudentID,SD.StudentName,SD.Age,SD.Gender,SD.CourseID,CD.CourseName,CD.Fees FROM StudentDetails AS SD
LEFT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID
union
SELECT SD.StudentID,SD.StudentName,SD.Age,SD.Gender,SD.CourseID,CD.CourseName,CD.Fees FROM StudentDetails AS SD
RIGHT JOIN CourseDetails AS CD
ON SD.CourseID = CD.CourseID;

#SelfJoin is used JOIN When value req. is present in the same table. 
use Excelr;
CREATE TABLE EmployeeDetails(
EmployeeId INT,
EmpName CHAR(30),
ManagerId INT);

INSERT INTO EmployeeDetails VALUES(1,"Bill Gates",);
INSERT INTO EmployeeDetails VALUES(2,"Peter",1);
INSERT INTO EmployeeDetails VALUES(3,"Jhon",1);
INSERT INTO EmployeeDetails VALUES(4,"Ram",3);
INSERT INTO EmployeeDetails VALUES(5,"Sana",3);


SELECT * FROM EmployeeDetails;

#In the below example ManagerID is asscoiated with EmpID so manager name can be obtained using the Table to form a heirarcy table
SELECT ED1.EmployeeID,
ED1.EmpName,
ED2.EmpName AS ManagerName
FROM EmployeeDetails as ED1
LEFT JOIN EmployeeDetails as ED2
ON ED1.ManagerID = ED2.EmployeeId;


Select * FROM EmployeeDetails;

USE bankdetails;

SELECT * FROM accountdetails;

SELECT AccountID,Name FROM accountdetails;
SELECT Count(*) FROM AccountDetails;
SELECT SUM(CurrentBalance) AS TotalBalance FROM accountdetails;
#for Filtering we use WHERE in case of non-aggregated values
SELECT * FROM AccountDetails WHERE AccountType = 'Savings';

SELECT AccountType,COUNT(*) AS CountofAccounts 
FROM AccountDetails GROUP BY AccountType;

SELECT AccountType,COUNT(*) AS CountofAccounts FROM AccountDetails 
GROUP BY AccountType ORDER BY CountofAccounts DESC;
#for Filtering we use HAVING in case of aggregated values
SELECT AccountType,COUNT(*) AS CountofAccounts FROM AccountDetails 
GROUP BY AccountType HAVING CountofAccounts>1;

#SEQUENCE FOR WRITING A QUERY'
/*SELECT COLUMN NAME, GROUPING COLUMN, FUNCTION
INTO
FROM TABLE NAME
WHERE CONDITION - FILTER DATA
GROUP BY GroupingColumnName
HAVING Condition - Filter Aggregated Column Name
ORDER BY ColumnName ASC/DESC
LIMIT value ;
*/


INSERT INTO AccountDetails VALUES(4,'Kiran',22,'Current',3000),
								 (5,'Sonu',32,'Savings',300),
                                 (6,'Pavan',25,'Savings',500),
                                 (7,'Charan',21,'Current',50000),
                                 (8,'Kumari',24,'Savings',5500),
                                 (9,'Vikas',28,'Savings',1500),
                                 (10,'Ravi',25,'Current',2500);


INSERT INTO TransactionDetails(AccountID,TransactionAmount,TransactionType) VALUES (2,100,'Debit'),(1,500,'Credit'),(3,500,'Credit');

SELECT DISTINCT AccountID FROM AccountDetails;
#Writing a SUB-QUERY using IN
SELECT * FROM AccountDetails WHERE AccountID IN (SELECT DISTINCT AccountID FROM TransactionDetails);

#filters only 5 values based on the conditions given
SELECT CurrentBalance FROM AccountDetails ORDER BY CurrentBalance DESC LIMIT 5;

#This willl not work because LIMIT cannot be used in a SUB-QUERY
SELECT MIN(CurrentBalance) FROM AccountDetails  WHERE AccountID IN (SELECT AccountID 
							FROM AccountDetails ORDER BY CurrentBalance DESC LIMIT 5);

#This will return the nth Highest Balance from the list which in this case is CurrentBalance
SELECT MIN(CurrentBalance) FROM (SELECT CurrentBalance FROM AccountDetails 
				ORDER BY CurrentBalance DESC LIMIT 5) AS NHighestBalance;

SELECT DATEDIFF(NOW(),'1999-04-04');
SELECT TIMESTAMPDIFF(YEAR,'1999-04-04',NOW());
SELECT TIMESTAMPDIFF(MONTH,'1999-04-04',NOW());
SELECT TIMESTAMPDIFF(DAY,'1999-04-04',NOW());

#used to get details from the last 6months 
SELECT * FROM TransactionDetails WHERE AccountID = 1 AND TIMESTAMPDIFF(MONTH,TransactionTime,NOW())<=6;
SELECT * FROM TransactionDetails WHERE AccountID = 1 AND TIMESTAMPDIFF(DAY,TransactionTime,NOW())<=1;

SELECT * FROM AccountDetails WHERE AccountID IN (SELECT DISTINCT AccountID FROM TransactionDetails);

#VIEW is used store a single SELECT Query which can be repeated multiple times
#VIEW cannot be used with UPDATE, DELETE, INSERT
#VIEW cannot take Parameters, Variables and programming such as IF-ELSE and LOOPS
CREATE VIEW AccountsOfTransactions AS
SELECT * FROM AccountDetails WHERE AccountID IN (SELECT DISTINCT AccountID FROM TransactionDetails);

INSERT INTO TransactionDetails(AccountID,TransactionAmount,TransactionType) VALUES(4,1000,'Credit');

SELECT * FROM AccountsOfTransactions;

CREATE VIEW TotalAmountinBank AS
SELECT SUM(CurrentBalance) AS TotalAmountinBank FROM AccountDetails;


#View not Updatable as it has an aggregate function
UPDATE TotalAmountinBank SET CurrentBalance = 1000 WHERE AccountID = 2;

SELECT * FROM TotalAmountinBank;

#INDEX
/*
INDEX are of 3 types based on search criteria -
BTree, Hash, RTree

INDEX are of 3 types based on Data Types -
Unique (INT/CHAR)
Spacial (Multi dim. values)
Full Text

INDEX are of 2 types based on Columns we are taking -
Clustered (Primary Key)
Non-Clustered (Not Primary Key)
*/

#INDEX SYNTAX
/*#CREATE INDEX IndexName ON TableName(ColumnName);
#CREATE UNIQUE/SPACIAL/FULLTEXT INDEX IndexName USING HASH/BTREE ON ViewName(ColumnName);
*/
CREATE INDEX AccountIndex ON AccountDetails(AccountID);
CREATE UNIQUE INDEX AccountIndex ON AccountDetails(AccountID);
CREATE UNIQUE INDEX AccountIndex USING BTREE ON AccountDetails(AccountID);
CREATE UNIQUE INDEX AccountIndex USING HASH ON AccountDetails(AccountID);


SELECT * FROM transactiondetail;


/*
Error Handling
Syntax for Error Handling :-
CREATE PROCEDURE ProcedureName(Parameter) AS
BEGIN
		DECLARE CONTINUE/EXIT HANDLER FOR 1146  //CONTINUE will execute the remaining query 
        BEGIN									  apart from the error. EXIT will terminate the program.
        SELECT 'Check the Table Name'
        END;
SELECT * FROM IncorrectTableName
SELECT * FROM CorrectTableName
END;

*/


SET SQL_SAFE_UPDATES =0;

UPDATE AccountDEtails SET CurrentBalance = 0;

SELECT * FRoM AccountDetails;


#TRIGGERS get updated automatically
#in the below example we have created a trigger that will update the 
#balance in account details whenever there is any change in the TransactionDetails table (CREDIT or DEBIT)
DELIMITER $$
CREATE TRIGGER BalanceUpdater
AFTER INSERT ON TransactionDetails FOR EACH ROW
BEGIN
		DECLARE Var_LatestTransactionId INT;
        DECLARE Var_AccountId INT;
        DECLARE Var_TransactionType VARCHAR(10);
        DECLARE Var_TransactionAmount INT;
        DECLARE Var_CurrentBalance INT;
		SELECT MAX(TransactionId) AS LatestTransactionId INTO Var_LatestTransactionId FROM TransactionDetails;
        SELECT AccountId,TransactionType,TransactionAmount INTO Var_AccountId,Var_TransactionType,Var_TransactionAmount
														   FROM TransactionDetails WHERE TransactionId = Var_LatestTransactionId;
        SELECT CurrentBalance INTO Var_CurrentBalance FROM AccountDetails WHERE AccountId = Var_AccountId;
		IF Var_TransactionType = 'Credit' THEN
			UPDATE AccountDetails SET CurrentBalance = CurrentBalance + Var_TransactionAmount 
				WHERE AccountId = Var_AccountId;
		ELSE
        IF Var_TransactionAmount < Var_CurrentBalance THEN
        UPDATE AccountDetails SET CurrentBalance = CurrentBalance - Var_TransactionAmount 
				WHERE AccountId = Var_AccountId;
		ELSE
        UPDATE AccountDetails SET CurrentBalance = CurrentBalance WHERE AccountId = Var_AccountId;
		END IF;
        END IF;
END;

DROP TRIGGER BalanceUpdater;
DELIMITER ;
INSERT INTO TransactionDetails(AccountId, TransactionType,TransactionAmount) VALUES (1,'Credit',1000);
INSERT INTO TransactionDetails(AccountId, TransactionType,TransactionAmount) VALUES (1,'Debit',500);
INSERT INTO TransactionDetails(AccountId, TransactionType,TransactionAmount) VALUES (2,'Debit',100000);
SELECT * FROM AccountDetails;


ALTER TABLE AccountDetails ADD AccountStatus CHAR(10) DEFAULT('Active');


SELECT * FROM TransactionDetails WHERE AccountID = 5 
	AND TIMESTAMPDIFF(MONTH,TransactionTime,NOW())<=6;
    
  
  
  Select AccountID, AccountStatus FROM AccountDetails WHERE AccountId IN
	(SELECT DISTINCT(AccountId) FROM TransactionDetails WHERE 
		TIMESTAMPDIFF(MONTH,TransactionTime,NOW())<=6); 
        
        
SELECT COUNT(*) AS NumberOfRows FROM AccountDetails;        
SELECT COUNT(AccountId) AS NumberOfRows FROM AccountDetails;
SELECT * FROM AccountDetails;
SELECT COUNT(*) AS NumberOfRows FROM AccountDetails WHERE AccountId IS NULL;

SELECT SUBSTRING('Banglore',4,5);
SELECT REPLACE('Saifi','i','u');
SELECT * FROM AccountDetails WHERE AccountID BETWEEN 2 AND 5;
#LIKE is a Wild Card Character which is used to search a particular String based on the entry 
#and the % denotes unknown length of characters before or after the given input based on its position.
SELECT Name FROM AccountDetails WHERE Name LIKE 'Ra%';
SELECT Name FROM AccountDetails WHERE Name LIKE '%n';
SELECT Name FROM AccountDetails WHERE Name LIKE '%a%';
SELECT Name FROM AccountDetails WHERE Name LIKE 'R%' OR Name Like '%i';



CREATE TABLE StudentMarks(
StudentId INT,
StudetntName CHAR(20),
Sub_Name CHAR(10),
Marks TINYINT
);


INSERT INTO StudentMarks VALUES(1,'Ram','Science',100),(2,'Sana','Science',95),(3,'Jhon','Science',99);
INSERT INTO StudentMarks VALUES(1,'Ram','Mat',98),(2,'Sana','Mat',99),(3,'Jhon','Mat',100);
INSERT INTO StudentMarks VALUES(4,'Ravi','Mat',100),(4,'Ravi','Science',100);
SELECT StudentId, StudetntName,Sub_Name,Marks,RANK() OVER(PARTITION BY Sub_Name ORDER BY Marks DESC) AS StudentRank FROM StudentMarks;

SELECT StudentId, StudetntName,Sub_Name,Marks,DENSE_RANK() OVER(PARTITION BY Sub_Name ORDER BY Marks DESC) AS StudentRank FROM StudentMarks;

SELECT StudentId, StudetntName,Sub_Name,Marks,ROW_NUMBER() OVER(PARTITION BY StudetntName) AS IDStudent FROM StudentMarks;

CREATE TABLE EmpSalary(
EmpName CHAR(20),
Year SMALLINT,
Salary int
);

INSERT INTO EmpSalary VALUES('Ram',2020,18000),('Ram',2021,25000),('Ram',2022,35000),('Ram',2023,45000);
INSERT INTO EmpSalary VALUES('Sana',2020,15000),('Sana',2021,18000),('Sana',2022,22000),('Sana',2023,28000);

SELECT * FROM EmpSalary;

SELECT EmpName, Year,Salary, LEAD(Salary) OVER (PARTITION BY EmpName ORDER BY Year) AS SalaryIncrement FROM EmpSalary;

SELECT EmpName, Year, LAG(Salary) OVER (PARTITION BY EmpName ORDER BY Year) AS PreviousSalary,Salary,
								LEAD(Salary) OVER (PARTITION BY EmpName ORDER BY Year) AS SalaryIncrement 
                                FROM EmpSalary;
                                
SET GLOBAL log_bin_trust_function_creators=1;

SELECT Age('1995-01-18') AS Age;                                


SELECT * FROM AccountDetails;
