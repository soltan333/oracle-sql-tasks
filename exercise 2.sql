--1. İşə qəbul olma tarixi null olan və adında b hərfi olan dataları çıxarın

select * from employees e where e.hire_date is null and e.first_name like '%b%';

--2. 2005-ci ildən əvvəl işə qəbul olan işçiləri çıxarın

select * from employees e where e.hire_date< to_date('01.01.2005','dd.mm.yyyy');

--3. Maaşının 50 faiz artırılmasından və azaldılmasından alınan nəticəni göstərən select yazın

select salary,salary*1.5 as artirma,salary*0.5 as azaldma  from employees;

--4. Maaşları 10 azn azaltmaq üçün update yazın

update employees set salary=salary+10;

select * from employees;

--5. İd-si 5-dən kiçik olanları cədvəldən silin

delete employees e where e.employee_id<5; 

--6. Soyadların ilk hərfi a son hərfi d olan və ya maaşı 2000-dən fərqli olan dataları çıxarın

select * from employees e where e.last_name like 'A%d' or e.salary!=2000; 

--7. Maaşının 10-a bölünməsindən alınan nəticəsi 200-dən aşağı olan işçi id-lərini çıxarın

select employee_id from employees;

--8. Employee_id-ni customer_id və salary-ni amount olaraq əvəz edərək selectdə çıxarın (alias)
 
select employee_id as customer_id, salary as amount from employees;

--9. 2007-ci ilin oktyabr ayında işə qəbul olan işçiləri tapın və bu sorğuda table aliasından istifadə edin

select * from employees e where e.hire_date between 
to_date('01.10.2007','dd.mm.yyyy') and to_date('31.10.2007','dd.mm.yyyy'); 

--11. Cədvələ bir sütun əlavə edin
 alter table employees add city varchar2(20);
 
--12. Bu sütunun adını sonra da tipini dəyişin;

alter table employees rename column city to date_birth;

alter table employees modify date_birth date;

--13. Cədvəlin adını dəyişin sonra 2 insert,1 update,1 delete əmrini yazın (insertin 2 versiyasından istifadə edin və update və delete əmrlərində where-dən istifadə edin)

alter table employees rename to workers;
select * from workers;

insert into workers (first_name,last_name)values
('Soltan','Haciyev');

update workers e set employee_id =500 where e.first_name='Soltan';

delete workers e where e.employee_id=500; 

--14. İşçinin job_id-si daxil etdiyiniz her hansi X adindan ferqli olanlari ve ya maasi 6000 olanlari ekrana cixartmaq 

select * from workers e where e.first_name!='Timothy' or e.salary= 6000;

--15. Department_id-si 10,20,30-dan fərqli olanları ekrana çıxarmaq

select * from workers e where e.department_id not in (10,20,30);

--16. Manager id-si 15-25 arasi olanlari sütun aliasından istifadə edərək ekrana çıxarmaq
 

--17. Hire_date '01.01.2019' olanlari ekrana cixratmaq

select * from workers e where e.hire_date=to_date('01.01.2019','dd.mm.yyyy'); 

--18. Komissiyasi 0.2-dən aşağı olanların komissiyasını null ilə dəyişdirin

update workers e set e.commission_pct=null where e.commission_pct<0.2;

--19. Şirkət üzrə ortalama maaş 20000-dir. Bütün işçilərin maaşlarının maksimal maaşdan nə qədər az vəya çox olduğunu ekrana çıxarın

select salary-20000 as ferq from workers;

--20. Adının uzunluğu 4 olanları ekrana çıxarın (length istifadə etməyin)

select * from workers e where e.first_name like '____'; 












