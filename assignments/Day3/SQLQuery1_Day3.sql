use Company_SD

-- 1
select D.Dnum,D.Dname,D.MGRSSN,E.Fname+' ' + E.Lname As mang_Name
from Departments D , Employee E
where D.MGRSSN = E.SSN

-- 2
select D.Dname,P.Pname
from Departments D , Project P
where D.Dnum=P.Dnum

-- 3
select D.*, E.Fname+' '+E.Lname As emp_Name
from Employee E , Dependent D
where D.ESSN=E.SSN

-- 4
select P.Pnumber,p.Pname,p.Plocation
from Project P
where P.City in('Cairo' , 'Alex')

-- 5
select *
from Project
where Pname like'a%'

-- 6
select Fname+' '+Lname As emp_Name
from Employee
where Dno=30 and Salary between 1000 and 2000

-- 7
select E.Fname+' '+E.Lname As emp_Name
from Employee E , Project P , Works_for W , Departments D
where  W.ESSn=E.SSN and P.Pnumber=W.Pno 
and D.Dnum=10 and P.Pname='AL Rabwah' and W.Hours>=10

-- 8
select e2.Fname+' '+e2.Lname As emp_Name
from Employee e1,Employee e2
where e2.Superssn=e1.SSN and e1.Fname='Kamel' and e1.Lname='Mohamed'

-- 9
select E.Fname+' '+E.Lname As emp_Name, p.Pname 
from Employee e, Works_for w, Project p
where w.ESSn=e.SSN and w.Pno=p.Pnumber 
order by p.Pname

-- 10 
 select p.Pnumber,d.Dname,e.Lname,e.Address,e.Bdate
 from Project p, Departments d, Employee e
 where p.City='Cairo' and d.Dnum=p.Dnum and d.MGRSSN=e.SSN
 
 -- 11 
 select e.*
 from Employee e, Departments d
 where d.MGRSSN=e.SSN
 
 -- 12
 select e.*
 from Employee e
 left join Dependent d
 on d.ESSN=e.SSN
-----------------------------------------------------------------------
--Data Manipulating Language:

-- 1
insert into Employee(Dno,SSN,Superssn,Salary)
values(30,102672,112233,3000)

-- 2
insert into Employee(Dno,SSN)
values(30,102660)

-- 3
update Employee 
set Salary=1.2*Salary





