CREATE TABLE Department (
  Dep_no  NUMBER PRIMARY KEY,
  Dep_Name VARCHAR2(15) NOT NULL,
  Loc VARCHAR2(15) NOT NULL,
  Mgr NUMBER NOT NULL,
  Exp_Bdg NUMBER NOT NULL,
  Rev_Bdg NUMBER NOT NULL
);

CREATE TABLE Employee (
  Empno  NUMBER NOT NULL,
  Name VARCHAR2(15) NOT NULL,
  Job VARCHAR2(15) NOT NULL,
  Salary NUMBER NOT NULL,
  Comm VARCHAR2(15) ,
  Dept_No NUMBER,
  Sex VARCHAR2(6),
  FOREIGN KEY (Dept_No) REFERENCES Department(Dep_no)
);

CREATE TABLE Dependant (
  Pid  NUMBER NOT NULL,
  FName VARCHAR2(15) NOT NULL,
  Lname VARCHAR2(15) NOT NULL,
  Place VARCHAR2(15) NOT NULL,
  Empno NUMBER NOT NULL
);

INSERT INTO Department VALUES (60, 'Shipping', 'Trivandrum', 215, 90000, 0);
INSERT INTO Department VALUES (10, 'Accounting', 'Cochin', 200, 100000, 0);
INSERT INTO Department VALUES (30, 'Research', 'Cochin', 105, 125000, 0);
INSERT INTO Department VALUES (40, 'Sales', 'Trichur', 109, 280000, 8000);
INSERT INTO Department VALUES (50, 'Manufacturing', 'Kottayam', 210, 130000, 0);

INSERT INTO Dependant VALUES (1010, 'Anu', 'Jose', 'Trivandrum', 214);
INSERT INTO Dependant VALUES (1020, 'Neenu', 'Thomas', 'Kollam', 200);
INSERT INTO Dependant VALUES (1022, 'Anamika', 'Thampi', 'Kollam', 200);
INSERT INTO Dependant VALUES (1031, 'Swetha', 'Das', 'Kottayam', 109);

INSERT INTO Employee VALUES (100, 'Wilson', 'CLRK', 17000,'' ,10, 'M');
INSERT INTO Employee VALUES (101, 'Smitha', 'SLSM', 25000,'1300' ,40, 'F');
INSERT INTO Employee VALUES (103, 'Roy', 'ANLST', 35000,'' ,30, 'M');
INSERT INTO Employee VALUES (105, 'Watson', 'MNGR', 45000,'0' ,30, 'M');
INSERT INTO Employee VALUES (109, 'Alan', 'MNGR', 30000,'8000' ,40, 'M');
INSERT INTO Employee VALUES (110, 'Tina', 'CLRK', 18000,'' ,50, 'F');
INSERT INTO Employee VALUES (200, 'Karthika', 'MNGR', 29000,'' ,10, 'F');
INSERT INTO Employee VALUES (210, 'Rita', 'MNGR', 36500,'' ,50, 'F');
INSERT INTO Employee VALUES (213, 'Manacy', 'CLRK', 16250,'' ,10, 'F');
INSERT INTO Employee VALUES (214, 'Simpson', 'DRVR', 8250,'' ,60, 'M');
INSERT INTO Employee VALUES (215, 'Deepa', 'ANLST', 27000,'' ,60, 'F');
INSERT INTO Employee VALUES (220, 'Soosan', 'SLSM', 28500,'5300' ,60, 'F');

-- 1

SELECT * FROM Employee where Job = 'MNGR' ORDER BY Name;

-- 2

SELECT * FROM Employee where Dept_No = 40 ORDER BY Empno; 

-- 3

SELECT * FROM Employee where Sex = 'F' ORDER BY Empno;

--4

SELECT Dept_No, MAX(Salary), MIN(Salary), AVG(Salary) FROM Employee Group By Dept_No;

-- 5

SELECT Dept_No, MAX(Comm), MIN(Comm), SUM(Comm), COUNT(Comm) FROM Employee WHERE Comm>0 Group By Dept_No;

-- 6

SELECT Job, COUNT(Job) FROM Employee Group BY Job;

-- 7

SELECT Job, SUM(Salary) FROM Employee Group By Job;

-- 8

SELECT Distinct Dept_No FROM Employee;

--9

SELECT Empno, Name, Salary FROM Employee WHERE Sex = 'F' and Dept_No = 10;

-- 10

SELECT Empno, Name, Salary FROM Employee WHERE Sex = 'M' ORDER BY Name;

-- 11

SELECT Name, Job FROM Employee WHERE Sex = 'F'and  (Job = 'SLSM' or Job = 'MNGR');

-- 12

SELECT Empno, Name FROM Employee WHERE Dept_No = 10 and (Job = 'MNGR' or Job = 'CLRK');

-- 13

SELECT Name, Job FROM Employee WHERE (Not Job = 'CLRK') and (Not Job = 'SLSM');

-- 14

SELECT * FROM Employee WHERE Job = 'CLRK' and Not Dept_No = 10;

-- 15

SELECT Name FROM Employee WHERE Name Like "%U%E%";

-- 16

SELECT * FROM Employee WHERE Comm IS NOT NULL;

-- 17

SELECT Empno, Name, Job FROM Employee WHERE Sex = 'F' and NOT Job = 'MNGR';

-- 18

SELECT Empno, Name, Salary FROM Employee WHERE Salary >10000 and Salary < 40000;

 -- 19

SELECT Name, Empno, Job FROM Employee WHERE Job IN('ANLST', 'MNGR');
 
 -- 20

SELECT Empno, Name, Salary FROM Employee WHERE Comm IS NOT NULL AND Salary > 30000;
