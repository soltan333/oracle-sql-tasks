--1. Employees cədvəlində ad və soyadı birləşdirib sonuna @gmail.com yazaraq ekrana çıxarın
select lower(concat(concat(first_name,last_name),'@gmail.com')) from employees;


--2. Telefon nömrəsi sütununda 2-ci nöqtənin yerini * ilə əvəzləyin
select phone_number,
substr(phone_number,1,instr(phone_number,'.',1,2)-1) 
|| replace(phone_number,substr(phone_number,1,
instr(phone_number,'.',1,2)),'*') from employees


--3. Ad və soyadı eyni hərflə başlayan işçiləri ekrana çıxarın
select * from employees where substr(first_name ,1,1) = substr(last_name,1,1);
 
--4. Telefon nömrəsində 2-dən artıq . olanları cədvəldən silin
delete from employees where instr(phone_number,'.',1,3)>0;


--5. Adında qoşa nn və ya ll hərfi olanları ekrana çıxarın.
select case when first_name like '%nn%' then 'nn'
            when first_name like '%ll%' then 'll'
                end result,first_name from employees;
                
select * from employees where instr(first_name,'nn')>1 or instr(first_name,'ll')>1;
                
           

--6. Salary-si cüt ədəd olanları ekrana çıxarın
select salary from employees where mod (salary,2)=0;


--7. Hər işçinin işə qəbul olduğu gündən həmin ilin sonuncu gününə qədər neçə gün var hesablayın
select hire_date,to_date('31.12.'|| to_char(hire_date,'yyyy'),'dd.mm.yyyy')-hire_date from employees;

--8. Işçilərin işə qəbul olduğu tarixə nəzərən ilk bazar ertəsi tarixini ekrana çıxarın
select next_day (hire_date,'Sunday') from employees 


--9. İşçi ayın 15-dən qabaq işə qəbul olubsa ona həmin ay üzrə tam maaş verilir.
-- Əgər ayın 15-dən sonra işə qbul olubsa həmin ay üzrə maaşınınyarısı verilir.
-- Bunu nəzərə alaraq bütün işçilərin 2018-ci il yanvarın 1-nə qədər ümumilikdə
-- nə qədər maaş aldığını tapın. Commissiyaları da nəzərə alın
select salary,hire_date, months_between(to_date('01.01.2010','mm.dd.yyyy.'),
trunc(hire_date,'mm')-1)*nvl(salary*e.commission_pct,salary)
+case when to_char(hire_date,'dd')>15 then nvl(commission_pct*salary,salary)
else nvl(commission_pct*salary/2 , salary/2) end from employees e;
  
--10. İşçilərin cari tarixə nəzərən neçə ildir işlədiyini tapın
select round(months_between(sysdate,hire_date))/12  from employees;





