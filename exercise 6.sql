--1) Ən çox maaş alan işcinin adını ekrana çıxartmaq 
select first_name from employees order by salary desc fetch next 1 rows  only;


--2) Ən az maaş alan 3 işcinin adını və soyadını ekrana çıxartmaq
select first_name, last_name from employees order by salary asc fetch next 3 rows only;


--3) Adında a hərfi olan və maaşı 500 dən çox işçilərin adını ,soyadını ,maaşını ekrana çıxartmaq
-- və siyahini maaşa görə azdan çoxa doğru düzmək və ilk 1 datanı istisna etmək
select e.first_name,e.last_name,e.salary from employees e where first_name like '%a%'
order by salary asc offset 1 rows ;


--4) Distinct-dən istifadə edərək Adları, soyadları ekrana çıxartmaq ve department_id-yə görə sıralamaq
-- (nə baş verdiyini comment şəklində yazın)


--5)Soyadları ve maaşlari ekrana çıxartmaq və adlara görə azalan sıra ilə düzmək
select last_name,salary from employees order by first_name desc;  


--6)Adının ilk hərfi V olan işçiləri çalışdıqları gün sayına görə çoxdan aza doğru düzərək ekrana
-- bütün dataları çıxarın  
select * from employees  where first_name like 'A%' order by (trunc (sysdate-hire_date)) desc;   


--7) Adında e hərfi olub ID-si 10-dan kiçik olan işçilərin adını azdan çoxa,
--maaşını çoxdan aza düzərək ekrana çıxartmaq
select * from employees e where e.first_name like '%e%' and e.employee_id<150 order by 
e.first_name asc, e.salary desc;


--8) Last_name-yə ailas verərək azdan çoxa doğru sıralamaq 
select e.last_name from employees e order by e.last_name asc; 
 

--9)Rəqəmlərlə order by-dan istifadə edərək  maaşa görə çoxdan aza düzərək 
--bütün işçilər haqqında infolari cixartmaq
select * from employees order by 8 desc;


--10) Ən yeni işə qəbul olmuş sonuncu işçini çıxmaq şərti ilə digər 3 işçini ekrana çıxarmaq	

select * from employees e order by e.hire_date offset 1 rows fetch next 3 rows only; 






















