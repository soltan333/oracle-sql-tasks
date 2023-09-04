create table info_sales
( trans_id number primary key,
  region varchar2(100),
  country varchar2(100), 
  city  varchar2(100),
  amount number
);

insert into info_sales values (1,'Asia','UAE','Abu Dhabi',400) ;
insert into info_sales values (2,'Asia','UAE','Abu Dhabi',600) ;
insert into info_sales values (3,'Asia','UAE','Duabi',300) ;
insert into info_sales values (4,'Asia','UAE','Duabi',120) ;
insert into info_sales values (5,'Africa','Egypt','Cairo',309) ;
insert into info_sales values (6,'Africa','Egypt','Cairo',123) ;
insert into info_sales values (7,'Europe','Spain','Madrid',109) ;
insert into info_sales values (8,'Europe','Spain','Madrid',153) ;
insert into info_sales values (9,'Europe','Spain','Barcelona',193) ;
insert into info_sales values (10,'Asia','Jordan','Amman',300) ;
insert into info_sales values (11,'Asia','Jordan','Zarqa',120) ;
commit;

--Yuxaridaki insertleri etmek.
select * from info_sales

-- her regionda olan ehali sayini tapmaq
select region,sum(amount) from info_sales group by region;

--Avropadan basqa diger regionlardaki ehali sayini tabmaq
select sum(amount) from info_sales where region ^='Europe' group by region; 

--her region uzre ehalinin ededi ortasini tapmaq
select avg(amount) from info_sales group by region;

--Egypt,Jordan,Spain olkelerinden olan ehalinin sayini tapmaq
select country,sum(amount) from info_sales where country='Egypt' or country='Jordan'
or country='Spain'  group by country; 

--her seherde ne qeder ehali var tapmaq
select city,sum(amount) from info_sales group by city; 

--her  qite,olkeye gore ehali sayi tapmaq
select region,country, sum(amount) from info_sales group by region,country;

--ortalama əhali sayı 300-dən çox olan regionları tapmaq
select region,avg(amount) from info_sales group by region having avg(amount)>300;

--ortalama əhali sayı 300-dən çox olan regionların sayını tapmaq
select count(region) from info_sales having sum(amount)>300 group by region; 
