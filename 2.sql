CREATE TABLE Department (
  Dep_no  Number(38) PRIMARY KEY,
  Dep_Name VARCHAR2(15) NOT NULL,
  Loc VARCHAR2(15) NOT NULL,
  Mgr Number(38) NOT NULL,
  Exp_Bdg Number(38) NOT NULL,
  Rev_Bdg Number(38) NOT NULL
);

CREATE TABLE Employee (
  Empno  Number(38) NOT NULL,
  Name VARCHAR2(15) NOT NULL,
  Job VARCHAR2(15) NOT NULL,
  Salary Number(38) NOT NULL,
  Comm VARCHAR2(15) ,
  Dept_No Number(38),
  Sex VARCHAR2(6),
  FOREIGN KEY (Dept_No) REFERENCES Department(Dep_no)
);

CREATE TABLE Dependant (
  Pid  Number(38) NOT NULL,
  FName VARCHAR2(15) NOT NULL,
  Lname VARCHAR2(15) NOT NULL,
  Place VARCHAR2(15) NOT NULL,
  Empno Number(38) NOT NULL
);

