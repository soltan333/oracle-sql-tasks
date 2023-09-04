Subquery.txt
create table mallar (mal_id number primary key,
                     mal_name varchar2(25),
                     m_buraxilma_tarix date,
                     mal_qiymeti number,
                     edv_faiz number,
                     kateqoria_id number references kateqoria(k_id));                   
                     
create table faktura (fak_id number primary key,
                      fak_name varchar2(25),
                      fak_tarix date); 
                      
create table kateqoria (k_id number primary key,
                        k_name varchar2(25)); 

create table f_m (f_id references faktura(fak_id),
                  m_id references mallar(mal_id));                        

insert into mallar values (1,'mal eti','05.nov.2020',10,5,11);
insert into mallar values (2,'corek','12.feb.2018',15,7,13); 
insert into mallar values (3,'yag','26.sep.2021',1,2,12);
insert into mallar values (4,'lavas','02.may.2019',20,10,13);
insert into mallar values (5,'quzu eti','01.may.2019',5,3,11);
insert into mallar values (6,'toyuq eti','30.mar.2021',10,5,11);
insert into mallar values (7,'qatiq','23.feb.2022',20,8,12); 
insert into mallar values (8,null,'11.oct.2021',18,7,12); 


insert into faktura values (21,'a123','27.june.2021');
insert into faktura values (22,'b756','22.oct.2020');
insert into faktura values (23,'c947','06.dec.2019');
insert into faktura values (24,'d237','11.aug.2021');
insert into faktura values (25,'e234','19.feb.2022'); 

insert into kateqoria values (11,'et');
insert into kateqoria values (12,'sud');
insert into kateqoria values (13,'un');
insert into kateqoria values (14,'yuyucu vasiteler');


insert into f_M values (21,3);
insert into f_M values (25,1);
insert into f_M values (22,5);
insert into f_M values (24,1);
insert into f_M values (23,2);
insert into f_M values (23,6);
insert into f_M values (21,7);
insert into f_M values (21,8);


--1)Mallar adli table yaratmaq Mal_Id,M_name,M_buraxilma_tarix,
--M_Bitme_Tarix,M_qiymeti,Edv  faizi ,kateqorya id
select * from mallar;

--2)Faktura adli table yaratmaq Fak_ID,Fak_Name,Fak_Tarix
select * from faktura;

--3)Kateqoriya table (id name)
select * from kateqoria;

--4) F_M table yaratmaq
select * from f_m;

--Taskda join-den istifade edilmeyecek!
--4) Her fakturada ne qeder mal oldugunu ekrana cixartmaq

 
--5) yalni sud mehsullarina aid mallari ekrana cixartmaq
select m.mal_name from mallar m where m.kateqoria_id=
(select k.k_id from kateqoria k where k.k_name='sud');

--6) et ve sud mehsullarinin qiymetini 10 faiz qaldirmaq
update mallar m set m.mal_qiymeti=m.mal_qiymeti*1.1 where m.kateqoria_id in 
(select k.k_id from kateqoria k where k.k_name in ('sud','et'));

--10) en cox mala sahib olan fakturanin adini ekrana cixartmaq
select f.fak_name from faktura f where f.fak_id=
(select fm.f_id from f_m fm group by fm.f_id having count(fm.m_id)=
(select max(count(f1.m_id)) from f_m f1 group by f1.f_id) );
 
--11) adinda a herfi olan mallarin vaxtinin bitmesine neche gun qaldigini teyin etmek


--12) mallarda hansisasa kateqoriyadan bir denede olsun mal yoxdursa hemin kateqoriyanin
-- adininekrana cixartmaq
select k.k_name from kateqoria k where k.k_id not in 
(select m.kateqoria_id from mallar m); 

--13) un mehsullarina aid mallarin adini ekrana cixartmaq
select m.mal_name from mallar m where m.kateqoria_id=
(select k.k_id from kateqoria k where k.k_name='un');
