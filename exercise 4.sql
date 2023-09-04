merge into "archive"
using nobel_win
on(nobel_win.winner="archive".winner)
when matched then
update set "archive".subject= nobel_win.subject
when not matched then
insert values (nobel_win."date",nobel_win.subject,nobel_win.winner,nobel_win.country,
nobel_win.category,sysdate); 

select*from nobel_win;

--1. Bundan əvvəl yaratdığınız employees cədvəlinin soyad sütununa adı 
--emp_last_name_nn olan not null constraintini əlavə edin
select * from workers;
alter table workers modify last_name not null;

select u1.CONSTRAINT_NAME,u1.CONSTRAINT_TYPE,u2.column_name,u1.SEARCH_CONDITION_VC
 from user_constraints u1
 join user_cons_columns u2 on u1.constraint_name=u2.constraint_name
where u1.table_name='WORKERS';

alter table workers rename constraint SYS_C007599 to emp_last_name_nn ;

--2. Email sütunununa  adı emp_last_name_nn olan not null constraintini əlavə edin

-------------eyni adli constraint yaratmag olmaz 

--3. Salary sütununa adı emp_salary_min olan check contraintini əlavə edin. 
--Constraintə əsasən maaşlar 0-dan böyük olmalıdır
alter table workers modify salary constraint emp_salary_min check(salary>0);



--4. Email sütununa adı emp_email_uk1 olan unique constraintini əlavə edin

alter table workers modify email constraint emp_email_uk1 unique;


--5. Email sütununa qoyduğunuz constraintin adını emp_email_uk ilə əvəz edin

alter table workers rename constraint emp_email_uk1 to emp_email_uk;


--6. Soyad sütununda olan constrainti silin

alter table workers drop constraint emp_last_name_nn;

--7. Cədvəlinizdəki constraintlərin siyahısına baxın

select u1.CONSTRAINT_NAME,u1.CONSTRAINT_TYPE,u2.column_name,u1.SEARCH_CONDITION_VC
 from user_constraints u1
 join user_cons_columns u2 on u1.constraint_name=u2.constraint_name
where u1.table_name='WORKERS';


--8. Employees_archive adında dublikat cədvəl yaradın və employees cədvəlindəki
-- datalardan employee_id-si 240 və 250 arasında olanlar insert edilsin
create table Employees_archive as select * from workers;

select * from Employees_archive;

select * from Employees_archive where employee_id>240 and employee_id<250;


--9. Employees_archive cədvəlindəki constraintlərin siyahısına baxın.
-- 7-ci sual ilə müqayisə edərək nəticəni comment şəklində yazın\
select u1.CONSTRAINT_NAME,u1.CONSTRAINT_TYPE,u2.column_name,u1.SEARCH_CONDITION_VC
 from user_constraints u1
 join user_cons_columns u2 on u1.constraint_name=u2.constraint_name
where u1.table_name='Employees_archive';

-------constraint cedvelinde data yoxdur

--10. Employees_archive cədvəlindəki datanı əsas cədvəl ilə eyniləşdirin.














