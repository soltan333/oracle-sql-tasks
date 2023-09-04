TURIST_INSERT.txt
create table Turistler( Ad varchar2(20),
                       Soyad varchar2(20),
                       Pasport number primary key,
                       Vetendasliq varchar2(20),
                       Cins references Cinsler(Id),
                       dogum_tarix date,pasport_date date);
create table Cinsler(Id number primary key,
                     Nov varchar2(5));
                     
create table Olkeler(Id number primary key ,
                     Ad varchar2(20));
                     
create table Olke_Tourist(Olke_ID number references Olkeler(Id),
                          Tourist_ID number references Turistler(Pasport));


insert into Turistler values('Anar','Alizade',1,'Azerbaycan',1,'27.jun.1979','02.oct.2005');
insert into Turistler values('Cahid','Cavadov',2,'Ingiltere',1,'12.jan.1999','25.may.2009');
insert into Turistler values('Bahar','Babazade',3,'Turkiye',2,'05.aug.1992','15.feb.2007');
insert into Turistler values(null,'Zahidov',4,'Azerbaycan',1,'20.sep.1990','19.mar.2004');
insert into Turistler values('Ulker','Nebiyeva',5,null,2,'11.mar.2000',null);
insert into Turistler values('Samire',null,6,'Rusiya',2,null,'22.nov.2010');
insert into Turistler values('Yusif','Serdarli',7,'Turkiye',1,'10.jul.1994','08.apr.2015');
insert into Turistler values('Meryem','Yusifova',8,'Almaniya',2,'18.aug.1985','24.dec.2017'); 
--select * from cinsler
insert into Cinsler values(1,'kisi');
insert into Cinsler values(2,'qadin');
insert into Olkeler values(1,'Turkiye');
insert into Olkeler values(2,'Almaniya');
insert into Olkeler values(3,'Fransa');
insert into Olkeler values(4,'Kanada');
insert into Olkeler values(5,'Ispaniya');
insert into Olkeler values(6,'Italiya');
insert into Olkeler values(7,'Isvecre');
insert into Olkeler values(8,'Ruminya');
insert into Olke_Tourist values(1,1);
insert into Olke_Tourist values(2,2);
insert into Olke_Tourist values(3,3);
insert into Olke_Tourist values(4,4);
insert into Olke_Tourist values(5,5);
insert into Olke_Tourist values(6,6);
insert into Olke_Tourist values(7,7);
insert into Olke_Tourist values(8,8);
insert into Olke_Tourist values(6,2);
insert into Olke_Tourist values(1,5);
insert into Olke_Tourist values(5,7);


--Turistler adli table qurmaq
--1) ID, Ad,Soyad,Pasport,Vetendasliq,Cins,dogum_tarix,pasport_date
select * from turistler;
--2) Cinsler tablesi olsun Id ve Nov sutunlari ile
select * from cinsler;
--3)Olkeler tablesi olsun Id ve Ad
select * from olkeler;
--4)Olke_Tourist tablesi Olke_ID,Tourist_ID
select * from olke_tourist;

--5) En cox olke gezmis 2 turistin adini ekrana cixartmaq
select t.ad from turistler t order by (select count(o.olke_id) from olke_tourist o 
where o.tourist_id=t.pasport )desc fetch next 2rows only ;

--6) Qadin turistlerin sayinin kisi turistlerin sayina nisbetini tabmaq
select 
(select count(t.cins) from turistler t where t.cins=(select c.id from cinsler c where c.nov='kisi'))/
(select count(t.cins) from turistler t where t.cins=(select c.id from cinsler c where c.nov='qadin'))from dual;

--7)Yalniz bir olkede olmus Turistin adini ve pasport nomresini ekrana cixartmaq
select t.ad,t.pasport,
(select count(o.olke_id) from olke_tourist o where o.tourist_id=t.pasport having count(o.olke_id)=1)
 from turistler t;


--8)En az yasli turistin melumatlarini ekrana cixartmaq
select * from turistler t where t.pasport in
(select t1.pasport from turistler t1 where floor(months_between(sysdate,t1.dogum_tarix))/12=
(select min(floor(months_between(sysdate,t2.dogum_tarix))/12) from turistler t2) )

--9) Qadin turistlerin ve yasi 20 den artiq olan turistlerin vetendasligini ekrana cixartmaq
select * from turistler t where floor(months_between(sysdate,t.dogum_tarix))/12>20
and t.cins=(select c.id from cinsler c where c.nov='qadin'); 

--10) pasportun tarixinin bitmesine 3 aydan az qalmis butun turistlerin pasport tarixlerini
--cari tarixden 10 gun evvel ile deyismek


--11) 10 dan artiq olkede olmus turistlerin adini ,soyadini ekrana cixartmaq
 select t.ad,t.soyad from turistler t where t.pasport in
 (select o.tourist_id from olke_tourist o group by o.tourist_id having count(o.olke_id)>10);

--12) Qadin cinsli ve yasi 30 dan cox olan hemcinin 2 den artiq olkede olmus turistlerin
--butun melumatlarini silmek
delete turistler t where t.pasport in
(select o.tourist_id from olke_tourist o group by o.tourist_id having count(o.olke_id)>2)
and t.cins=(select c.id from cinsler c where c.nov='qadin') and
floor(months_between(sysdate,t.dogum_tarix))/12>30;

--13)Kisi turistlerin gezdiyi butun olkeleri ve ikinci sutunda K herfi ekrana cixartmaq
--ve Qadin turistlerin gezdiyi butun olkeleri ve ikinci sutunda Q herfi ekrana cixartmaq

select case when o.id in
(select o1.olke_id from olke_tourist o1 where o1.tourist_id in
  (select t.pasport from turistler t where t.cins=
   (select c.id from cinsler c where c.nov='kisi')))then 'K' end result,
case when  o.id in
(select o1.olke_id from olke_tourist o1 where o1.tourist_id in
 (select t.pasport from turistler t where t.cins=
  (select c.id from cinsler c where c.nov='qadin')))then 'Q' end result, o.ad from olkeler o;


--14) yasi 25-35 araliginda olan turistlerin gezdiyi olkeleri ve olkenin qabaginda adinin 
--qisaltmasini ekrana cixartmaq
select o.ad from olkeler o
          where o.id in 
         (select o1.olke_id from olke_tourist o1 where o1.tourist_id in
         (select t.pasport from turistler t where floor(months_between(sysdate,t.dogum_tarix))/12 between 25 and 35 ));

select t.ad 
(select o.ad from olkeler o where o.id in(select o1.olke_id from olke_tourist o1 where o1.tourist_id=t.pasport))from turistler t where t.pasport in 
                           (select o.tourist_id from olke_tourist o) 
and floor(months_between(sysdate,t.dogum_tarix))/12 between 25 and 35;


--15) qadin turistlerin gezdiyi lakin kisi turistlerin gezmediyi olkelei ekrana cixartmaq
select o.ad from olkeler o where o.id not in
 (select o1.olke_id from olke_tourist o1 where o1.tourist_id not in
    (select t.pasport from turistler t where t.cins =
         (select c.id from cinsler c where c.nov='qadin')));












