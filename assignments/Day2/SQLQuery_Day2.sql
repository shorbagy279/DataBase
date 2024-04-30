

use Company_SD
-- 1 
 select * from Employee 
 --2
select Fname, Lname,Salary,Dno from Employee

--3
select Pname,Plocation,Dname from Project
join Departments on Project.Dnum = Departments.Dnum

--4
select Fname+' '+Lname,salary,(salary/10)*11 As'ANNUAL COMM'from Employee

--5
select SSN,Fname+' '+Lname from Employee where Salary>1000

--6
select SSN,Fname+' '+Lname from Employee where (Salary*12)>1000

--7
select Fname+' '+Lname,Salary from Employee where Sex='F'

--8
select Dname,Dnum from Departments where MGRSSN=968574

--9
select Pnumber,Pname,Plocation from Project where Dnum=10