use ITI

--1
select COUNT(st_age)
from Student

--2
select Ins_Name
from Instructor 

--3
select s.St_Id,s.St_Fname+' '+s.St_Lname as fullName,d.Dept_Name
from Student s,Department d
where d.Dept_Id=s.Dept_Id

--4
select i.Ins_Name,d.Dept_Name
from Instructor i
left join Department d
on d.Dept_Id=i.Dept_Id

--5
select s.St_Fname+' '+s.St_Lname as fullName,c.Crs_Name
from Student s,Stud_Course sc,Course c
where s.St_Id=sc.St_Id and c.Crs_Id=sc.Crs_Id and sc.Grade is not null

--6 
select t.Top_Id,count(c.Crs_Id)as [number of courses]
from Topic t,Course c
where t.Top_Id=c.Top_Id
group by t.Top_Id

--7
select max(Salary)as Max_sal,min(salary)Min_sal
from Instructor

--8
select *
from Instructor 
where Salary <(select AVG(Salary)from Instructor)

--9
select Dept_Name
from Department d ,Instructor i
where i.Dept_Id=d.Dept_Id and i.Salary = (select min(Salary)from Instructor)

--10
select top(2)Salary
from Instructor

--11
select Ins_Name,coalesce(Salary,20)as salary
from Instructor

--12.
select AVG(Salary)as Average
from Instructor

--13
select s.St_Fname ,ss.*
from Student s,Student ss
where s.St_super = ss.St_Id;


-- ROW_NUMBER , DENSE_RANK , NTILE , 
--14
select Ins_Id, Dept_Id, salary
from(
 select *,ROW_NUMBER()over(partition by dept_id order by salary desc)as RN
 from Instructor)as newTabe
 where RN<=2

 --15
 select *
from(
select *, ROW_NUMBER() over(partition by dept_id order by newid() desc) as RN
from Instructor) as newtable
where RN =1

