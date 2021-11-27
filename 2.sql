CREATE TABLE Department (
  Dep_no  INT PRIMARY KEY,
  Dep_Name VARCHAR(15) NOT NULL,
  Loc VARCHAR(15) NOT NULL,
  Mgr INT NOT NULL,
  Exp_Bdg INT NOT NULL,
  Rev_Bdg INT NOT NULL
);

CREATE TABLE Employee (
  Empno  INT NOT NULL,
  Name VARCHAR(15) NOT NULL,
  Job VARCHAR(15) NOT NULL,
  Salary INT NOT NULL,
  Comm VARCHAR(15) ,
  Dept_No INT,
  Sex VARCHAR(6),
  FOREIGN KEY (Dept_No) REFERENCES Department(Dep_no)
);

CREATE TABLE Dependant (
  Pid  INT NOT NULL,
  FName VARCHAR(15) NOT NULL,
  Lname VARCHAR(15) NOT NULL,
  Place VARCHAR(15) NOT NULL,
  Empno INT NOT NULL
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

