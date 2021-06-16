use company_9415419;

create  TABLE EMPLOYEE(
	Fname varchar(30) NOT NULL,
    Minit varchar(30) ,
    Lname varchar(30) NOT NULL,
    Ssn int NOT NULL primary key,
    Bdate date NOT NULL,
    Address varchar(50) NOT NULL,
    Sex char NOT NULL,
    Salary float NOT NULL,
    Super_Ssn int ,
     Dno tinyint 
);

CREATE TABLE DEPARTMENT(
	Dname varchar(30) NOT NULL,
    Dnumber int  primary key,
    Mgr_Ssn int NOT NULL,
    Mgr_start_date date NOT NULL,
    unique(Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE (Ssn) ON DELETE CASCADE
);

CREATE TABLE DEPT_LOCATIONS(
    Dnumber int NOT NULL,
	Dlocation varchar(30) NOT NULL,
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT (Dnumber)
);

CREATE TABLE PROJECT(
	Pname varchar(30) NOT NULL,
	Pnumber int NOT NULL primary key,
	PLocation varchar(30) NOT NULL,
    Dnum int NOT NULL,
	FOREIGN KEY (Dnum) REFERENCES DEPARTMENT (Dnumber)
);

CREATE TABLE WORKS_ON(
    Essn int NOT NULL,
	Pno int NOT NULL,
	Hours int,
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber)
);

CREATE TABLE DEPENDENT(
	Dependent_name varchar(30) NOT NULL,
	Essn int NOT NULL,
    Sex char NOT NULL,
    Bdate date NOT NULL,
    Relationship varchar(15) NOT NULL,
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn)
);

SET FOREIGN_KEY_CHECKS = 0