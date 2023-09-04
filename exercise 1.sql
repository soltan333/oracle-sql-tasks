
create table employees (salesman_id number,
name varchar2(20),
city varchar2(20),
commissin number);

select*from employees;

insert into employees values(5001,
'James Hoog',
'New York',
 0.15);
 
 
insert into employees values(5002,
'Nail Knite',
'Paris',
0.13);

insert into employees values(5005,
'Pit Alex',
'London',
 0.11);
 
insert into employees values(5006,
 'Mc Lyon',
 'Paris',
 0.14);
 
insert into employees values(5007,
'Paul Adam',
'Rome',
0.13);

insert into employees values(5003,
'Lauson Hen',
'San Jose',
0.12);


--2.Select çəkərək daxil etdiyiniz datalara baxın
 
select*from employees;

--3.İnsertin 2-ci formasından istifadə edərək yeni bir sətrə öz ad və soyadınızı insert edin

insert into employees(name)values('Soltan Haciyev');

--4.Commission sütunundakı dataları 0.01 qədər artırın
update employees set commissin=commissin+0.01;

--5.Name sütununu full_name ilə əvəz edin
alter table employees rename column name to full_name; 

--6.Yaratdığınız cədvəlin adını dəyişdirin
alter table employees rename to salesmen;

select * from salesmen;

--7.Commission sütununun tipini dəyişdirməyə çalışın
--Sutun bos olmalidir

--8.Cədvəli silin
drop table salesmen;

--9.“Hello SQL” sözünü ekrana çıxarın
select 'Hello Sql' from dual;

--10.Üç müxtəlif sütunda data çıxarın və hər birinə alias verin




