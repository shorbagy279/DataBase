use Company_SD

--DQL

--1 
 select d.Dependent_name,d.Sex
 from Dependent d , Employee e
 where d.ESSN=e.SSN and d.Sex='F' and e.Sex='F' 
 Union 
 select d.Dependent_name,d.Sex
 from Dependent d
 inner join Employee e
 on d.ESSN=e.SSN and d.Sex='M' and e.Sex='M' 

 --2 
 select p.Pname,SUM(w.Hours)As Total
 from Project p, Works_for w
 where p.Pnumber=w.Pno
 Group By Pname


 --3
 select * from Departments 
 where Dnum=(
 select Dno from Employee
 where SSN=(
  select MIN(SSN)from Employee
  )
 )

 --4 
 select d.Dname,MAX(e.salary) As max_salary,MIN(e.salary) As min_salary, AVG(e.salary) AS avarge_salary
 from Departments d,Employee e
 where d.Dnum=e.Dno
 group by d.Dname

 --5
 select Lname
 from Employee 
 where SSN in (select MGRSSN
 from Departments)
 and SSN not in(select d.ESSN 
 from Dependent d)

 --6
 select AVG(Salary) As average, d.Dnum ,d.Dname ,COUNT(e.SSN) number_of_empl
 from Departments d,Employee e
 where d.Dnum=e.Dno
 group by d.Dnum,d.Dname
 having AVG(salary)<(select AVG(salary)
 from Employee)

 --7
 select d.Dnum,Fname+' '+e.Lname As name,p.Pname
 from Employee e
 inner join Works_for w
 on w.ESSn=e.SSN
 inner join Project p
 on w.Pno=p.Pnumber
 inner join Departments d
 on d.Dnum=e.Dno
 order by d.Dname,e.Lname,e.Fname

 --8
 select Salary
from Employee 
where salary >=
(select max(Salary)
from Employee 
where Salary <(
select max(Salary)
from Employee ))
 

--9
select e.Fname+' '+e.Lname as full_name
from  Employee e, Dependent d
where d.Dependent_name=e.Fname+' '+e.Lname

--10
update Employee
set Salary=1.3*Salary
where SSN in(select w.ESSn
from Works_for w ,Project p
where p.Pname='Al Rabwah')

--11
select e.SSN, e.Fname
from Employee e
where exists (
select ESSN from Dependent
where ESSN = e.SSN)

--DML

--1
insert into Departments 
(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT',100,112233,'1-11-2006')

--2
 --a
 update Departments
 set MGRSSN=968574
 where Dnum=100

 --b
 update Departments
 set MGRSSN=102672
 where Dnum=20

 --c
 update Employee
 set Superssn=102672, Dno =
(select Dnum from Departments where MGRSSN = 102672)
 where SSN=102660

--3  we want to delete data from employee so we have to handle it in other tables
  -- from 223344 to 102672

 delete from Dependent
where exists (select * from Dependent where ESSn = 223344)

update Departments
set MGRSSN=102672
where exists(select*from Departments
where MGRSSN=223344)

update Employee
set Dno = (select Dno from Employee where SSN = 102672)
where exists (select Dno from Employee
where SSN=223344)

update Employee
set Superssn=102672
where exists(select *from Employee
where Superssn=223344)

update Works_for
set ESSn = 102672
where  ESSn = 223344

delete from Employee where SSN = 223344;

