# Question 1:
Find the sum of the salaries of all employees whose manager’s ssn is 333445555.
As well as the name of the department and the max, min, average salary of the employees in this department
and the total number of employees in this department
``` TSQL
SELECT DNAME,SUM(SALARY) AS SUM,MAX(SALARY) AS MAX,MIN(SALARY) AS MIN,AVG(SALARY) AS average,COUNT(*) AS COUNT 
FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.DNO=DEPARTMENT.DNUMBER AND DEPARTMENT.MGR_SSN=333445555
GROUP BY DNAME
```
# Question 2:
For each department, retrieve the department manager’s name, his supervisor, maxi& min salary
and total number of employees in the department. As well as the name of the department
``` TSQL
SELECT Emp.fname,dname,Emp.ssn,E.dno,Esuper.fname as [Sup Name],Emp.super_ssn,max(E.salary) as Max,min(E.salary) as MIN,count(*) as Count 
FROM [EMPLOYEE] as E, department, Employee as Emp left join Employee as Esuper on Esuper.ssn=emp.super_ssn  
where  
E.dno=Department.dnumber and emp.ssn=department.mgr_ssn 
group by dname ,Emp.fname,dname,Emp.ssn,E.dno,Emp.super_ssn,Esuper.fname
``` 
### OR
``` TSQL
SELECT Emp.fname as [Managers Name],Dname,mgr_ssn,Esuper.fname as [Sup Name],emp.Super_ssn,max(employee.salary) as Max,min(employee.salary) as MIN,count(*) as count 
from [DEPARTMENT] inner join Employee as emp on emp.ssn=Department.mgr_ssn inner join employee on
Employee.dno=Department.dnumber left join Employee as Esuper on Esuper.ssn=emp.Super_ssn  
group by dname,mgr_ssn,emp.fname,Emp.Super_ssn,Esuper.fname
```
 
# Question 3: 
For each project on which more than 2 employees work, retrieve the project number, project name, number of employees working on that project,
the controlling department name, manager name, department number and manager’s salary
``` TSQL
SELECT fname as [Manager name], salary, Pnumber,Pname,Dname,Dnum,COUNT(*) AS [Number of Employees]  
FROM [PROJECT] inner join WORKS_ON ON WORKS_ON.PNO=PROJECT.Pnumber 
inner join DEPARTMENT on DEPARTMENT.Dnumber=PROJECT.Dnum
left join EMPLOYEE on DEPARTMENT.Mgr_ssn=EMPLOYEE.ssn
GROUP BY Pnumber,Pname,Dname,Dnum, fname,salary
HAVING COUNT(*)>2
```
# Question 4: Delete a tuple in the employee table
``` TSQL
DELETE FROM [table name]
```
# Q5 : Create a view table Company CS2 
``` TSQL
-- DROP VIEW IF EXISTS [COMPANY CS2]
CREATE VIEW [Company CS2] AS
SELECT E.FNAME, E.LNAME ,E.SSN,E.super_ssn,Emp.fname as [Sup Name] ,dname,E.dno, Pname,Hours *1.5 as [Wages]
FROM EMPLOYEE as E
inner join WORKS_ON on E.SSN=WORKS_ON.Essn inner join PROJECT on PROJECT.Pnumber=WORKS_ON.Pno
inner join DEPARTMENT on DEPARTMENT.Dnumber=E.dno left join EMPLOYEE AS Emp on Emp.ssn=E.super_ssn
group by E.FNAME,E.LNAME,E.ssn,E.DNO,PNAME,hours,dname,Emp.fname,E.super_ssn





-- DROP VIEW IF EXISTS [COMPANY CS2]
CREATE VIEW [Company CS2] AS
SELECT FNAME, LNAME ,SSN ,dname,dno, Pname,Hours *1.5 as [Wages]
FROM EMPLOYEE, DEPARTMENT,PROJECT, WORKS_ON
WHERE EMPLOYEE.SSN=WORKS_ON.Essn AND PROJECT.Pnumber=WORKS_ON.Pno and DEPARTMENT.Dnumber=EMPLOYEE.dno
group by FNAME,LNAME,ssn,DNO,PNAME,hours,dname

```
