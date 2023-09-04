--1.Employees cedvelinde Susan ile eyni gunde ise qebul olan iscileri cixarin.
select * from hr.employees
where hire_date = (select hire_date from hr.employees
where lower(first_name) = 'susan');

--2.Employees cedvelinden employee_id-si 107,110,115,205 olan iscilerin managerlerinin ad,
-- soyadini cixarin. (iki hell hem join hem subquery)
select first_name, last_name from hr.employees
where employee_id in (select manager_id from hr.employees
where employee_id in (107, 110, 115, 205));


select e.* from hr.employees e
inner join hr.employees e1
on e.manager_id = e1.employee_id
where e.employee_id in (107, 110, 115, 205);


--3. Employees cedvelinden salary-si butun iscilerin orta maasinda boyuk olan iscilerin
-- siyahisini cixarin.
select * from hr.employees
where salary > (select avg(salary) from hr.employees);

--4.Departments , employees cedvelinden istifade ederek salary-si 14000-den boyuk olan 
--iscilerin calisdigi department_name tekrarlanmayan siyahisini cixarin
--(iki hell hem join hem subquery)
select distinct d.department_name from hr.departments d
left join hr.employees e
on d.department_id = e.department_id
where e.salary > 14000;

select department_name from hr.departments
where department_id in (select department_id from hr.employees where salary > 14000);

--5.Employees, departments cedvelinden iscinin ad, soyad, hire_date, department_name
--melumatini cixarin. (iki hell hem join hem subquery)
select e.first_name, e.last_name, e.hire_date, d.department_name from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

select e.first_name, e.last_name, e.hire_date,
(select d.department_name from hr.departments d where e.department_id = d.department_id )
 from hr.employees e
where e.department_id in (select d.department_id from hr.departments d);

--6. Departments cedvelinde manager_id-si bos olmayan departmentlerinin yerlesdiyi
--city,street_address melumatini cixaran sql yazin(subquery, join iki usulla)
select * from hr.locations l where l.location_id in 
(select d.location_id from hr.departments d where d.manager_id is not null );

select * from hr.locations l
     full join hr.departments d on l.location_id=d.location_id where d.manager_id is not null;

--7. Employees cedvelinden max ve min salary alan butun iscilerin siyahisini cixarin
select min(salary),max(salary) from hr.employees;

--8. Employees cedvelinden first_name, last_name, salary, average_salary ( bu umumi employees cedveli
--uzre butun iscilerin orta maasidir) ve eger maasi orta maasdan yuxaridirsa ‘Above total average salary’
--kicikdirse ‘below total average salary’ yazmaqla salary_status adli sutun cixarin

select case when (select avg(salary) from hr.employees) <salary then 'Above total average salary'
            when (select avg(salary) from hr.employees)>salary then 'below total average salary' end salary_status,first_name,last_name,salary,
                              (select avg(salary) from hr.employees b )  from hr.employees a ;









