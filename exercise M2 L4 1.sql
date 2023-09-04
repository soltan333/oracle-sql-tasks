--1)Şəkildəki kimi tablelər qurmaq və  FK və PK uygun olaraq tənzimləmək
create table person(pk_person_id number primary key,
                    name varchar2(30),
                    email varchar2 (30));
                    
                
create table pasport_details(pk_pasport_id number ,
                             pasport_number varchar2 (20),
                             pk_person_id references dbo_person (pk_person_id));

insert into person values(1,'Anar','anaraliyev99@gmail.com');
insert into person values(2,'Bahar','baharbaharli92@gmail.com');
insert into person values(3,'Cahid','cahidaliyev77@gmail.com');
insert into person values(4,'Ulker','ulkeraliyeva1994@gmail.com');
insert into person values(5,'Murad','muradhuseynov89@gmail.com');
insert into person values(6,'Turkane','turusosmanliko55@gmail.com');
insert into person values(7,'Zeyneb','zeynebzeynallizz66@gmail.com');
insert into person values(8,'Samir','samirheyderli@gmail.com');
insert into person values(9,'Yusif','yusifserdarlistore@gmail.com');
insert into person values(10,'Samire','samkabeautybaku12@gmail.com');
insert into person values(11,'Mehman','mehmanbalakenli@gmail.com');

insert into PassportDetails values(101,'AA1999838',1);
insert into PassportDetails values(102,null,2);
insert into PassportDetails values(103,'AA5443767',3);
insert into PassportDetails values(104,'AA2434429',4);
insert into PassportDetails values(105,'AA4763213',5);
insert into PassportDetails values(106,'AA2311314',6);
insert into PassportDetails values(107,'AA7123456',7);
insert into PassportDetails values(108,'AA6456545',8);
insert into PassportDetails values(109,'AA8838792',9);
insert into PassportDetails values(110,'AA9323678',10);
insert into PassportDetails values(111,'BB9323678',11);



--2)Hər bir personun adini ve PasportNumberi ekrana cixartmaq və
-- id-ye core coxdan aza siralamaq
select a.name,b.pasport_number from person a
         inner join PassportDetails b on  a.pk_person_id=b.pk_person_id
order by a.pk_person_id desc;

--3)Passport id- si ən kiçik olan  personun adini cixartmaq
select a.name from person a
              inner join PassportDetails b on a.pk_person_id=b.pk_person_id
order by b.pk_pasport_id asc fetch next 1 rows only;

--4)EmailID sutunundan yerləşən emaillerin adini yalniz @ simvoluna qeder hisseni ekrana
--cixartmaq və personun adını ekrana çıxarmaq. Əgər bu iki sütundakı data eynidirsə
--yəni kəsdiyiniz hissə və şəxsin adı onda ekrana ‘strong’ sözü çıxsın
select substr(email,1,instr(email,'@')-1),name,
case when substr(email,1,instr(email,'@')-1)=name then 'strong' end result
from person;\

--5) Pasport melumati olmayan personu ekrana cixarmaq 
select * from person a
         left join PassportDetails b on a.pk_person_id=b.pk_person_id;-------------
         
--6)Pasport nomresi A ile baslayan personun adini ekrana cixarmaq
select a.name from person a
         inner join PassportDetails b on a.pk_person_id=b.pk_person_id 
where b.pasport_number like 'A%';

select * from person a
         inner join PassportDetails b on a.pk_person_id=b.pk_person_id;
              
       








                             
    
