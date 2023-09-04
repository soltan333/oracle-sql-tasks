--1. Table-ləri yaradın
create table db_history (CIF number references  Customer (customer_id),
                         Ac_no varchar2 (21) primary key,
                         balance_begin number,
                         balance_end number,
                         date_to date,
                         Val_id number references valyuta(val_id) ,
                         rate number);               
                        
create table Customer (Customer_id number primary key, 
                        Cust_name varchar2 (30),
                        surname varchar2 (40),
                        phone1 number (20),
                        phone2 number (20),
                        phone3 number (20),
                        email  varchar2 (40),
                        adress varchar2 (60));
                        
 Create table valyuta (val_id number primary key,
                       name varchar2 (10));

                       
                       
insert into Customer values (1001,'Anar','Bayramov',46538738,null,732837273,'anarbayramov@gmail.com','Nasimi str 16');

insert into Customer values (1002,'Vagif','Naghiyev',732837273,7392832938,null,'vagif005@gmail.com','Inshaatchilar ave 88');

insert into Customer values (1003,'Narmin','Huseynzada',56970704,null,46538738,'narminhuseyn@gmail.com','Lokbatan dis 13');

insert into Customer values (1004,'Aida','Xeyirli',null,46538738,56970704,'aidaxeyirli@gmail.com','Asad Ahmadov str 25');

insert into Customer values (1005,'Bahar','Taghiyeva',732837273,null,46538738,'bahartaghii@gmail.com','28 may str 45');

insert into Customer values (1006,'Sarkhan','Gurbanov',7392832938,56970704,null,'sarkhan@gmail.com','Xagani str 102');

insert into Customer values (1007,'Toghrul','Quluyev',450607943,null,732837273,'togrul0007@gmail.com','Sharifzada str 117');

insert into Customer values (1008,'Konul','Zeynalova',394098282,null,56970704,'konulzeynalova@gmail.com','U.Hajibeyov str 126');

insert into Customer values (1009,'Xanim','Rahimov',null,394098282,46538738, 'rahimovaxanim@gmail.com','X.Mammadov str 5');

insert into Customer values (1010,'Jahangir','Kamilli',78732323902,56970704,null,'jahkamilli@gmail.com','C.Cabbarlı str 44');

insert into Customer values (1011,'Anar','Bayramov',46538738,null,732837273,'anarbayramov@gmail.com','Nasimi str 16');


insert into Valyuta values (840, 'USD');
insert into Valyuta values (944, 'AZN');
insert into Valyuta values (978, 'EUR');
insert into Valyuta values (643, 'RUB');
insert into Valyuta values (826, 'GBP');


insert into db_history values (1001,11202019440000253253,2500,400,to_date('21.03.2022','dd.mm.yyyy'),978, 5);
insert into db_history values (1002,40140019789702043120,4000,1200,to_date('13.06.2020','dd.mm.yyyy'),978, 6);
insert into db_history values (1003,33882028405855713204,1300,200,to_date('04.11.2019','dd.mm.yyyy'),840, 4);
insert into db_history values (1004,11202019449331918206,8000,3400,to_date('17.12.2021','dd.mm.yyyy'),944, 7);
insert into db_history values (1004,33898018403101001120,5500,1200,to_date('17.12.2018','dd.mm.yyyy'),840, 7);
insert into db_history values (1005,33898018401849507204,10000,2000,to_date('06.07.2010','dd.mm.yyyy'),840, 5);
insert into db_history values (1005,33881019443152656216,400,35,to_date('30.09.2019','dd.mm.yyyy'), 944,7);
insert into db_history values (1006,33895419449440382304,6000,1450,to_date('31.05.2022','dd.mm.yyyy'),978, 4);
insert into db_history values (1007,43898019781817125204,9000,1000,to_date('23.10.2021','dd.mm.yyyy'),978, 6);
insert into db_history values (1008,33882029789456145204,7500,3200,to_date('25.02.2019','dd.mm.yyyy'),978, 5);
insert into db_history values (1009,33882018409408928204,66000,5600,to_date('18.03.2017','dd.mm.yyyy'),840, 3);
insert into db_history values (1009,33882019789146888212,13000,2400,to_date('15.01.2016','dd.mm.yyyy'),978, 8);
insert into db_history values (1010,33882018409809889204,5000,1300,to_date('27.08.2020','dd.mm.yyyy'),840, 10);
insert into db_history values (1010,33882018409376302204,4800,700,to_date('26.08.2022','dd.mm.yyyy'),840, 2);
insert into db_history values (1001,33882218409472019304,2700,250,to_date('11.03.2021','dd.mm.yyyy'),840, 6);
insert into db_history values (1003,33898018401109145120,4000,790,to_date('16.10.2019','dd.mm.yyyy'),840, 4);
insert into db_history values (1009,33898028409238892204,8600,4500,to_date('28.09.2022','dd.mm.yyyy'),978, 3);
insert into db_history values (1006,33882018401832633204,5000,1250,to_date('01.05.2020','dd.mm.yyyy'),840, 10);

select * from Customer;
select * from Valyuta;
select * from db_history;

--2) Hesabı olmayan müştərilərin adlarını ekrana çıxarmaq
select * from customer a
         full join db_history b on a.customer_id = b.cif where b.cif is null;
--3) ac_no,valuta_name ekrana cixartmaq
select a.ac_no,b.name from db_history a
                      natural join valyuta b; 

--4)ilk 5 hesab nomresi 33882,33898 ,11202 beraber olan müştəri adını ekrana cixartmaq
select a.cust_name from customer a 
         inner join db_history b on a.customer_id = b.cif 
where substr(b.ac_no,1,5) in (33882,33898,11202);

--5) Valuta kodu səhv yazılan hesabların siyahısını çıxarmaq
select * from db_history a
         full join valyuta b on a.val_id=b.val_id where a.val_id^=b.val_id;

--6) Her Musterinin adina gore Balance begin ve balanse end cəmini cixartmaq
select a.cust_name,b.balance_begin+b.balance_end from customer a 
                                         inner join db_history b on a.customer_id=b.cif ;

--7)33le baslayan butun hesab nomrelerinin aid oldugu müştərilərin adının
--sonuna date_to sütunundakı həftənin gününü birləşdirmək
select a.cust_name||to_char(b.date_to,'day') from customer a 
         inner join db_history b on a.customer_id=b.cif where substr(b.ac_no,1,2)=33;

--8) Ac_no hesab nomrelerinde 8,9,10 cu simvollari ekrana cixartmaq
select substr(a.ac_no,8,3),a.ac_no from db_history a;


--10)Bütün müştəri adlarını onların hesab nömrələrini və valutalarını ekrana çıxarın
select a.cust_name,b.ac_no,c.name from customer a
         left join db_history b on a.customer_id=b.cif
         inner join valyuta c on b.val_id=c.val_id;

--11)HesabIn açılma tarixi 3 aydan coxdursa qarşısında uzunmüddətli 
--əks halda qisamuddetli cixartmaq
select round(months_between(sysdate,date_to)),
case when round(months_between(sysdate,date_to))>3 then 'uzunmuddetli'
when round(months_between(sysdate,date_to))>3 then 'uzunmuddetli' end result from db_history;

--12)Ac_no sutunundan son 10 reqemi ekrana  cixartmaq
select ac_no, substr(ac_no,-10) from db_history;

--13) Musteri adinda yerlesen ilk a simvolunun indexini ekranan cixartmaq
select a.cust_name, instr(a.cust_name,'a',1) from customer a;

--14)rate 5-dən boyuk olan ve hesab nomresi 338 ile baslayan butun hesab nomrelerinin
--balanse beginini 0 etmək (select vasitəsilə)


--15)Hansı valutada hesab yoxdursa o valutaları çıxarın
select * from db_history a
         full join valyuta b on a.val_id=b.val_id where a.ac_no is null;       

--16)Hər müştərinin neçə hesabı oldugunu tapmaq
select count(b.cif),a.cust_name from customer a
         left join db_history b on a.customer_id= b.cif group by a.customer_id, a.cust_name;
     
--17) Bankda yalniz bir musteri hesabi olan musterinin adini ekrana cixartmaq
select count(b.cif),a.cust_name from customer a
         full join db_history b on a.customer_id= b.cif having count(b.cif)=1
          group by a.cust_name;

--18) Bankda en boyuk balanceEnd summaya malik 2 ci musterinin adini ekranan cixartmaq
select distinct a.cust_name, a.customer_id from customer a
         inner join db_history b on a.customer_id=b.cif group by a.customer_id 
order by sum(b.balance_end) desc fetch next 2 rows only ;

--19)Hesab nomresinin 5 ci simvolu 3 den boyuk musterilerin  adini soyadini ve
-- movcud olan hec olmazsa bir elaqe nomresini Phone aliasi vererek ekrana cixartmaq
select a.cust_name,a.surname,coalesce(a.phone1,a.phone2,a.phone3) phone from customer a
         inner join db_history b on a.customer_id=b.cif 
where substr (b.ac_no,5,1)>3 ;

--20)Musteri tablesindeki butun melumatlari ekrana  cixartmaq ele etmek lazim ki 
--null olan deyerler sifir ile evez olunsun
select nvl(a.customer_id,0),
       nvl(a.cust_name,0),
       nvl(a.surname,0),
       nvl(a.phone1,0),
       nvl(a.phone2,0),
       nvl(a.phone3,0),
       nvl(a.email,0),
       nvl(a.adress,0) from customer a;
       








